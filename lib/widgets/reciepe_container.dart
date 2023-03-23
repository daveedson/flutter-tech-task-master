import 'package:flutter/material.dart';

class ReciepeContainer extends StatelessWidget {
  ReciepeContainer({super.key, required this.name, required this.ingridentsCount});
  final String name;
  final int ingridentsCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: 120.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: Colors.white,
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
                  name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "$ingridentsCount ingridents",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
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
