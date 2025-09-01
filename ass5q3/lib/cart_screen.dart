import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          var product = productProvider.products[index];
          if (product.addedToCart) {
            return ListTile(
              leading: Image.asset(product.image,),
              // width: 1080,
              // height: 764,
              // fit: BoxFit.cover,),
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${productProvider.calculateTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  productProvider.products.forEach((product) {
                    if (product.addedToCart) {
                      productProvider.removeFromCart(productProvider.products.indexOf(product));
                    }
                  });
                },
                child: Text('BUY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

