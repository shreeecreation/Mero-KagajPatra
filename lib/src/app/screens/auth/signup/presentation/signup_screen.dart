import 'package:flutter/material.dart';
import 'package:kagajpatra/src/app/screens/auth/signup/domain/signup_auth.dart';
import 'package:kagajpatra/src/core/extensions/clippath_extension.dart';
import 'package:kagajpatra/src/core/extensions/colors_extension.dart';
import 'package:kagajpatra/src/core/extensions/validator_extension.dart';
import 'package:kagajpatra/src/core/themes/appstyles.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          ClipPath(
            clipper: Clipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Colors.blue, Colors.purple])),
            ),
          ),
          Text("   Be a part of family !", style: AppStyles.text29PxMedium.textBlue),
          Text("Sign Up", style: AppStyles.text29PxMedium.textBlue),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  NameField(name: name),
                  const SizedBox(height: 20),
                  EmailField(email: email),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PasswordField(password: password),
                      ),
                      const SizedBox(width: 4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: ConfirmPasswordField(confirmPassword: confirmPassword, password: password),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  PhonenumberField(phoneNo: phoneNo),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("By clicking Sign Up, you agree to our Terms, Privacy Policy and Cookies Policy.", style: AppStyles.text12Px.black),
                  ), //Checkbox

                  const SizedBox(height: 10),
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
                                SignInAuth.createEmailandPassword(email.text, password.text);
                              }
                            },
                            child: Text("Sign Up", style: AppStyles.text16PxSemiBold.white))),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        //TODO SignUp Page
                        Navigator.pushReplacementNamed(context, "login");
                      },
                      child: Text("Already have a account ? ", style: AppStyles.text14PxMedium.textBlue)),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class PhonenumberField extends StatelessWidget {
  const PhonenumberField({super.key, required this.phoneNo});

  final TextEditingController phoneNo;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneNo,
      decoration: InputDecoration(
        labelText: "Phone Number",
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide()),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "phone number cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
    );
  }
}

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key, required this.confirmPassword, required this.password});

  final TextEditingController confirmPassword;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: confirmPassword,
      decoration: InputDecoration(
          labelText: "Confirm Password",
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide())),
      validator: (val) {
        if (password.text != confirmPassword.text) {
          return "password not matched";
        } else {
          return null;
        }
      },
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
        labelText: "Password",
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide()),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "Password cannot be empty";
        } else if (val.length <= 6) {
          return "Password length is too short";
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

class NameField extends StatelessWidget {
  const NameField({super.key, required this.name});

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: name,
      decoration: InputDecoration(
        labelText: "Name",
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide()),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "Name cannot be empty";
        } else {
          return null;
        }
      },
    );
  }
}
