import 'package:flutter/material.dart';
import 'package:tech_task/widgets/show_bottomsheet.dart';

class ReciepeContainer extends StatefulWidget {
  ReciepeContainer({
    super.key,
    required this.name,
    required this.ingridentsCount,
    required this.ingridentsNeeded,
  });
  final String name;
  final int ingridentsCount;
  final String ingridentsNeeded;

  @override
  State<ReciepeContainer> createState() => _ReciepeContainerState();
}

class _ReciepeContainerState extends State<ReciepeContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color containerColor = isSelected ? Colors.black : Colors.white;
    Color textColor = isSelected ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        if (isSelected) {
          showCustomBottomSheet(
            contex: context,
            title: widget.name,
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  "The ingridents needed to make you a delicious ${widget.name} 😋🤤 includes,  ${widget.ingridentsNeeded} ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          );
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
                    "${widget.ingridentsCount} ingredients",
                    style: TextStyle(fontSize: 16.0, color: textColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
