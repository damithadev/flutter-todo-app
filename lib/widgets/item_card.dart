import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String title;
  final bool isDone;
  final Function() tapItem;
  final Function() deleteItem;
  const ItemCard(
      {super.key,
      required this.title,
      required this.isDone,
      required this.tapItem,
      required this.deleteItem});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 214, 215, 251),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: widget.tapItem,
        title: widget.isDone
            ? Text(
                widget.title,
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                ),
              )
            : Text(widget.title),
        leading: widget.isDone
            ? Icon(
                Icons.check_box,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            : Icon(
                Icons.check_box_outline_blank,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
        trailing: IconButton(
          onPressed: () {
            widget.deleteItem();
          },
          icon: Icon(
            Icons.delete,
            color: Color.fromARGB(255, 212, 15, 15),
          ),
        ),
      ),
    );
  }
}
