// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names, avoid_unnecessary_containers, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/screen/notification_screen.dart';

import 'package:movie_ticket_app/widget/seat_list.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  final selectedSeat = ValueNotifier<List<String>>([]);
  late TextEditingController controller;
  late TextEditingController controller2;
  late FixedExtentScrollController scrollController;
  late FixedExtentScrollController scrollController2;
  final times = [
    '12:30',
    '14:40',
    '16:50',
    '19:00',
  ];
  final dates = [
    '1 November 2022',
    '2 November 2022',
    '3 November 2022',
    '4 November 2022',
  ];

  int index = 2;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: dates[index]);
    controller2 = TextEditingController(text: times[index]);
    scrollController = FixedExtentScrollController(initialItem: index);
    scrollController2 = FixedExtentScrollController(initialItem: index);
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    scrollController.dispose();
    scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color(0xff999999),
        ),
        actions: [
          Center(
            child: Text(
              'SELECT SEAT',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          SelectSeat(size),
          Screen(size),
          SelectDateTime(size),
          Row(
            children: [
              SelectDate(size, context),
              SelectTime(size, context),
            ],
          ),
          BookingButton(size),
        ],
      ),
    );
  }

  Expanded BookingButton(Size size) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: size.height,
        width: size.width,
        // color: Colors.amber,
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff7FB4C5),
          ),
          child: Text('Book Now'),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NotificationScreen()),
                (route) => false);
          },
        ),
      ),
    );
  }

  Container SelectTime(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.5,
      // color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                readOnly: true,
                enableInteractiveSelection: false,
                controller: controller2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              child: CupertinoButton(
                color: Color(0xff7FB4C5),
                child: Text(
                  'Select Time',
                  style: TextStyle(fontSize: 12),
                ),
                onPressed: () {
                  scrollController2 =
                      FixedExtentScrollController(initialItem: index);
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      actions: [
                        TimePicker(),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text('Done'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container SelectDateTime(Size size) {
    return Container(
      height: size.height * 0.08,
      width: size.width,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SELECT DATE & TIME',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container Screen(Size size) {
    return Container(
      height: size.height * 0.02,
      width: size.width,
      color: Color(0xff535252),
      child: Center(
        child: Text(
          'SCREEN HERE',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container SelectSeat(Size size) {
    return Container(
      // color: Colors.blue,
      height: size.height * 0.4,
      width: size.width,
      child: ValueListenableBuilder<List<String>>(
        valueListenable: selectedSeat,
        builder: (context, value, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Available',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: ShapeDecoration(
                                shape: CircleBorder(),
                                color: Color(0xff7FB4C5),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Selected',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              for (int i = 1; i <= 6; i++) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int j = 1; j <= 8; j++) ...[
                      SeatWidget(
                        SeatNumber: '${String.fromCharCode(i + 64)}$j',
                        width:
                            (MediaQuery.of(context).size.width - 48 - 66) / 8,
                        height:
                            (MediaQuery.of(context).size.width - 48 - 66) / 8,
                        isSelected:
                            value.contains('${String.fromCharCode(i + 64)}$j'),
                        onTap: () {
                          if (value.contains(
                            '${String.fromCharCode(i + 64)}$j',
                          )) {
                            selectedSeat.value = List.from(value)
                              ..remove(
                                '${String.fromCharCode(i + 64)}$j',
                              );
                          } else {
                            selectedSeat.value = List.from(value)
                              ..add(
                                '${String.fromCharCode(i + 64)}$j',
                              );
                          }
                        },
                      ),
                      if (i != 8) SizedBox(width: j == 4 ? 16 : 4),
                    ]
                  ],
                ),
                if (i != 6) SizedBox(height: 6),
              ]
            ],
          );
        },
      ),
    );
  }

  Container SelectDate(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.5,
      // color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoTextField(
                readOnly: true,
                enableInteractiveSelection: false,
                controller: controller,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              child: CupertinoButton(
                color: Color(0xff7FB4C5),
                child: Text(
                  'Select Date',
                  style: TextStyle(fontSize: 12),
                ),
                onPressed: () {
                  scrollController =
                      FixedExtentScrollController(initialItem: index);
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      actions: [
                        DatePicker(),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text('Done'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget DatePicker() => SizedBox(
        height: 350,
        child: CupertinoPicker(
          scrollController: scrollController,
          itemExtent: 60,
          onSelectedItemChanged: (index) {
            setState(() => this.index = index);

            final date = dates[index];
            controller.text = date;
            print('Selected Date: $date');
          },
          children: List.generate(dates.length, (index) {
            final date = dates[index];
            return Center(
              child: Text(
                date,
                style: TextStyle(fontSize: 32),
              ),
            );
          }),
        ),
      );
  Widget TimePicker() => SizedBox(
        height: 350,
        child: CupertinoPicker(
          scrollController: scrollController2,
          itemExtent: 60,
          onSelectedItemChanged: (index) {
            setState(() => this.index = index);

            final time = times[index];
            controller2.text = time;
            print('Selected Date: $time');
          },
          children: List.generate(dates.length, (index) {
            final time = times[index];
            return Center(
              child: Text(
                time,
                style: TextStyle(fontSize: 32),
              ),
            );
          }),
        ),
      );
}
