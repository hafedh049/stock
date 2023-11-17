import 'package:flutter/material.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key, required this.products});
  final List<Map<String, dynamic>> products;
  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<String> _headers = <String>['PRODUCT ID', 'PRODUCT NAME', 'PRICE', 'RE-ORDER', 'PRODUCT QUANTITY', 'DISCOUNT', 'STATUS', 'DATE', 'CATEGORY', 'BRAND'];
  @override
  Widget build(BuildContext context) {
    return ExpandableTable(
      firstHeaderCell: ExpandableTableCell(child: const SizedBox()),
      headers: [for (final String header in _headers) ExpandableTableHeader(cell: ExpandableTableCell(child: Text(header)))],
      rows: <ExpandableTableRow>[for (final Map<String,dynamic> in _headers)
        ExpandableTableRow(firstCell: ExpandableTableCell(child: SizedBox(width: 20)), cells: [ExpandableTableCell(child: SizedBox(width: 20))])
      ],
    );
  }
}
