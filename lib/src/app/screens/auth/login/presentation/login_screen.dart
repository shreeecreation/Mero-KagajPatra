import 'package:flutter/material.dart';
import 'package:kagajpatra/src/app/screens/auth/login/domain/login_auth.dart';
import 'package:kagajpatra/src/core/extensions/clippath_extension.dart';
import 'package:kagajpatra/src/core/extensions/colors_extension.dart';
import 'package:kagajpatra/src/core/extensions/validator_extension.dart';
import 'package:kagajpatra/src/core/themes/appstyles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: Clipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Colors.blue, Colors.purple])),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text("   Hello there ! \n welcome back", style: AppStyles.text29PxMedium.textBlue),
                      const SizedBox(height: 25),
                      EmailField(email: email),
                      const SizedBox(height: 25),
                      PasswordField(password: password),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                //TODO Forogot Password Work
                              },
                              child: Text("Forgot Password ?", style: AppStyles.text16PxMedium.textBlue)),
                          const SizedBox(width: 5),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(colors: [Color.fromARGB(209, 78, 80, 221), Color.fromARGB(204, 157, 78, 221)]),
                                ),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                                        disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                                        shadowColor: Colors.transparent),
                                    onPressed: () {
                                      //TODO Login Button making work
                                      if (formKey.currentState!.validate()) {
                                        LoginAuth.signInwithEmailandPass(email.text, password.text, context);
                                      }
                                    },
                                    child: Text("Login", style: AppStyles.text16PxSemiBold.white))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                //TODO SignUp Page
                                Navigator.pushReplacementNamed(context, "signUp");
                              },
                              child: Text("Don't have a account ? Sign up", style: AppStyles.text14PxMedium.textBlue)),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.password});

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: password,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.remove_red_eye),
        labelText: "Password",
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide()),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "Password cannot be empty";
        } else {
          return null;
        }
      },
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.email});

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: email,
      decoration: InputDecoration(
        labelText: "Email Address",
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide()),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "Email cannot be empty";
        } else if (!val.isValidEmail) {
          return "Invalid email";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
