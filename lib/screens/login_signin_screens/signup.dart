import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/backend/authenticationService.dart';
import 'package:show_trade/core/constTypes/const_color.dart';
import 'package:show_trade/core/constTypes/const_media.dart';
import 'package:show_trade/core/constTypes/const_texts.dart';
import 'package:show_trade/widget/custom_widget.dart';
import 'package:show_trade/widget/functions.dart';

import '../../main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool checkbox = false;
  bool showPassword = false;
  bool? thisPasswordIsTheSame;
  @override
  Widget build(BuildContext context) {
    TextTheme th = Theme.of(context).textTheme;
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
                SizedBox(height: sh * 0.06),
                AutoSizeText(
                  'Create an account',
                  style: TextStyle(
                      fontSize: 35.34,
                      fontWeight: FontWeight.w700,
                      color: loginColor),
                  minFontSize: 20,
                  stepGranularity: 10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: sh * 0.034),
                Custom_image_buttons(
                    height: 0.06 * sh,
                    width: 0.883 * sw,
                    context: context,
                    onPressed: () async {
                      await await Authenticationservice()
                          .SigninWithGoogle(context: context);
                    },
                    image: google_signin_image),
                SizedBox(height: sh * 0.034),
                Or_login_with_email_color(),
                SizedBox(height: sh * 0.034),
                formFields(context: context),
                SizedBox(height: 0.034 * sh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'I have read the',
                            style: TextStyle(
                                color: login_email_color,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.77)),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: TextButton(
                              onPressed: () {
                                privacyPolicy(context: context, sh: sh, sw: sw);
                              },
                              child: Text(
                                "Privacy policy.",
                                style: th.bodySmall!.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                      ]),
                    ),
                    SizedBox(
                      height: 0.032 * sh,
                      width: 0.032 * sh,
                      child: Checkbox(
                        fillColor: WidgetStateProperty.all(checkBox_filled_color),
                        focusColor: Colors.red,
                        hoverColor: Colors.blue,
                        checkColor: primaryColor,
                        activeColor: Colors.green,
                        side: BorderSide(color: focus_checkBox,width: 2.1),
                        overlayColor: WidgetStateProperty.all(Colors.pink),
                          value: checkbox,
                          onChanged: (v) {
                            setState(() {
                              checkbox = !checkbox;
                            });
                          }),
                    )
                  ],
                ),
                SizedBox(height: 0.03 * sh),
                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  onPressed: () {
                    showWelcomeDialog(context);
                  },
                  icon: SvgPicture.asset(
                    get_started,
                    width: 0.88 * sw,
                    height: 0.06 * sh,
                  ),
                ),
                SizedBox(height: 0.04 * sh),
                Already_have_account(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formFields({required BuildContext context}) {
    TextTheme th = Theme.of(context).textTheme;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 0.075 * sh,
              child: TextFormField(
                controller: _emailController,
                style: th.bodySmall,
                decoration: InputDecoration(
                    labelStyle: th.bodySmall,
                    fillColor: text_filled_color,
                    filled: true,
                    errorStyle: errorTextStyle,
                    border: unfocus,
                    enabledBorder: focusInputBorder,
                    focusedBorder: focusInputBorder,
                    focusedErrorBorder: errorInputBorder,
                    errorBorder: errorInputBorder,
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
            SizedBox(height: 0.021 * sh),
            SizedBox(
              height: 0.065 * sh,
              child: TextFormField(
                obscureText: showPassword,
                controller: _passwordController,
                style: th.bodySmall,
                decoration: InputDecoration(
                  labelStyle: th.bodySmall,
                  fillColor: text_filled_color,
                  filled: true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: SvgPicture.asset(eye_close)),
                  errorStyle: errorTextStyle,
                  border: unfocus,
                  enabledBorder: focusInputBorder,
                  focusedBorder: focusInputBorder,
                  focusedErrorBorder: errorInputBorder,
                  errorBorder: errorInputBorder,
                  labelText: 'password',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      if (value == _confirmPasswordController.text) {
                        thisPasswordIsTheSame = true;
                      } else {
                        thisPasswordIsTheSame = false;
                      }
                    } else {
                      thisPasswordIsTheSame = false;
                    }
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 0.021 * sh),
            SizedBox(
              height: 0.065 * sh,
              child: TextFormField(
                obscureText: true,
                controller: _confirmPasswordController,
                style: th.bodySmall,
                decoration: InputDecoration(
                  labelStyle: th.bodySmall,
                  fillColor: text_filled_color,
                  filled: true,
                  suffixIcon: thisPasswordIsTheSame == true
                      ? Icon(Icons.check, color: Colors.green)
                      : SizedBox(),
                  errorStyle: errorTextStyle,
                  border: unfocus,
                  enabledBorder: focusInputBorder,
                  focusedBorder: focusInputBorder,
                  focusedErrorBorder: errorInputBorder,
                  errorBorder: errorInputBorder,
                  labelText: 'password',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      if (value == _passwordController.text) {
                        thisPasswordIsTheSame = true;
                      } else {
                        thisPasswordIsTheSame = false;
                      }
                    } else {
                      thisPasswordIsTheSame = false;
                    }
                  });
                },
                validator: (value) {
                  if (thisPasswordIsTheSame == false ||
                      thisPasswordIsTheSame == null) {
                    return 'Please enter same password';
                  }
                  return null;
                },
              ),
            ),
          ],
        ));
  }

  void showWelcomeDialog(BuildContext context) {
    TextTheme th = Theme.of(context).textTheme;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.03 * sh),
                AutoSizeText(
                  'Hi, Welcome! 👋',
                  textAlign: TextAlign.start,
                  minFontSize: 20,
                  maxFontSize: 26,
                  style: th.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: sh * 0.04),
                Text(
                  "name",
                  style: th.labelMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.86,
                  ),
                ),
                SizedBox(height: 0.015 * sh),
                SizedBox(
                  height: 0.06 * sh,
                  child: TextField(
                    style: th.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.86,
                    ),
                    decoration: InputDecoration(
                      border: unfocus,
                      focusedBorder: focusInputBorder,
                      disabledBorder: unfocus,
                      alignLabelWithHint: false,
                      hintText: 'Type name',
                      hintStyle: th.bodyMedium,
                      labelStyle: th.bodyMedium,
                      fillColor: text_filled_color,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 0.023 * sh),
                Text(
                  "Username",
                  style: th.labelMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.86,
                  ),
                ),
                SizedBox(
                  height: 0.06 * sh,
                  child: TextField(
                    style: th.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.86,
                    ),
                    decoration: InputDecoration(
                      border: unfocus,
                      focusedBorder: focusInputBorder,
                      disabledBorder: unfocus,
                      hintText: 'Type username',
                      labelStyle: th.bodyMedium,
                      hintStyle: th.bodyMedium,
                      fillColor: text_filled_color,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Custom_image_buttons(
                    height: 0.059 * sh,
                    width: 0.8 * sw,
                    context: context,
                    onPressed: () {
                      context.go('/verification');
                    },
                    image: request_code),
                SizedBox(height: 0.03 * sh),
              ],
            ),
          ),
        );
      },
    );
  }
}
