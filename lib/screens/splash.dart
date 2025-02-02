import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:show_trade/core/const_color.dart';
import 'package:show_trade/core/const_media.dart';
import 'package:show_trade/screens/login.dart';

import '../main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/login');
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
                    width: 0.05 * sw,
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
