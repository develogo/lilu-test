import 'package:flutter/material.dart';

class HomeListHeaderWidget extends StatelessWidget {
  List<String> columnsNames;
  HomeListHeaderWidget({
    Key? key,
    required this.columnsNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          columnsNames.length,
          (index) => _buildTitle(columnsNames[index], index == 3 ? 1 : 4),
        ),
      ),
    );
  }

  Widget _buildTitle(String value, int flex) {
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
