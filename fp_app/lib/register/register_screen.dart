import 'package:flutter/material.dart';
import 'package:fp_app/register/register_form.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.onRegister});

  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RegisterForm(onRegister: onRegister),
          ),
        ),
      ),
    );
  }
}

