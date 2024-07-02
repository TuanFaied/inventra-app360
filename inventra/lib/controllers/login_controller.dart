import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../models/route_model.dart';

class LoginController {
  late ApiService _apiService ;

  LoginController() {
    _initializeApiService();
  }

  Future<void> _initializeApiService() async {
    _apiService = await ApiService.create();
  }


  Future<void> login(BuildContext context, String userName, String password) async {
    try {
      final response = await _apiService.login(userName, password);
      print(userName);
      print(password);
      if (response['status'] == 'Success') {
        User user = User.fromJson(response['content']['userDetails']);
        List<Routes> routes = (response['content']['routes'] as List)
            .map((route) => Routes.fromJson(route))
            .toList();

        Navigator.pushReplacementNamed(context, '/routeSelection', arguments: {'user': user, 'routes': routes});
      } else {
        _showError(context, response['details']);
      }
    } catch (e) {
      _showError(context, e.toString());
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
