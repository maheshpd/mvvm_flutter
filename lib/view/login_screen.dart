import 'package:flutter/material.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_flutter/utils/utils.dart';

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
                Utils.snackBar("No Internet Connection", context);
                // Utils.flushBarErrorMessage('No Internet Connection', context);
                // Utils.toastMessage('No Internet connection');
              },
              child: Text('Click')),
        ));
  }
}
