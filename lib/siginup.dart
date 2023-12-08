import 'package:bank_flutter/auth-services.dart';
import 'package:bank_flutter/common/customButton.dart';
import 'package:bank_flutter/common/customTextField.dart';
import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/login.dart';
import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:bank_flutter/utilities/themeStyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _signupUserFormKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  void signupUser() {
    authService.signup(
      context,
      phoneNumberController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.08,
                right: screenWidth * 0.08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenHeight * 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.06,
                    ),
                    child: Transform.scale(
                      scale: screenWidth * 0.003,
                      child: Text.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Signup',
                              style: TextStyle(
                                  color: ThemeColors.black,
                                  fontSize: screenWidth * 0.08,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: '\nPlease create an account to continue.',
                              style: ThemeStyles.cardHideBalance,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Form(
                    key: _signupUserFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: phoneNumberController,
                          hintText: 'Phone number',
                          validatorText: 'Enter a valid phone number',
                        ),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          showSuffixIcon: true,
                          showPreffixIcon: true,
                          preffixIcon: Icons.lock,
                          validatorText: 'Create a password',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  Center(
                    child: CustomButton(
                      text: 'Signup',
                      onTap: () {
                        if (_signupUserFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(width: 16),
                                  Text("Signing up user..."),
                                ],
                              ),
                            ),
                          );

                          signupUser();
                        }
                      },
                      height: 0.07,
                      width: 0.7,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.18,
                      top: screenWidth * 0.4,
                    ),
                    child: Transform.scale(
                      scale: screenWidth * 0.003,
                      child: Text.rich(
                        textAlign: TextAlign.justify,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account?',
                              style: ThemeStyles.cardHideBalance,
                            ),
                            TextSpan(
                              text: ' login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LoginScreen(),
                                    ),
                                  );
                                },
                              style: TextStyle(
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
