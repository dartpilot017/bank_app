
import 'package:bank_flutter/common/customButton.dart';
import 'package:bank_flutter/common/customTextField.dart';
import 'package:bank_flutter/constants/global_size.dart';
import 'package:bank_flutter/screens/siginup.dart';
import 'package:bank_flutter/services/auth-services.dart';
import 'package:bank_flutter/utilities/themeColors.dart';
import 'package:bank_flutter/utilities/themeStyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  void loginUser() {
    authService.login(
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
                              text: 'Login',
                              style: TextStyle(
                                  color: ThemeColors.black,
                                  fontSize: screenWidth * 0.08,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: '\nPlease login to continue.',
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
                    key: _loginFormKey,
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
                          validatorText: 'Enter a valid password',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                  ),
                  Center(
                    child: CustomButton(
                      text: 'Login',
                      onTap: () {
                        if (_loginFormKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(width: 16),
                                  Text("Logging in..."),
                                ],
                              ),
                            ),
                          );

                          loginUser();
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
                              text: 'Don\'t have an account?',
                              style: ThemeStyles.cardHideBalance,
                            ),
                            TextSpan(
                              text: ' Signup',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Signup(),
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
