import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stock/utils/colors.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProductsContainer extends StatefulWidget {
  const ProductsContainer({super.key});

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  
  double _distanceToField = 0;
  final TextEditingController _productFilter = TextEditingController();
  final TextfieldTagsController _tagsController = TextfieldTagsController();
  
  @override
  void dispose() {
    _productFilter.dispose();
    _tagsController.dispose();
    super.dispose();
  }
  
 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
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
                        border: null,
                        enabledBorder: null,
                        focusedBorder: null,
                        prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 12),
                        hintText: 'Search by product name',
                        hintStyle: TextStyle(fontSize: 12.sp, color: grey.withOpacity(1), fontWeight: FontWeight.normal),
                      ),
                    ),
                    TextFieldTags(
                      letterCase: LetterCase.normal,
                      inputfieldBuilder: (BuildContext context, TextEditingController tec, FocusNode fn, String? error, void Function(String)? onChanged, void Function(String)? onSubmitted) {
                       return (context, sc, tags, onTagDelete){
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            controller: tec,
                            focusNode: fn,
                            decoration: InputDecoration(
                              isDense: true,
                              border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 74, 137, 92), width: 3.0)),
                              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 74, 137, 92), width: 3.0)),
                              helperText: 'Enter language...',
                              helperStyle: const TextStyle(color: Color.fromARGB(255, 74, 137, 92)),
                              hintText: _tagsController.hasTags ? '' : "Enter tag...",
                              errorText: error,
                              prefixIconConstraints: BoxConstraints(maxWidth: _distanceToField * 0.74),
                              prefixIcon: tags.isNotEmpty
                                  ? SingleChildScrollView(
                                      controller: sc,
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: tags.map((String tag) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                            color: Color.fromARGB(255, 74, 137, 92),
                                          ),
                                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                child: Text(
                                                  '#$tag',
                                                  style: const TextStyle(color: Colors.white),
                                                ),
                                                onTap: () {
                                                  print("$tag selected");
                                                },
                                              ),
                                              const SizedBox(width: 4.0),
                                              InkWell(
                                                child: const Icon(
                                                  Icons.cancel,
                                                  size: 14.0,
                                                  color: Color.fromARGB(255, 233, 233, 233),
                                                ),
                                                onTap: () {
                                                  onTagDelete(tag);
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList()),
                                    )
                                  : null,
                            ),
                            onChanged: onChanged,
                            onSubmitted: onSubmitted,
                          ),
                        );
                       }
                      },
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
