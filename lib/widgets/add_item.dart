import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  final TextEditingController inputcontroller;
  final Function(String) addSingleItem;
  const AddItem(
      {super.key, required this.inputcontroller, required this.addSingleItem});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.inputcontroller,
        decoration: InputDecoration(
          hintText: 'Add Item....',
          suffixIcon: IconButton(
            onPressed: () => widget.addSingleItem(widget.inputcontroller.text),
            icon: Icon(Icons.add),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
