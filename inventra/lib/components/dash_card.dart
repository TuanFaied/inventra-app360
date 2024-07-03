import 'dart:math';

import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String name;
  final String company;
  final int invoices;
  final String sales;
  final String route;

  DashboardCard({
    required this.name,
    required this.company,
    required this.invoices,
    required this.sales,
    required this.route,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 328,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF19c7cc),
            Color(0xFF29879a),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(320, 200),
            painter: BackgroundPaint(),
          ),
           Positioned(
            bottom:-5,
            left:70 ,
            child: CustomPaint(
            size: Size(277, 108),
            painter: BackgroundPaint2(),
          ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  company,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Invoices: $invoices',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 98,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ImageIcon(AssetImage('assets/icons/sales.png'),
                        color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Sales',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                
                Text(
                  sales,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 6,
            left: 20,
            child: Row(
              children: [
                ImageIcon(AssetImage('assets/icons/Fast-Delivery.png'),
                    color: Colors.white),
                SizedBox(width: 4),
                Text(
                  route,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}

class BackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = 68.0;

    // Define the path for the segment
    final path = Path()
      ..moveTo(0, radius - 20)
      ..lineTo(0, radius)
      ..quadraticBezierTo(radius + 10, radius + 10, radius, 0)
      ..lineTo(radius - 20, 0)
      ..quadraticBezierTo(radius - 8, radius - 8, 0, radius - 20)
      ..close();

    // Create a linear gradient
    final gradient = LinearGradient(
      colors: [Color(0xFF16bcc0), Colors.white],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    // Create a shader from the gradient
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Return true if the painting should be redone
  }
}

class BackgroundPaint2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Define the path for the segment
    final path = Path()
      ..moveTo(0, h)
      ..cubicTo(0.5 * w, h, 0.5 * w, 0, 0.75*w, 0)
      ..quadraticBezierTo(w,0,1.2*w,0.5*h);

    // Create a linear gradient
    final gradient = LinearGradient(
      colors: [ Color(0xFF1db7bf),Color(0xFF239dab)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    // Create a shader from the gradient
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22.0;

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Return true if the painting should be redone
  }
}
