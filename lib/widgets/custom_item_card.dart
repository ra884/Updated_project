import 'package:flutter/material.dart';
import 'package:flutter_full_application/models/product_model.dart';
import 'package:flutter_full_application/providers/shopping_provider.dart';
import 'package:provider/provider.dart';

class CustomItemCard extends StatelessWidget {
  final Product product;
  CustomItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        spacing: 20,
        mainAxisAlignment: .center,
        children: [
          Icon(
            product.icon,
            size: 50,
            color: const Color.fromARGB(255, 150, 76, 220),
          ),
          Text(product.name, style: TextStyle(fontSize: 30, fontWeight: .bold)),
          Text("\$${product.price}"),
          SizedBox(
            width: 200,
            height: 40,
            child: Consumer<ShoppingProvider>(
              builder: (context, value, child) {
                bool isClicked = value.cartItems.contains(product);

                return TextButton(
                  onPressed: () {
                    isClicked ? null : value.addToCart(product);
                  },
                  child: Text(
                    isClicked ? "Added ✓" : "Add to cart",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: isClicked
                        ? Colors.blueGrey
                        : const Color.fromARGB(255, 150, 76, 220),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
