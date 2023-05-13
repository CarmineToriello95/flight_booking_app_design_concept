import 'package:emirates_airlines_concept_ui/widgets/custom_text_field.dart';
import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const hSpace = SizedBox(
      height: 24.0,
    );
    return Scaffold(
      backgroundColor: R.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEmailField,
              hSpace,
              _buildPasswordField,
              hSpace,
              Text(
                "Forget Password?",
                style: TextStyle(color: R.tertiaryColor),
              ),
              hSpace,
              _buildLoginButton,
              hSpace,
              _buildSignUpTextWidget
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildEmailField => CustomTextField(
        labelText: "E-MAIL",
        prefixIcon: Icon(
          Icons.email,
          color: R.secondaryColor,
        ),
        mainColor: R.secondaryColor,
        secondaryColor: R.tertiaryColor,
      );

  Widget get _buildPasswordField => CustomTextField(
        labelText: "PASSWORD",
        prefixIcon: Icon(
          Icons.lock,
          color: R.secondaryColor,
        ),
        mainColor: R.secondaryColor,
        secondaryColor: R.tertiaryColor,
        isTextObscure: true,
      );

  Widget get _buildLoginButton => FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: R.secondaryColor,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Login",
          style: TextStyle(color: R.primaryColor, fontWeight: FontWeight.bold),
        ),
      );

  Widget get _buildSignUpTextWidget => RichText(
        text: TextSpan(
          text: "Not a member? ",
          style: TextStyle(color: R.tertiaryColor),
          children: [
            TextSpan(
              text: "Join now",
              style: TextStyle(
                color: R.secondaryColor,
              ),
            )
          ],
        ),
      );
}
