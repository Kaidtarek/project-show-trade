import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/backend/authenticationService.dart';
import 'package:show_trade/core/constTypes/const_color.dart';

IconButton Google_SignIn_Widget(
    {required double sw, required double sh, required BuildContext context}) {
  return IconButton(
      onPressed: () async {
        await Authenticationservice().SigninWithGoogle(context: context);
      },
      icon: SvgPicture.asset(
        'assets/login_and_signup/continue_with_google.svg',
        width: 0.883 * sw,
        height: 0.06 * sh,
      ));
}

Widget Or_login_with_email_color() {
  return AutoSizeText(
    'OR LOGIN WITH EMAIL',
    style: TextStyle(
        fontSize: 14.58, fontWeight: FontWeight.w700, color: login_email_color),
    minFontSize: 10,
    stepGranularity: 10,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

RichText Already_have_account({required BuildContext context}) {
  return RichText(
    text: TextSpan(children: <InlineSpan>[
      TextSpan(
          text: 'Already have an account?',
          style: TextStyle(
              color: login_email_color,
              fontWeight: FontWeight.w400,
              fontSize: 16.77)),
      WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                ' SIGN IN',
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.77),
              )))
    ]),
  );
}
// 

// 
// 
// 
// 
// 
// 
// 
