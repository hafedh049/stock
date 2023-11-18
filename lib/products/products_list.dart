import 'package:flutter/material.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';
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
      firstHeaderCell: ExpandableTableCell(child: Container(color: grey.withOpacity(.3))),
      headers: <ExpandableTableHeader>[
        for (final String header in _headers)
          ExpandableTableHeader(
            cell: ExpandableTableCell(
              child: Container(
                color: grey.withOpacity(.3),
                child: Align(alignment: AlignmentDirectional.centerStart, child: Text(header)),
              ),
            ),
          ),
      ],
      rows: <ExpandableTableRow>[
        for (final Product product in widget.products)
          ExpandableTableRow(
            firstCell: ExpandableTableCell(child: Text(widget.products.indexOf(product).toString())),
            cells: <ExpandableTableCell>[
              for (final dynamic value in product.values)
                ExpandableTableCell(
                  child: Text('$value'),
                ),
            ],
          )
      ],
    );
  }
}
