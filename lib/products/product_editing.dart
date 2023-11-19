import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stock/models/product_model.dart';
import 'package:stock/utils/colors.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key, this.product});
  final Product? product;
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final QuillController _descriptionController = QuillController.basic();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final List<String> _brands = <String>['BRAND_A', 'BRAND_B', 'BRAND_C', 'BRAND_D'];
  final List<String> _categories = <String>['CATEGORY_A', 'CATEGORY_B', 'CATEGORY_C', 'CATEGORY_D'];

  @override
  void dispose() {
    _dateController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

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
                            height: 50,
                            child: CustomDropdown<String>(
                              items: _brands,
                              initialItem: _brands[0],
                              onChanged: (String value) {},
                              headerBuilder: (BuildContext context, String text) => Text(text, style: const TextStyle(color: grey, fontWeight: FontWeight.w500)),
                              closedSuffixIcon: const Icon(FontAwesomeIcons.chevronDown, color: grey, size: 12),
                              expandedSuffixIcon: const Icon(FontAwesomeIcons.chevronUp, color: grey, size: 12),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 90,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Category ★", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: SizedBox(
                                          height: 50,
                                          child: CustomDropdown<String>(
                                            items: _categories,
                                            initialItem: _categories[0],
                                            onChanged: (String value) {},
                                            headerBuilder: (BuildContext context, String text) => Text(text, style: const TextStyle(color: grey, fontWeight: FontWeight.w500)),
                                            closedSuffixIcon: const Icon(FontAwesomeIcons.chevronDown, color: grey, size: 12),
                                            expandedSuffixIcon: const Icon(FontAwesomeIcons.chevronUp, color: grey, size: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Price ★", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 52,
                                        child: TextField(
                                          style: const TextStyle(color: grey, fontWeight: FontWeight.w500),
                                          onChanged: (String text) {},
                                          decoration: InputDecoration(
                                            hintStyle: const TextStyle(color: grey, fontWeight: FontWeight.w500),
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
                          const SizedBox(height: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Product Name ★", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 52,
                                child: TextField(
                                  style: const TextStyle(color: grey, fontWeight: FontWeight.w500),
                                  onChanged: (String text) {},
                                  decoration: InputDecoration(
                                    hintStyle: const TextStyle(color: grey, fontWeight: FontWeight.w500),
                                    hintText: "Product Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(color: grey, width: .3),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 300,
                            child: QuillProvider(
                              configurations: QuillConfigurations(
                                controller: _descriptionController,
                                sharedConfigurations: const QuillSharedConfigurations(locale: Locale('en')),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Description ★", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 10),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: grey, width: 1),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: <Widget>[
                                          const QuillToolbar(configurations: QuillToolbarConfigurations(showSmallButton: true, showAlignmentButtons: true, showDirection: true)),
                                          const SizedBox(height: 10),
                                          const Divider(height: .5, thickness: .5, color: grey, indent: 25, endIndent: 25),
                                          const SizedBox(height: 10),
                                          Expanded(child: Padding(padding: const EdgeInsets.all(8), child: QuillEditor.basic())),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: white,
                            border: Border.all(color: grey.withOpacity(.5), width: .3),
                            boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 4, blurRadius: 5, offset: const Offset(0, 10))],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Publish Date ★", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 70,
                                  child: TextfieldDatePicker(
                                    cupertinoDatePickerBackgroundColor: Colors.white,
                                    cupertinoDatePickerMaximumDate: DateTime(2099),
                                    cupertinoDatePickerMaximumYear: 2099,
                                    cupertinoDatePickerMinimumYear: 1990,
                                    cupertinoDatePickerMinimumDate: DateTime(1990),
                                    cupertinoDateInitialDateTime: DateTime.now(),
                                    materialDatePickerFirstDate: DateTime.now(),
                                    materialDatePickerInitialDate: DateTime.now(),
                                    materialDatePickerLastDate: DateTime(2099),
                                    preferredDateFormat: DateFormat('dd-MMMM-' 'yyyy'),
                                    textfieldDatePickerController: _dateController,
                                    style: const TextStyle(color: grey, fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(color: grey, fontWeight: FontWeight.w500),
                                      hintText: "Date",
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: grey, width: .3)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
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
