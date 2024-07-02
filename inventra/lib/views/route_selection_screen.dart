import 'package:flutter/material.dart';
import 'package:inventra/components/powered_by_app360.dart';
import 'package:inventra/models/route_model.dart';
import '../models/user.dart';


class RouteSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    User user = arguments['user'];
    List<Routes> routes = arguments['routes'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Route Selection"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Select the following company you need to process",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(routes[index].route),
                      subtitle: Text(routes[index].company),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle route selection
                      },
                    ),
                  );
                },
              ),
            ),
           PoweredByApp360()
          ],
        ),
      ),
    );
  }
}
