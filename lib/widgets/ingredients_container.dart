import 'package:flutter/material.dart';

class IngredientContainer extends StatefulWidget {
  final String name;
  final String date;

  const IngredientContainer(
      {super.key, required this.name, required this.date});

  @override
  State<IngredientContainer> createState() => _IngredientContainerState();
}

class _IngredientContainerState extends State<IngredientContainer> {
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 350.0,
      decoration: BoxDecoration(
        color: Color(0xffDB6C16),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  widget.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.date,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
            Checkbox(
              value: valuefirst,
              checkColor: Colors.white,
              activeColor: Colors.amber,
              onChanged: (value) {
                setState(() {
                  valuefirst = value!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
