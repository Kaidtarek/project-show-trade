import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/core/constTypes/const_color.dart';

IconButton Custom_image_buttons(
    {required double height, required double width, required BuildContext context,required VoidCallback onPressed, required String image}) {
  return IconButton(
      onPressed: onPressed, 
      icon: SvgPicture.asset(
        image,
        width: width,
        height:height,
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
