import 'package:flutter/material.dart';

class IngredientContainer extends StatefulWidget {
  final String name;
  final String date;
  final Function(String?)? onAdd;
  final Function(String?)? onRemove;
  final bool isSelected;

  IngredientContainer({
    super.key,
    required this.name,
    required this.date,
    this.onAdd,
    required this.isSelected,
    this.onRemove,
  });

  @override
  State<IngredientContainer> createState() => _IngredientContainerState();
}

class _IngredientContainerState extends State<IngredientContainer> {
  @override
  Widget build(BuildContext context) {
    Color containerColor = widget.isSelected ? Colors.black : Colors.white;
    Color textColor = widget.isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: () {
        if (widget.isSelected) {
          widget.onRemove!.call(widget.name);
        } else {
          widget.onAdd!.call(widget.name);
        }
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: 120.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(12.0),
        ),
        duration: Duration(milliseconds: 350),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                        color: textColor),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.date,
                    style: TextStyle(fontSize: 16.0, color: textColor),
                  ),
                ],
              ),
              Checkbox(
                value: widget.isSelected,
                checkColor: Colors.white,
                activeColor: Color(0xffEF2D5A),
                onChanged: (value) {
                  if (value ?? false) {
                    widget.onAdd!.call(widget.name);
                  } else {
                    widget.onRemove!.call(widget.name);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
