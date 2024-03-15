import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/widgets/add_item.dart';
import 'package:flutter_application_1/widgets/item_card.dart';

class Home extends StatefulWidget {
  Home({super.key});
  final TextEditingController inputcontroller = TextEditingController();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(title: 'Gym', id: '1', isDone: false),
    Item(title: 'Breakfast', id: '2', isDone: false),
    Item(title: 'Office', id: '3', isDone: false),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(),
          _list(),
          AddItem(
            inputcontroller: widget.inputcontroller,
            addSingleItem: (String title) {
              setState(() {
                items.add(Item(
                    title: title,
                    id: DateTime.now().toString(),
                    isDone: false));
                widget.inputcontroller.clear();
              });
            },
          ),
        ],
      ),
    ));
  }

  Widget _list() {
    return Expanded(
        child: ListView(
      children: [
        for (var item in items)
          ItemCard(
            title: item.title,
            isDone: item.isDone,
            tapItem: () {
              setState(() {
                item.toggleDone();
              });
            },
            deleteItem: () {
              setState(() {
                items.remove(item);
              });
            },
          )
      ],
    ));
  }
}
