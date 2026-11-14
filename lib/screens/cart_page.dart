import 'package:flutter/material.dart';
import 'package:flutter_full_application/providers/shopping_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Welcome!"),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 150, 76, 220),
          ),
          body: Center(
            child: Container(
              width: 600,
              child: ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(7),
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 233, 222, 235),
                    leading: Icon(value.cartItems[index].icon),
                    title: Text(value.cartItems[index].name),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    subtitle: Text("\$${value.cartItems[index].price}"),
                    trailing: Row(
                      mainAxisSize: .min,
                      spacing: 10,
                      children: [
                        IconButton(
                          onPressed: () {
                            value.addToCart(value.cartItems[index]);
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text("${value.cartItems[index].quantity}"),
                        IconButton(
                          onPressed: () {
                            value.removeFromCart(value.cartItems[index]);
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          bottomNavigationBar: SizedBox(
            width: double.infinity,
            height: 50,
            child: Container(
              color: const Color.fromARGB(255, 240, 232, 241),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Total amount : \$${value.calcAmount().toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: .bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
