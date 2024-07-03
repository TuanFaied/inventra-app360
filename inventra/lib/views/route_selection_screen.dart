import 'package:flutter/material.dart';
import 'package:inventra/components/powered_by_app360.dart';
import 'package:inventra/components/route_card.dart';
import 'package:inventra/models/route_model.dart';
import '../models/user.dart';


class RouteSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    User user = arguments['user'];
    List<Routes> routes = arguments['routes'];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0), // Adjust the left padding as needed
                child: RichText(
                  text: TextSpan(
                    text: 'ROUTE',
                    style: TextStyle(
                      fontSize: 25, 
                      color: Color.fromARGB(255, 123, 123, 123),
                      fontWeight: FontWeight.w400,
                      ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' SELECTION',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Select the following company, you need to process',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8,left: 10,right: 28),
                      child: RouteCard(routeName: routes[index].route),
                    );
                    
                  },
                  
                ),

              ),
            ),
            PoweredByApp360(),
          ],
        ),
      ),
    );
  }
}
