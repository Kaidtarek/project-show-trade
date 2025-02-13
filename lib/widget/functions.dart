import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:show_trade/core/constTypes/const_color.dart';
import 'package:show_trade/core/constTypes/const_media.dart';
import 'package:show_trade/core/constTypes/const_texts.dart';

privacyPolicy({required BuildContext context, required double sh, required double sw}) {

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
                              style: th.headlineSmall,
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
                          scroll_to_bottom),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }