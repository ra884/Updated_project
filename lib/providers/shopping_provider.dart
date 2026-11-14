import 'package:flutter/material.dart';
import 'package:flutter_full_application/models/product_model.dart';

class ShoppingProvider extends ChangeNotifier{
  List<Product> products = [
    Product(icon: Icons.phone_android, name: 'Smartphone', price: 699.99),
    Product(icon: Icons.laptop, name: 'Laptop', price: 1099.99),
    Product(icon: Icons.headphones, name: 'Headphones', price: 89.99),
    Product(icon: Icons.watch, name: 'Smartwatch', price: 199.99),
    Product(icon: Icons.camera_alt, name: 'Camera', price: 549.99),
    Product(icon: Icons.speaker, name: 'Bluetooth Speaker', price: 59.99),
    Product(icon: Icons.tablet, name: 'Tablet', price: 399.99),
    Product(icon: Icons.keyboard, name: 'Keyboard', price: 49.99),
    Product(icon: Icons.mouse, name: 'Wireless Mouse', price: 29.99),
    Product(icon: Icons.gamepad, name: 'Game Controller', price: 69.99),
    Product(icon: Icons.tv, name: '4K Television', price: 799.99),
    Product(icon: Icons.print, name: 'Printer', price: 149.99),
    Product(icon: Icons.router, name: 'Wi-Fi Router', price: 79.99),
    Product(icon: Icons.mic, name: 'Microphone', price: 119.99),
    Product(icon: Icons.monitor, name: 'Computer Monitor', price: 279.99),
    Product(icon: Icons.memory, name: 'USB Flash Drive', price: 19.99),
    Product(icon: Icons.power, name: 'Power Bank', price: 39.99),
    Product(icon: Icons.lightbulb, name: 'Smart Light Bulb', price: 24.99),
    Product(icon: Icons.videocam, name: 'Webcam', price: 89.99),
    Product(icon: Icons.storage, name: 'External Hard Drive', price: 109.99),
  ];

  List<Product> cartItems = [];
  void addToCart(Product item){
    if(!cartItems.contains(item)){
      cartItems.add(item);
    }
    item.quantity++;
    notifyListeners();
  }
  void removeFromCart(Product item){
    if(item.quantity==1){
      cartItems.remove(item);
    }
    item.quantity--;
    notifyListeners();
    
  }
  double calcAmount(){
    double total =0;
    for(var item in cartItems){
      total+=item.quantity*item.price;
    }
    return total;
  }
}
