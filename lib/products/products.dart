import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsContainer extends StatefulWidget {
  const ProductsContainer({super.key});

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          children: <Widget>[
            Text('Products', style: TextStyle(fontSize: 25.sp)),
          ],
        ),
      ),
    );
  }
}
