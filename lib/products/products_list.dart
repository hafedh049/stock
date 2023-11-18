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
                              const TextSpan(text: '#', style: TextStyle(fontWeight: FontWeight.w400)),
                              TextSpan(text: entry.value.substring(1), style: const TextStyle(fontWeight: FontWeight.w400)),
                            ],
                          ),
                        )
                      : entry.key == 'product_name'
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '${entry.value}',
                                  style: const TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          : SizedBox(),
                ),
            ],
          ),
      ],
    );
  }
}
