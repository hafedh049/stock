import 'dart:convert';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stock/models/category_model.dart';
import 'package:stock/models/product_model.dart';
import 'package:stock/utils/colors.dart';
import 'package:stock/utils/helpers.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  final TextfieldTagsController _tagsController = TextfieldTagsController();
  final FocusNode _kFocus = FocusNode();

  final List<LogicalKeyboardKey> _keys = <LogicalKeyboardKey>[LogicalKeyboardKey.space, LogicalKeyboardKey.enter, LogicalKeyboardKey.numpadEnter, LogicalKeyboardKey.comma, LogicalKeyboardKey.semicolon];

  @override
  void dispose() {
    _keys.clear();
    _tagsController.dispose();
    _kFocus.dispose();
    super.dispose();
  }

  Future<List<CategoryModel>> _loadProducts() async {
    final String jsonString = await rootBundle.loadString("assets/test.json");
    final List<dynamic> productsJson = json.decode(jsonString);

    final Map<String, List<Product>> productsByCategory = {};

    while (productsJson.isNotEmpty) {
      final Product product = Product.fromJson(productsJson.first);
      final String category = product.productCategory;
      if (productsByCategory.containsKey(category)) {
        productsByCategory[category]!.add(product);
      } else {
        productsByCategory[category] = [product];
      }

      productsJson.removeAt(0);
    }

    final List<CategoryModel> categories = await Future.wait(
      productsByCategory.entries.map(
        (MapEntry<String, List<Product>> entry) async {
          List<int> picture = await getProductPicture(entry.value.first.productPictures);
          return CategoryModel(
            products: entry.value,
            category: entry.key,
            categoryImage: picture,
            numberOfProducts: entry.value.length,
            brands: Set<String>.from(entry.value.map((Product e) => e.productBrand)).take(5).toList(),
          );
        },
      ).toList(),
    );

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Products Categories', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)),
                    RichText(text: TextSpan(children: <TextSpan>[TextSpan(text: 'Products ', style: TextStyle(fontSize: 12.sp, color: Theme.of(context).textTheme.bodyLarge!.color)), TextSpan(text: '• Categories', style: TextStyle(color: grey, fontSize: 12.sp))])),
                  ],
                ),
                const Spacer(),
                AnimatedButton(
                  height: 35,
                  width: 90,
                  onPressed: () {},
                  child: const Row(mainAxisSize: MainAxisSize.min, children: <Widget>[Icon(FontAwesomeIcons.plus, size: 15), SizedBox(width: 10), Text('ADD', style: TextStyle(fontWeight: FontWeight.bold))]),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: white.withOpacity(.95),
                  boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 4, blurRadius: 5, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFieldTags(
                        textfieldTagsController: _tagsController,
                        textSeparators: const <String>[' ', ',', ';'],
                        letterCase: LetterCase.normal,
                        validator: (String tag) => _tagsController.getTags!.contains(tag) ? 'You already entered that.' : null,
                        inputfieldBuilder: (BuildContext context, TextEditingController tec, FocusNode fn, String? error, void Function(String)? onChanged, void Function(String)? onSubmitted) {
                          return (BuildContext context, ScrollController sc, List<String> tags, void Function(String) onTagDelete) {
                            return RawKeyboardListener(
                              focusNode: _kFocus,
                              onKey: (RawKeyEvent event) => event is KeyDownEvent && _keys.contains(event.logicalKey) ? fn.requestFocus() : null,
                              child: TextField(
                                controller: tec,
                                focusNode: fn,
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                  hintText: _tagsController.hasTags ? '' : "Filter by category",
                                  hintStyle: TextStyle(color: grey, fontSize: 12.sp, fontWeight: FontWeight.w400),
                                  errorText: error,
                                  suffixIcon: IconButton(onPressed: () => _tagsController.clearTags(), icon: const Icon(FontAwesomeIcons.x, size: 15)),
                                  prefixIcon: tags.isNotEmpty
                                      ? SingleChildScrollView(
                                          controller: sc,
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: tags.map(
                                              (String tag) {
                                                return Container(
                                                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), border: Border.all(color: grey, width: .5)),
                                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[Text(tag, style: const TextStyle(fontWeight: FontWeight.w500)), const SizedBox(width: 8), InkWell(child: const Icon(Icons.cancel, size: 14.0), onTap: () => onTagDelete(tag))],
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        )
                                      : null,
                                ),
                                onChanged: onChanged,
                                onSubmitted: (String text) {
                                  onSubmitted != null ? onSubmitted(text) : null;
                                  fn.requestFocus();
                                },
                              ),
                            );
                          };
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(height: .2, thickness: .2, color: grey.withOpacity(.5), indent: 25, endIndent: 25),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: FutureBuilder<List<CategoryModel>>(
                          future: _loadProducts(),
                          builder: (BuildContext context, AsyncSnapshot<List<CategoryModel>> snapshot) {
                            if (snapshot.hasData) {
                              return Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runAlignment: WrapAlignment.center,
                                spacing: 20,
                                runSpacing: 20,
                                children: snapshot.data!
                                    .map(
                                      (CategoryModel category) => Container(
                                        width: 300,
                                        height: 400,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: grey.withOpacity(.3), width: .5),
                                          borderRadius: BorderRadius.circular(25),
                                          color: Theme.of(context).colorScheme.background,
                                          boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 4, blurRadius: 5, offset: const Offset(0, 10))],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Container(height: 200, decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)), color: getColor())),
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  const SizedBox(height: 20),
                                                  Center(child: SizedBox(width: 125, height: 125, child: Image.memory(Uint8List.fromList(category.categoryImage)))),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    children: <Widget>[
                                                      const Spacer(),
                                                      Container(
                                                        padding: const EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          border: Border.all(color: grey.withOpacity(.3), width: .5),
                                                          color: Theme.of(context).colorScheme.background,
                                                          boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 5))],
                                                        ),
                                                        child: Center(child: Icon(FontAwesomeIcons.tree, color: blue, size: 15)),
                                                      ),
                                                      const SizedBox(width: 20),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(category.category[0].toUpperCase() + category.category.substring(1), style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: <Widget>[
                                                      Text("Number of products", style: TextStyle(color: grey, fontSize: 13.sp, fontWeight: FontWeight.w400)),
                                                      const Spacer(),
                                                      Text(category.numberOfProducts.toString(), style: TextStyle(color: grey, fontSize: 13.sp, fontWeight: FontWeight.w400)),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Expanded(
                                                    child: Wrap(
                                                      alignment: WrapAlignment.start,
                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                      runAlignment: WrapAlignment.start,
                                                      spacing: 10,
                                                      runSpacing: 10,
                                                      children: category.brands
                                                          .map(
                                                            (String e) => Container(
                                                              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), border: Border.all(color: grey, width: .5)),
                                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                              child: Text(e[0].toUpperCase() + e.substring(1), style: const TextStyle(fontWeight: FontWeight.w500)),
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            } else if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else {
                              return Center(child: Text(snapshot.error.toString()));
                            }
                          },
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
    );
  }
}
