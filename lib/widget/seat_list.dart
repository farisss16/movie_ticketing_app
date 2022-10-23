import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  SeatWidget({
    Key? key,
    required this.SeatNumber,
    this.onTap,
    this.height = 50,
    this.width = 50,
    this.isSelected = false,
    this.isAvailable = true,
  }) : super(key: key);

  final void Function()? onTap;
  final String SeatNumber;
  final double width;
  final double height;
  final bool isSelected;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isAvailable
              ? isSelected
                  ? Color(0xff7FB4C5)
                  : Color(0xffD9D9D9)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          SeatNumber,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color:
                    isAvailable ? Colors.black : Colors.black.withOpacity(0.6),
              ),
        ),
      ),
    );
  }
}
