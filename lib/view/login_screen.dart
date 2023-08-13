import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.home);
              },
              child: Text('Click')),
        ));
  }
}
