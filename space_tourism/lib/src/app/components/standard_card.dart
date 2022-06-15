import 'package:flutter/material.dart';

class StandardCard extends StatelessWidget {
  final String? leftText;
  final String? rightText;

  StandardCard({this.leftText, this.rightText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Text(
            leftText!,
            style: TextStyle(fontSize: 20),
          ),
          const Spacer(),
          Text(
            rightText!,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
