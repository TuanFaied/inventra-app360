import 'package:flutter/material.dart';
import 'package:inventra/components/dash_card.dart';
import 'package:inventra/components/dashboard_button.dart';
//import 'package:inventra/components/dashboard_card.dart';
import 'package:inventra/components/powered_by_app360.dart';
import 'package:inventra/models/route_model.dart';
import 'package:inventra/models/user.dart';
import 'package:inventra/views/report_screen.dart';

class DashboardScreen extends StatelessWidget {
  final User user;
  final Routes route;

  DashboardScreen({required this.user, required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                    'assets/images/bg-lines.png',
                  ), // Replace with your image path
                  fit: BoxFit.contain,

                  alignment: Alignment.bottomLeft,
                  colorFilter: ColorFilter.mode(
                    Color(0xffe1e4e8).withOpacity(
                        0.5), // Replace with your desired color and opacity
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
            // Foreground content
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DASHBOARD',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF52575c),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Navigating Opportunities, Analyzing Options',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      DashboardCard(
                        name: user.userName,
                        company: route.company,
                        invoices: 10,
                        sales: 'Rs.2,340.00',
                        route: route.route,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DashboardButton(
                            iconPath: 'assets/icons/Investment.png',
                            label: 'New Bill',
                            onPressed: () {
                              Navigator.pushNamed(context, '/new_bill');
                            },
                          ),
                          DashboardButton(
                            iconPath: 'assets/icons/payment.png',
                            label: 'Payments',
                            onPressed: () {
                              Navigator.pushNamed(context, '/payment');
                            },
                          ),
                          DashboardButton(
                            iconPath: 'assets/icons/Group.png',
                            label: 'Reports',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReportScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15),
                          DashboardButton(
                            iconPath: 'assets/icons/people.png',
                            label: 'New Customer',
                            onPressed: () {
                              Navigator.pushNamed(context, '/new_customer');
                            },
                          ),
                          const SizedBox(width: 22),
                          DashboardButton(
                            iconPath: 'assets/icons/icon.png',
                            label: 'Settings',
                            onPressed: () {
                              Navigator.pushNamed(context, '/settings');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                PoweredByApp360(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
