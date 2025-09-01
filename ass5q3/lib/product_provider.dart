import 'package:flutter/material.dart';
import 'product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [
    Product(image:('assets/photo-1542291026-7eec264c27ff.jpg') , name: 'Product 1', price: 100),

    Product(image:('assets/photo-1556048219-bb6978360b84.jpg') , name: 'Product 2', price: 150),
    // Add more products here...
    Product(image:('assets/photo-1560343090-f0409e92791a.jpg') , name: 'Product 3', price: 500),
    // Add more products here...
    Product(image:('assets/photo-1560769629-975ec94e6a86.jpg') , name: 'Product 4', price: 630),
    // Add more products here...
    Product(image:('assets/photo-1525966222134-fcfa99b8ae77.jpg') , name: 'Product 5', price: 440),
    // Add more products here...
    Product(image:('assets/photo-1587563871167-1ee9c731aefb.jpg') , name: 'Product 6', price: 750),
    // Add more products here...
    Product(image:('assets/photo-1590483736622-39da8acf7eb8.jpg') , name: 'Product 7', price: 550),
    // Add more products here...
    Product(image:('assets/photo-1607522370275-f14206abe5d3.jpg') , name: 'Product 8', price: 870),
    // Add more products here...
    Product(image:('assets/photo-1617152623457-4c9b639926d7.jpg') , name: 'Product 9', price: 300),
    // Add more products here...
    Product(image:('assets/photo-1621881538090-b2b5ffaa996a.jpg') , name: 'Product 10', price: 900),
    // Add more products here...
  ];

  List<Product> get products => _products;

  void addToCart(int index) {
    _products[index].addedToCart = true;
    notifyListeners();
  }

  void removeFromCart(int index) {
    _products[index].addedToCart = false;
    notifyListeners();
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var product in _products) {
      if (product.addedToCart) {
        total += product.price;
      }
    }
    return total;
  }
}
