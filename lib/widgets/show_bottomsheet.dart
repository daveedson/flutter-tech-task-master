import 'package:flutter/material.dart';

void showCustomBottomSheet(
    {required BuildContext contex, required Widget widget, String? title}) {
  final height = MediaQuery.of(contex).size.height;
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    ),
    context: contex,
    builder: (_) {
      return Container(
        height: height * 0.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Column(
                children: [
                  SizedBox(height: 12.0),
                  Container(
                    height: 5.0,
                    width: 134.0,
                    decoration: BoxDecoration(
                      // color: ConstantColors.kclightGreyColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0),
                  Text(
                    "Ingridents needed for $title",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff393939),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: widget,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
