import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class ExternalTable extends StatelessWidget {
  final int rowCount = 6;

  const ExternalTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table with External Package')),
      body: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 900, // 8 columns × 100 width
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: rowCount,
        rowSeparatorWidget: Divider(color: Colors.black12, height: 1.0),
        leftHandSideColBackgroundColor: Colors.grey[200]!,
        rightHandSideColBackgroundColor: Colors.white,
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _headerCell('Days'),
      _headerCell('Period 0'),
      _headerCell('Period 1'),
      _headerCell('Period 2'),
      _headerCell('Period 3'),
      _headerCell('Period 4'),
      _headerCell('Period 5'),
      _headerCell('Period 6'),
      _headerCell('Period 7'),
      _headerCell('Period 8'),
    ];
  }

  Widget _headerCell(String label) {
    return Container(
      width: 100,
      height: 56,
      alignment: Alignment.center,
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 100,
      height: 52,
      alignment: Alignment.center,
      child: Text('DAY ${index + 1}'),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: List.generate(9, (colIndex) {
        // match _getTitleWidget
        return Container(
          width: 100,
          height: 52,
          alignment: Alignment.center,
          child: Text('R$index C$colIndex'),
        );
      }),
    );
  }
}
