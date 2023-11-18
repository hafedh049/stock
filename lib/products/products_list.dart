import 'package:flutter/material.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock/models/product_model.dart';
import 'package:stock/utils/colors.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key, required this.products});
  final List products;
  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<String> _headers = <String>['PRODUCT ID', 'PRODUCT NAME', 'PRICE', 'RE-ORDER', 'PRODUCT QUANTITY', 'DISCOUNT', 'STATUS', 'DATE', 'CATEGORY', 'BRAND'];
  @override
  Widget build(BuildContext context) {
    return ExpandableTable(
      headerHeight: 60,
      firstColumnWidth: 50,
      firstHeaderCell: ExpandableTableCell(child: Container(color: grey.withOpacity(.1))),
      headers: <ExpandableTableHeader>[
        for (final String header in _headers)
          ExpandableTableHeader(
            cell: ExpandableTableCell(
              child: Container(
                color: grey.withOpacity(.1),
                child: Align(alignment: AlignmentDirectional.centerStart, child: Text(header)),
              ),
            ),
          ),
      ],
      rows: <ExpandableTableRow>[
        for (final Product product in widget.products)
          ExpandableTableRow(
            firstCell: ExpandableTableCell(
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(onPressed: null, icon: Icon(FontAwesomeIcons.chevronDown, size: 15)),
              ),
            ),
            cells: <ExpandableTableCell>[
              for (final MapEntry<String, dynamic> entry in product.toJson().entries)
                ExpandableTableCell(
                  child: entry.key == 'product_id'
                      ? RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: '#', style: TextStyle(fontWeight: FontWeight.w400, color: blue)),
                              TextSpan(text: entry.value.substring(1), style: const TextStyle(fontWeight: FontWeight.w400)),
                            ],
                          ),
                        )
                      : entry.key == 'product_name'
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: const DecorationImage(image: AssetImage('assets/test.png'), fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400)),
                              ],
                            )
                          : entry.key == 'product_sell_price'
                              ? RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(text: '${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400)),
                                      TextSpan(text: 'DT', style: TextStyle(fontWeight: FontWeight.w400, color: blue)),
                                    ],
                                  ),
                                )
                              : entry.key == 'product_category'
                                  ? Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400))
                                  : entry.key == 'status'
                                      ? Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(color: green.withOpacity(.4)),
                                          child: Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400, color: green)),
                                        )
                                      : entry.key == 'product_brand'
                                          ? Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400))
                                          : entry.key == 'product_date'
                                              ? Container(
                                                  padding: const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(color: yellow.withOpacity(.4)),
                                                  child: Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400)),
                                                )
                                              : entry.key == 'product_qunatity'
                                                  ? Container(
                                                      padding: const EdgeInsets.all(4),
                                                      decoration: BoxDecoration(color: purple.withOpacity(.4)),
                                                      child: Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400)),
                                                    )
                                                  : entry.key == 'product_discount'
                                                      ? Container(
                                                          padding: const EdgeInsets.all(4),
                                                          decoration: BoxDecoration(color: brown.withOpacity(.4)),
                                                          child: Text('${entry.value}%', style: const TextStyle(fontWeight: FontWeight.w400)),
                                                        )
                                                      : const SizedBox(),
                ),
            ],
          ),
      ],
    );
  }
}
