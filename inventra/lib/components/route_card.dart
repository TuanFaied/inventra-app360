
import 'package:flutter/material.dart';
import 'package:inventra/constants.dart';

class RouteCard extends StatelessWidget {
  final String routeName;

  RouteCard({required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ImageIcon(AssetImage('assets/icons/location_arrow.png'),  color: kPrimaery,size: 13,),
        title: Text(routeName, style: TextStyle(fontSize: 14)),
        trailing: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
        onTap: () {
          
          Navigator.pushNamed(context, '/dashboard');
        },
      ),
    );
  }
}