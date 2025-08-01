import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScrollableTable extends StatefulWidget {
  const ScrollableTable({super.key});

  @override
  State<ScrollableTable> createState() => _ScrollableTableState();
}

class _ScrollableTableState extends State<ScrollableTable> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Excel Style Table')),
      body: Column(
        children: [
          // Top header row
          Row(
            children: [
              // Top-left empty cell
              Container(
                width: 100,
                height: 50,
                alignment: Alignment.center,
                color: Colors.blue[100],
                child: Text('DAYS'),
              ),
              // Column headers
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      8,
                      (col) => Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.blue[100],
                        child: Text('Header $col'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                // Fixed left column
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      5,
                      (row) => Container(
                        width: 80,
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.green[100],
                        child: Text('Row $row'),
                      ),
                    ),
                  ),
                ),
                // Scrollable grid
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(
                          8,
                          (row) => Row(
                            children: List.generate(
                              8,
                              (col) => Container(
                                width: 100,
                                height: 50,
                                alignment: Alignment.center,
                                color:
                                    (row + col) % 2 == 0
                                        ? Colors.white
                                        : Colors.grey[200],
                                child: Text('R$row C$col'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
