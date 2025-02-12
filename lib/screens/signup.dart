import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/core/constTypes/const_color.dart';
import 'package:show_trade/core/constTypes/const_media.dart';
import 'package:show_trade/core/constTypes/const_texts.dart';
import 'package:show_trade/widget/custom_widget.dart';

import '../main.dart';

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
                Google_SignIn_Widget(sw: sw, sh: sh, context: context),
                SizedBox(height: sh * 0.034),
                Or_login_with_email_color(),
                SizedBox(height: sh * 0.034),
                FormFields(context: context),
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
                                PrivacyPolicy(context);
                              },
                              child: Text(
                                "Privacy policy.",
                                style: th.bodyMedium!.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                      ]),
                    ),
                    Container(
                      height: 0.032 * sh,
                      width: 0.032 * sh,
                      child: Checkbox(
                          value: false,
                          onChanged: (v) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "i will do that  after get design of FALSE-CHECK-BOX ."),
                              ),
                            );
                          }),
                    )
                  ],
                ),
                SizedBox(height: 0.03 * sh),
                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  onPressed: () {showWelcomeDialog(context);},
                  icon: SvgPicture.asset(
                    'assets/login_and_signup/get_started.svg',
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

  PrivacyPolicy(BuildContext context) {
    TextTheme th = Theme.of(context).textTheme;
    final ScrollController sc = ScrollController();

    void scrollToBottom() {
      if (sc.hasClients) {
        sc.animateTo(sc.position.maxScrollExtent,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    }

    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (b) {
        return SizedBox(
          height: sh * 0.85,
          child: Stack(
            children: [
              Column(
                children: [
                  // Header section
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(right: sw * 0.07),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "شروط الاستخدام",
                              style: th.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1),
                  // Scrollable content section
                  Expanded(
                    child: Stack(
                      children: [
                        RawScrollbar(
                          controller: sc,
                          thumbVisibility: true,
                          thumbColor: primaryColor,
                          radius: Radius.circular(20),
                          thickness: 6,
                          interactive: true,
                          child: ListView(
                            controller: sc,
                            padding: EdgeInsets.all(16),
                            children: [PrivacyTexts(context)],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: sw / 5,
                child: IconButton(
                    color: policy_text_color,
                    onPressed: scrollToBottom,
                    icon: Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                          'assets/login_and_signup/scroll_to_bottom.svg'),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget FormFields({required BuildContext context}) {
    TextTheme th = Theme.of(context).textTheme;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 0.065 * sh,
              child: TextFormField(
                controller: _emailController,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                    labelStyle: th.bodySmall,
                    fillColor: text_filled_color,
                    filled: true,
                    errorStyle: errorTextStyle,
                    border: focusInputBorder,
                    enabledBorder: enableInputBorder,
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
            Container(
              height: 0.065 * sh,
              child: TextFormField(
                obscureText: showPassword,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelStyle: th.bodySmall,
                  fillColor: text_filled_color,
                  filled: true,
                  errorStyle: errorTextStyle,
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
            Container(
              height: 0.065 * sh,
              child: TextFormField(
                obscureText: true,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelStyle: th.bodySmall,
                  fillColor: text_filled_color,
                  filled: true,
                  errorStyle: errorTextStyle,
                  suffixIcon: thisPasswordIsTheSame == true
                      ? Icon(Icons.check, color: Colors.green)
                      : SizedBox(),
                  enabledBorder: enableInputBorder,
                  focusedBorder: focusInputBorder,
                  focusedErrorBorder: enableInputBorder,
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
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                
                'Hi, Welcome! 👋',
                textAlign: TextAlign.start,
                style: th.bodyLarge!.copyWith(fontWeight: FontWeight.bold,color: Colors.black)
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Type name',
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Type username',
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your request code logic here
                },
                child: Text('Request a code'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
