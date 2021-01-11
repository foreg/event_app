import 'package:flutter/material.dart';

class NumericUpDown extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final int value;

  const NumericUpDown({Key key, this.onAdd, this.onRemove, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onRemove,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(5),
                bottomLeft: const Radius.circular(5),
              ),
            ),
            child: Icon(Icons.remove, size: 18),
          ),
        ),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide()),
          ),
          child: Center(child: Text('$value')),
        ),
        GestureDetector(
          onTap: onAdd,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(5),
                bottomRight: const Radius.circular(5),
              ),
            ),
            child: Icon(Icons.add, size: 18),
          ),
        )
      ],
    );
  }
}
