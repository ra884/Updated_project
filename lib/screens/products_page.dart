import 'package:flutter/material.dart';
import 'package:flutter_full_application/providers/shopping_provider.dart';
import 'package:flutter_full_application/screens/cart_page.dart';
import 'package:flutter_full_application/widgets/custom_item_card.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});
  @override
  Widget build(BuildContext context) {
    var shoppingProvider = context.read<ShoppingProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome!"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 150, 76, 220),
      ),
      body: Center(
        child: Container(
          width: 800,
          child: Center(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) =>
                  CustomItemCard(product: shoppingProvider.products[index]),
              itemCount: shoppingProvider.products.length,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
