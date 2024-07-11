import 'package:flutter/material.dart';
import 'package:fp_app/model/weather_model.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  RegisterButtonState createState() => RegisterButtonState();
}

class RegisterButtonState extends State<RegisterButton> {
  bool _loading = false;

  Future<void> _register(BuildContext context) async {
    if (widget.formKey.currentState?.validate() ?? false) {
      setState(() {
        _loading = true;
      });

      try {
        await WeatherModel.register(
          context,
          widget.emailController.text,
          widget.passwordController.text,
        );

        setState(() {
          _loading = false;
        });
      } catch (e) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _loading ? null : () => _register(context),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: _loading
            ? const SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Text(
                'Register',
                style: TextStyle(fontSize: 18.0),
              ),
      ),
    );
  }
}
