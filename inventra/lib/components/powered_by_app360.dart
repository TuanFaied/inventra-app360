import 'package:flutter/material.dart';
import 'package:inventra/constants.dart';

class PoweredByApp360 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Powered by ',
          style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: 'APP',
              style: TextStyle(color: AppColor, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '360',
              style: TextStyle(color: Color_360, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
