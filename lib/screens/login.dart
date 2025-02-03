import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:show_trade/core/const_color.dart';
import 'package:show_trade/core/const_media.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.058 * sw),
            child: Column(
              children: [
                SvgPicture.asset(
                  loginLogo,
                  height: sh * 0.1,
                  // width: sw * 0.17,
                ),
                SizedBox(height: sh * 0.105),
                AutoSizeText(
                  'Welcome back!',
                  style: TextStyle(
                      fontSize: 35.34,
                      fontWeight: FontWeight.w700,
                      color: loginColor),
                  minFontSize: 20,
                  stepGranularity: 10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: sh * 0.087),
                IconButton(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/login_and_signup/continue_with_google.svg',
                      // width: 0.882 * sw,
                      height: 0.065 * sh,
                    )),
                SizedBox(height: sh * 0.039),
                AutoSizeText(
                  'OR LOGIN WITH EMAIL',
                  style: TextStyle(
                      fontSize: 14.58,
                      fontWeight: FontWeight.w700,
                      color: or_login_with_email_color),
                  minFontSize: 10,
                  stepGranularity: 10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: sh * 0.039),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              enabledBorder: enableInputBorder,
                              focusedBorder: focusInputBorder,
                              focusedErrorBorder: enableInputBorder,
                              labelText: 'Email'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: showPassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: SvgPicture.asset(
                                    'assets/login_and_signup/eye_closed.svg')),
                            enabledBorder: enableInputBorder,
                            focusedBorder: focusInputBorder,
                            focusedErrorBorder: enableInputBorder,
                            labelText: 'Password',
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
                SizedBox(height: 0.039 * sh),
                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),

                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/login_and_signup/signin_button.svg',
                    width: 0.882 * sw,
                    height: 0.065 * sh,
                  ),
                ),
                SizedBox(height: 0.081 * sh),
                RichText(
                  text: TextSpan(children: <InlineSpan>[
                    TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                            color: or_login_with_email_color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.77)),
                    TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.77)),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
