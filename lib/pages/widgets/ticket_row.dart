import 'package:flutter/material.dart';

class TicketRow extends StatelessWidget {
  final VoidCallback onDelete;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController countController;

  const TicketRow({
    Key key,
    this.onDelete,
    this.nameController,
    this.priceController,
    this.countController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Название',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Введите название';
                }
                return null;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Цена',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Введите цену';
                }
                return null;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              controller: countController,
              decoration: InputDecoration(
                labelText: 'Количество',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Введите количество';
                }
                return null;
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: onDelete,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.delete),
          ),
        ),
      ],
    );
  }
}
