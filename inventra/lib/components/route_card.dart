import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inventra/constants.dart';
import 'package:inventra/models/route_model.dart';
import 'package:inventra/models/user.dart';

class RouteCard extends StatelessWidget {
  final String routeName;
  final int routeId;
  User user;
  Routes route;

  RouteCard(
      {required this.routeName, required this.routeId,required this.user,required this.route});

  @override
  Widget build(BuildContext context) {
    if(user !=null){
      print(user.role);
    }
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ImageIcon(
          AssetImage('assets/icons/location_arrow.png'),
          color: kPrimaery,
          size: 13,
        ),
        title: Text(routeName, style: TextStyle(fontSize: 14)),
        trailing: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
        onTap: () {
          context.go('/dashboard', extra: {'route': route, 'user': user});
        },
      ),
    );
  }
}
