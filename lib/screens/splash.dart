import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/backend/authenticationService.dart';
import 'package:show_trade/core/constTypes/const_color.dart';
import 'package:show_trade/core/constTypes/const_media.dart';

import '../main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Authenticationservice().getCurrentUser() == null ? context.go('/login') : context.go('/home');
      
    });

    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(splashBG,
                height: sh, width: sw, fit: BoxFit.cover),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 0.35 * sh),
                  SvgPicture.asset(splashLogo,
                      height: 0.15 * sh, width: 0.36 * sw, fit: BoxFit.cover),
                  SizedBox(
                    height: (0.33) * sh,
                  ),
                  Container(
                    height: 0.02 * sh,
                    width: 0.02 * sh,
                    child: CircularProgressIndicator(
                      backgroundColor: circularProgressBG,
                      color: circularProgressColor,
                      strokeWidth: 1,
                    ),
                  ),
                  SizedBox(height: sh * 0.13)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
