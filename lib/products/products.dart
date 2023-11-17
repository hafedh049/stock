import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      body: GestureDetector(
        onTap: () {
          AdaptiveTheme.of(context).toggleThemeMode();
        },
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Products', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)),
                      Text('Products • List', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                  const Spacer(),
                  AnimatedButton(
                    height: 35,
                    width: 90,
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.plus, size: 15),
                        SizedBox(width: 10),
                        Text('ADD', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Theme.of(context).colorScheme.background.withRed(150)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
