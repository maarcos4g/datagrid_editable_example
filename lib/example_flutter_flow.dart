// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProjectDataGrid extends StatefulWidget {
  const ProjectDataGrid({
    super.key,
    this.width,
    this.height,
    required this.allowEditing,
    required this.projects,
  });

  final double? width;
  final double? height;
  final bool allowEditing;
  final List<ProjectStruct> projects;

  @override
  State<ProjectDataGrid> createState() => _ProjectDataGridState();
}

class _ProjectDataGridState extends State<ProjectDataGrid> {
  List<ProjectStruct> projects = <ProjectStruct>[];
  late ProjectDataSource projectDataSource;

  @override
  void initState() {
    super.initState();

    projectDataSource = ProjectDataSource(
      projectData: projects,
      onUpdate: (int rowIndex, String columnName, dynamic newValue) {
        setState(() {
          if (columnName == 'name') {
            projects[rowIndex].name = newValue;
            print(newValue);
          } else if (columnName == 'city') {
            projects[rowIndex].address?.city = newValue;
            print(newValue);
          } else if (columnName == 'state') {
            projects[rowIndex].address?.state = newValue;
            print(newValue);
          } else if (columnName == 'type') {
            projects[rowIndex].type = newValue;
            print(newValue);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDataGrid(
        source: projectDataSource,
        allowEditing: widget.allowEditing,
        selectionMode: SelectionMode.single,
        navigationMode: GridNavigationMode.cell,
        columnWidthMode: ColumnWidthMode.fill,
        gridLinesVisibility: GridLinesVisibility.none,
        highlightRowOnHover: false,
        rowHeight: 50,
        columns: [
          GridColumn(
            columnName: 'name',
            label: Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Text(
                'Nome do projeto',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          GridColumn(
            columnName: 'city',
            label: Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Text(
                'Cidade',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          GridColumn(
            columnName: 'state',
            label: Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Text(
                'Estado',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          GridColumn(
            columnName: 'type',
            label: Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Text(
                'Tipo',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectDataSource extends DataGridSource {
  final Function(int, String, dynamic) onUpdate;

  List<DataGridRow> _dataGridRows = [];

  dynamic newCellValue;
  TextEditingController controller = TextEditingController();

  ProjectDataSource(
      {required List<ProjectStruct> projectData, required this.onUpdate}) {
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
            .value ??
        '';

    if (newCellValue == null || newCellValue == oldValue) {
      return;
    }

    onUpdate(dataRowIndex, column.columnName, newCellValue);
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final int rowIndex = _dataGridRows.indexOf(row);
    return DataGridRowAdapter(
      color: rowIndex % 2 == 0 ? Colors.white : const Color(0xFFF8F8F8),
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
            .toString() ??
        '';

    newCellValue = null;

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        controller: controller..text = displayText,
        textAlign: TextAlign.left,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            fillColor: Colors.white),
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