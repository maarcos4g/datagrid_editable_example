import 'package:datagrid/models/main.dart';
import 'package:datagrid/models/project.dart';
import 'package:datagrid/project_data_source.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Project> projects = <Project>[];
  late ProjectDataSource projectDataSource;

  @override
  void initState() {
    super.initState();
    
    projects = getProjects();
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
    return Scaffold(
      body: SfDataGrid(
        source: projectDataSource,
        allowEditing: true,
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
