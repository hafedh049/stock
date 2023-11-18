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
  final List<String> _headers = <String>['ID', 'NAME', 'PRICE', 'QUANTITY', 'DISCOUNT', 'STATUS', 'DATE', 'CATEGORY', 'BRAND'];
  @override
  Widget build(BuildContext context) {
    return ExpandableTable(
      headerHeight: 60,
      firstColumnWidth: 50,
      firstHeaderCell: ExpandableTableCell(child: Container(decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)), color: grey.withOpacity(.1)))),
      headers: <ExpandableTableHeader>[
        for (final String header in _headers)
          ExpandableTableHeader(
            cell: ExpandableTableCell(
              child: Container(
                color: grey.withOpacity(.1),
                child: Align(alignment: AlignmentDirectional.centerStart, child: Text(header, style: const TextStyle(fontWeight: FontWeight.bold))),
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
              for (final MapEntry<String, dynamic> entry in product.toJson().entries.where((MapEntry<String, dynamic> element) => !const <String>['product_description', 'product_price', 'product_pictures', 'product_seuil'].contains(element.key)).toList())
                ExpandableTableCell(
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: entry.key == 'product_id'
                        ? Text('${entry.value}', style: TextStyle(fontWeight: FontWeight.w500, color: blue))
                        : entry.key == 'product_name'
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(image: AssetImage('assets/test.png'), fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(child: Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w400))),
                                ],
                              )
                            : entry.key == 'product_sell_price'
                                ? Text('${entry.value}DT', style: TextStyle(fontWeight: FontWeight.w500, color: blue))
                                : entry.key == 'product_category'
                                    ? Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w500))
                                    : entry.key == 'product_status'
                                        ? Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(color: entry.value == 'IN STOCK' ? green.withOpacity(.1) : red.withOpacity(.1), borderRadius: BorderRadius.circular(5)),
                                            child: Text('${entry.value}', style: TextStyle(fontWeight: FontWeight.w500, color: entry.value == 'IN STOCK' ? green : red)),
                                          )
                                        : entry.key == 'product_brand'
                                            ? Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w500))
                                            : entry.key == 'product_date'
                                                ? Container(
                                                    padding: const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(color: yellow.withOpacity(.4), borderRadius: BorderRadius.circular(5)),
                                                    child: Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w500)),
                                                  )
                                                : entry.key == 'product_quantity'
                                                    ? Container(
                                                        padding: const EdgeInsets.all(4),
                                                        decoration: BoxDecoration(color: purple.withOpacity(.4), borderRadius: BorderRadius.circular(5)),
                                                        child: Text('${entry.value}', style: const TextStyle(fontWeight: FontWeight.w500)),
                                                      )
                                                    : entry.key == 'product_discount'
                                                        ? Container(
                                                            padding: const EdgeInsets.all(4),
                                                            decoration: BoxDecoration(color: brown.withOpacity(.4), borderRadius: BorderRadius.circular(5)),
                                                            child: Text('${entry.value}%', style: const TextStyle(fontWeight: FontWeight.w500)),
                                                          )
                                                        : const SizedBox(),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
