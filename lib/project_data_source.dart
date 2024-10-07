import 'package:datagrid/models/project.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProjectDataSource extends DataGridSource {
  final Function(int, String, dynamic) onUpdate;

  List<DataGridRow> _dataGridRows = [];

  dynamic newCellValue;
  TextEditingController editingController = TextEditingController();

  ProjectDataSource(
      {required List<Project> projectData, required this.onUpdate}) {
    _dataGridRows = projectData
        .map<DataGridRow>((project) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: project.name),
              DataGridCell<String>(
                  columnName: 'city', value: project.address?.city),
              DataGridCell<String>(
                  columnName: 'state', value: project.address?.state),
              DataGridCell<String>(columnName: 'type', value: project.type),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column) async {
    final int dataRowIndex = _dataGridRows.indexOf(dataGridRow);
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            .value ?? '';

    if (newCellValue == null || newCellValue == oldValue) {
      return;
    }

    onUpdate(dataRowIndex, column.columnName, newCellValue);
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = _dataGridRows.indexOf(row); 
    return DataGridRowAdapter(
      color: rowIndex % 2 == 0 
          ? Colors.white 
          : const Color(0xFFF8F8F8), 
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.centerLeft, 
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), 
          child: Text(
            e.value.toString(),
            overflow: TextOverflow.ellipsis, 
            style: const TextStyle(fontSize: 14), 
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    final String displayText = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            .value
            .toString() ?? '';

    newCellValue = null;

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: TextAlign.left,
        decoration: const InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              fillColor: Colors.white
        ),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          newCellValue = value.isNotEmpty ? value : null;
        },
        onSubmitted: (String value) {
          submitCell();
        },
      ),
    );
  }
}
