import 'package:flutter/material.dart';
import 'package:inventra/components/dash_card.dart';
import 'package:inventra/components/dashboard_button.dart';
//import 'package:inventra/components/dashboard_card.dart';
import 'package:inventra/components/powered_by_app360.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text(
                        'DASHBOARD',
                        style: TextStyle(fontSize: 25, color: Color(0xFF52575c), fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Navigating Opportunities, Analyzing Options',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                 
                  DashboardCard(
                    name: 'Shehan Ekanayake',
                    company: 'App360 PVT.LMT',
                    invoices: 10,
                    sales: 'Rs.2,340.00',
                    route: 'kandy Road',
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DashboardButton(iconPath: 'assets/icons/Investment.png', label: 'New Bill',onPressed: () {
                        Navigator.pushNamed(context, '/new_bill');
                      },),
                      DashboardButton(iconPath: 'assets/icons/payment.png', label: 'Payments',onPressed: () {
                        Navigator.pushNamed(context, '/payment');
                      },),
                      DashboardButton(iconPath: 'assets/icons/Group.png', label: 'Reports',onPressed: () {
                        Navigator.pushNamed(context, '/report');
                      },),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15),
                      DashboardButton(iconPath: 'assets/icons/people.png', label: 'New Customer',onPressed: () {
                        Navigator.pushNamed(context, '/new_customer');
                      },),
                      SizedBox(width: 22),
                      DashboardButton(iconPath: 'assets/icons/icon.png', label: 'Settings',onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            PoweredByApp360(),
          ],
        ),
      ),
    );
  }
}
