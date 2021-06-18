import 'package:flutter/material.dart';
import 'package:liluapp/app/modules/home/models/contact_model.dart';

class HomeListWidget extends StatefulWidget {
  final List<String> columnsNames;
  final List<ContactModel> values;
  final Function(String id, int index) onEdit;
  final Function(String id) onDelete;

  HomeListWidget({
    Key? key,
    required this.columnsNames,
    required this.values,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.columnsNames.length,
                (index) =>
                    _buildTitle(widget.columnsNames[index], index == 3 ? 1 : 4),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: widget.values.length,
              itemBuilder: (context, index) => Container(
                height: 40,
                color: index.isOdd ? Colors.grey.shade200 : Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  color: index.isOdd ? Colors.grey.shade400 : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildValues(widget.values[index].name, 4),
                      _buildValues(widget.values[index].email, 4),
                      _buildValues(widget.values[index].phone, 4),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              child: IconButton(
                                onPressed: () => widget.onEdit(
                                    widget.values[index].id, index),
                                icon: Icon(
                                  Icons.edit,
                                  size: 16,
                                ),
                              ),
                            ),
                            Material(
                              child: IconButton(
                                onPressed: () =>
                                    widget.onDelete(widget.values[index].id),
                                icon: Icon(
                                  Icons.delete,
                                  size: 16,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String value, int flex) {
    return Flexible(
      flex: flex,
      child: Container(
        height: 45,
        child: Row(
          mainAxisAlignment: value == 'Ações'
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildValues(String value, int flex) {
    return Flexible(
      flex: flex,
      child: Row(
        mainAxisAlignment: value == 'Ações'
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class HomeListValues {
  String name;
  String email;
  String phone;
  HomeListValues({
    required this.name,
    required this.email,
    required this.phone,
  });
}
