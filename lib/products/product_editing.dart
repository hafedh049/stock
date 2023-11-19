import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stock/utils/colors.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Products', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)),
                    RichText(text: TextSpan(children: <TextSpan>[TextSpan(text: 'Products ', style: TextStyle(fontSize: 12.sp, color: Theme.of(context).textTheme.bodyLarge!.color)), TextSpan(text: '• List', style: TextStyle(color: grey, fontSize: 12.sp))])),
                  ],
                ),
                const Spacer(),
                TextButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(grey)),
                  onPressed: () {},
                  child: const Row(mainAxisSize: MainAxisSize.min, children: <Widget>[Icon(FontAwesomeIcons.plus, size: 15), SizedBox(width: 10), Text('ADD', style: TextStyle(fontWeight: FontWeight.bold))]),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
