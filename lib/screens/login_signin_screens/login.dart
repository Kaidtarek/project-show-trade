import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/backend/authenticationService.dart';
import 'package:show_trade/core/constTypes/const_color.dart';
import 'package:show_trade/core/constTypes/const_media.dart';
import 'package:show_trade/widget/custom_widget.dart';

import '../../main.dart';

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
  void initState() {
    super.initState();
  }

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
                Custom_image_buttons(
                    height: 0.06 * sh,
                    width: 0.883 * sw,
                    context: context,
                    onPressed: () async {
                      await await Authenticationservice()
                          .SigninWithGoogle(context: context);
                    },
                    image: google_signin_image),
                SizedBox(height: sh * 0.039),
                Or_login_with_email_color(),
                SizedBox(height: sh * 0.039),
                formFields(),
                SizedBox(height: 0.039 * sh),
                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    sign_in_button,
                    width: 0.882 * sw,
                    height: 0.06 * sh,
                  ),
                ),
                SizedBox(height: 0.081 * sh),
                RichText(
                  text: TextSpan(children: <InlineSpan>[
                    TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                            color: login_email_color,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.77)),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: TextButton(
                          onPressed: () {
                            context.push("/signup");
                          },
                          child: Text("SIGN UP.",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.77)),
                        )),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formFields() {
    TextTheme th = Theme.of(context).textTheme;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 0.065 * sh,
              child: TextFormField(
                controller: _emailController,
                style: th.bodySmall,
                decoration: InputDecoration(
                    fillColor: text_filled_color,
                    filled: true,
                    errorStyle: errorTextStyle,
                    border: unfocus,
                    enabledBorder: focusInputBorder,
                    focusedBorder: focusInputBorder,
                    focusedErrorBorder: errorInputBorder,
                    errorBorder: errorInputBorder,
                    labelStyle: th.bodySmall,
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
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 0.065 * sh,
              child: TextFormField(
                obscureText: showPassword,
                controller: _passwordController,
                decoration: InputDecoration(
                    fillColor: text_filled_color,
                    filled: true,
                    suffixIcon: IconButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: SvgPicture.asset(eye_close)),
                    border: unfocus,
                    enabledBorder: focusInputBorder,
                    focusedBorder: focusInputBorder,
                    labelText: 'Password',
                    labelStyle: th.bodySmall),
                style: th.bodySmall,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
          ],
        ));
  }
}
