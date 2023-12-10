import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  final String imageUrl;
  final String title;
  final double price;

  Product({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}

class ProductController extends GetxController {
  final products = <Product>[
    Product(
        imageUrl: './assets/images/store_images/images1.jpg',
        // imageUrl: Image(image: AssetImage("./assets/images/store_images/images1.jpeg")),
        title: 'Product 1',
        price: 19.99),
    Product(
        imageUrl: './assets/images/store_images/images2.jpg',
        title: 'Product 2',
        price: 29.99),
    Product(
        imageUrl: './assets/images/store_images/images3.jpg',
        title: 'Product 3',
        price: 29.99),
    Product(
        imageUrl: './assets/images/store_images/images4.jpg',
        title: 'Product 4',
        price: 29.99),
    // Add more products as needed
  ].obs;
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.imageUrl,
            height: 80,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            product.title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            '\$${product.price.toString()}',
            style: TextStyle(fontSize: 14.0, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

// class ProductGridScreen extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Grid'),
//       ),
//       body: SingleChildScrollView(
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 8.0,
//             mainAxisSpacing: 8.0,
//           ),
//           itemCount: productController.products.length,
//           itemBuilder: (context, index) {
//             return ProductCard(product: productController.products[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

class ProductGridScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Grid'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: productController.products[index]);
        },
      ),
    );
  }
}
