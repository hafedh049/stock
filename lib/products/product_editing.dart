import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stock/models/product_model.dart';
import 'package:stock/utils/colors.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key, this.product});
  final Product? product;
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  bool _editState = false;
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
                    Text('Edit Product', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'Products ', style: TextStyle(fontSize: 12.sp, color: Theme.of(context).textTheme.bodyLarge!.color)),
                          TextSpan(text: '• Edit Product', style: TextStyle(color: grey, fontSize: 12.sp)),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) setS) {
                    return InkWell(
                      highlightColor: transparent,
                      splashColor: transparent,
                      hoverColor: transparent,
                      onTap: () {},
                      onHover: (bool hoverState) => setS(() => _editState = hoverState),
                      child: AnimatedContainer(
                        duration: 700.ms,
                        decoration: BoxDecoration(
                          color: _editState ? grey : white,
                          boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 2, blurRadius: 3, offset: const Offset(0, 5))],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: grey.withOpacity(.5), width: .3),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(widget.product == null ? 'ADD' : "EDIT", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    );
                  },
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
