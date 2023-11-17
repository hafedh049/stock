import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stock/products/products_list.dart';
import 'package:stock/utils/colors.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProductsContainer extends StatefulWidget {
  const ProductsContainer({super.key});

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  final TextEditingController _productFilter = TextEditingController();
  final TextfieldTagsController _tagsController = TextfieldTagsController();
  final FocusNode _kFocus = FocusNode();

  @override
  void dispose() {
    _productFilter.dispose();
    _tagsController.dispose();
    _kFocus.dispose();
    super.dispose();
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
                    Text('Products', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)),
                    RichText(text: TextSpan(children: <TextSpan>[TextSpan(text: 'Products ', style: TextStyle(fontSize: 12.sp, color: Theme.of(context).textTheme.bodyLarge!.color)), TextSpan(text: '• List', style: TextStyle(color: grey, fontSize: 12.sp))])),
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
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: <BoxShadow>[BoxShadow(color: grey.withOpacity(.1), blurStyle: BlurStyle.inner, spreadRadius: 4, blurRadius: 5, offset: const Offset(0, 10))],
                ),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _productFilter,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: const SizedBox(width: 16),
                        prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 12),
                        hintText: 'Search by product name',
                        hintStyle: TextStyle(fontSize: 12.sp, color: grey.withOpacity(1), fontWeight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldTags(
                      textfieldTagsController: _tagsController,
                      textSeparators: const <String>[' ', ',', ';'],
                      letterCase: LetterCase.normal,
                      validator: (String tag) {
                        if (_tagsController.getTags!.contains(tag)) {
                          return 'You already entered that.';
                        }
                        return null;
                      },
                      inputfieldBuilder: (BuildContext context, TextEditingController tec, FocusNode fn, String? error, void Function(String)? onChanged, void Function(String)? onSubmitted) {
                        return (BuildContext context, ScrollController sc, List<String> tags, void Function(String) onTagDelete) {
                          return RawKeyboardListener(
                            focusNode: _kFocus,
                            onKey: (RawKeyEvent event) {
                              if (event is KeyDownEvent) {
                                if (<LogicalKeyboardKey>[LogicalKeyboardKey.space, LogicalKeyboardKey.enter, LogicalKeyboardKey.numpadEnter, LogicalKeyboardKey.comma, LogicalKeyboardKey.semicolon].contains(event.logicalKey)) {
                                  fn.requestFocus();
                                }
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            ),
                          );
                        };
                      },
                    ),
                    const SizedBox(height: 10),
                    Expanded(child: ProductsList()),
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
