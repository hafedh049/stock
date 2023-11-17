import 'package:flutter/material.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return ExpandableTable(
      firstHeaderCell: ExpandableTableCell(child: const SizedBox()),
      headers: [ExpandableTableHeader(cell: ExpandableTableCell(child: SizedBox(width: 20)))],
      rows: <ExpandableTableRow>[
        ExpandableTableRow(firstCell: ExpandableTableCell(child: SizedBox(width: 20)), cells: [ExpandableTableCell(child: SizedBox(width: 20))])
      ],
    );
  }
}
