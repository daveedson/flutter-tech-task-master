// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeScreen extends ConsumerWidget {
  String _selectedDate = "";
  String initialDob = "";
  String initValue = "";
  String dateData = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xffDB6C16),
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            context: context,
            builder: (BuildContext bc) {
              return Container(
                height: height * 0.55,
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
                            "Pick a Date",
                            style: TextStyle(
                              color: Color(0xff393939),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              child: SfDateRangePicker(
                                view: DateRangePickerView.month,
                                onSelectionChanged:
                                    (dateRangePickerSelectionChangedArgs) {
                                  selectionChanged(
                                    dateRangePickerSelectionChangedArgs,
                                  );
                                  Navigator.pop(context);
                                },
                                selectionColor: Color(0xffDB6C16),
                                todayHighlightColor: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              "images/45730-recipes-book-animation.json",
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Text(
              "Create your Reciepe",
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) async {
    _selectedDate = args.value.toString().replaceAll("00:00:00.000", "");

    print(_selectedDate);
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      //  setState(() {});
    });
  }
}
