import 'package:flutter/material.dart';

class ScrollableTable2 extends StatelessWidget {
  final int rowCount = 5;
  final int columnCount = 8;

  const ScrollableTable2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fully Scrollable 2D Table')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Horizontal scroll
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Vertical scroll
          child: Table(
            defaultColumnWidth: FixedColumnWidth(100),
            border: TableBorder.all(),
            children: List.generate(rowCount + 1, (rowIndex) {
              return TableRow(
                children: List.generate(columnCount + 1, (colIndex) {
                  // First row: headers
                  if (rowIndex == 0 && colIndex == 0) {
                    return _buildCell('', isHeader: true);
                  } else if (rowIndex == 0) {
                    return _buildCell('Header $colIndex', isHeader: true);
                  } else if (colIndex == 0) {
                    return _buildCell('Row $rowIndex', isHeader: true);
                  } else {
                    return _buildCell('R$rowIndex C$colIndex');
                  }
                }),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      color: isHeader ? Colors.blue[100] : Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
