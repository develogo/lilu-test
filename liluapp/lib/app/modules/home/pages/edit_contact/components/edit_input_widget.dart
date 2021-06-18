import 'package:flutter/material.dart';

class EditInputWidget extends StatelessWidget {
  final String title;
  final Function(String value) onChanged;
  final TextEditingController controller;
  const EditInputWidget(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 5),
          TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26, width: .8),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: .8),
                borderRadius: BorderRadius.circular(25.0),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          )
        ],
      ),
    );
  }
}
