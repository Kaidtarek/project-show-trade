import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/core/constTypes/const_color.dart';
import 'package:show_trade/core/constTypes/const_media.dart';
import 'package:show_trade/widget/custom_widget.dart';
import 'package:show_trade/widget/functions.dart';

class RequestVerification extends StatelessWidget {
  // double sh, sw;
  RequestVerification({super.key});

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    TextTheme th = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.058 * sw),
          child: Column(
            children: [
              SizedBox(height: 0.14 * sh),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 1,
                          blurRadius: 60)
                    ]),
                child: SvgPicture.asset(
                  mail,
                ),
              ),
              SizedBox(height: 0.046 * sh),
              SizedBox(
                height: sh * 0.09,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'We have sent an email\nto ',
                          style: th.bodyMedium),
                      TextSpan(
                          text: 'auto@show-trade.com ',
                          style: th.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: 'with instructions to verification code sent.',
                          style: th.bodyMedium)
                    ])),
              ),
              SizedBox(
                height: 0.047 * sh,
              ),
              Custom_image_buttons(
                  height: sh * 0.06,
                  width: sw * 0.08,
                  context: context,
                  onPressed: () {},
                  image: next),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    // By using Classroom, you agree to the  Terms and Privacy Policy.
                    TextSpan(text: 'or ', style: th.bodyMedium),
                    WidgetSpan(
                      child: InkWell(
                        child: Text('sign out ',
                            style: th.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                color: primaryColor)),
                        onTap: () {
                          context.go('/splash');
                        },
                      ),
                    ),
                  ])),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: sh * 0.04),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        // By using Classroom, you agree to the  Terms and Privacy Policy.
                        TextSpan(
                            text: 'By using Classroom, you agree to the\n ',
                            style: th.bodyMedium),
                        WidgetSpan(
                          child: InkWell(
                            child: Text('Terms ',
                                style: th.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: primaryColor)),
                            onTap: () {privacyPolicy(context: context, sh: sh, sw: sw);},
                          ),
                        ),
                        TextSpan(text: 'and ', style: th.bodyMedium),
                        WidgetSpan(
                          child: InkWell(
                            child: Text('Privacy Policy.',
                                style: th.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: primaryColor)),
                            onTap: () {privacyPolicy(context: context, sh: sh, sw: sw);},
                          ),
                        ),
                      ])),
                ),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
