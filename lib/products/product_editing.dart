import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
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
  final List<String> _brands = <String>[
    'BRAND_A',
    'BRAND_B',
    'BRAND_C',
    'BRAND_D',
  ];
  final List<String> _categories = <String>[
    'CATEGORY_A',
    'CATEGORY_B',
    'CATEGORY_C',
    'CATEGORY_D',
  ];
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
                    Text('Edit Product', style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w400)),
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
                InkWell(
                  highlightColor: transparent,
                  splashColor: transparent,
                  hoverColor: transparent,
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: black,
                      boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 2, blurRadius: 3, offset: const Offset(0, 5))],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: grey.withOpacity(.5), width: .3),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.product == null ? 'ADD' : "EDIT", style: const TextStyle(color: white, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(height: .2, thickness: .2, color: grey.withOpacity(.5), indent: 25, endIndent: 25),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: white,
                        border: Border.all(color: grey.withOpacity(.5), width: .3),
                        boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 4, blurRadius: 5, offset: const Offset(0, 10))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Basic Information", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          Text("Brand Name", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: CustomDropdown<String>(
                              items: _brands,
                              initialItem: _brands[0],
                              onChanged: (String value) {},
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 60,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: CustomDropdown<String>(
                                    items: _categories,
                                    initialItem: _categories[0],
                                    onChanged: (String value) {},
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: TextField(
                                    style: const TextStyle(color: grey),
                                    onChanged: (String text) {},
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(color: grey),
                                      hintText: "10DT",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(color: grey, width: .3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: white,
                        border: Border.all(color: grey.withOpacity(.5), width: .3),
                        boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 4, blurRadius: 5, offset: const Offset(0, 10))],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
