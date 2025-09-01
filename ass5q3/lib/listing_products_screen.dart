import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart'; // Import your CartScreen class
import 'product_provider.dart';

class ListingProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(), // Navigate to the CartScreen
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          var product = productProvider.products[index];
          return ListTile(
            leading: Image.network(
  product.image,
  errorBuilder: (context, error, stackTrace) {
    return Text('Image failed to load'); // Display a text message in case of an error
  },
),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: product.addedToCart
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          productProvider.removeFromCart(index);
                        },
                      ),
                    ],
                  )
                : IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      productProvider.addToCart(index);
                    },
                  ),
          );
        },
      ),
    );
  }
}
