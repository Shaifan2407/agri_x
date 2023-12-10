import 'package:agri_x/src/constants/colors.dart';
import 'package:agri_x/src/constants/image_string.dart';
import 'package:agri_x/src/constants/sizes.dart';
import 'package:agri_x/src/constants/text_string.dart';
import 'package:agri_x/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:agri_x/src/features/authentication/screens/sign-up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    //var brightness = mediaQuery.platformBrightness;
    //final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: SPrimaryColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: const AssetImage(SWelcomeScreenImage),
                height: height * 0.6),
            Column(
              children: [
                Text(
                  SWelcomeTitle,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  SWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: SSecondaryColor),
                        padding:
                            const EdgeInsets.symmetric(vertical: SButtonHeight),
                      ),
                      child: Text(
                        SLogin.toUpperCase(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => SignUpScreen()),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.black,
                        foregroundColor: SWhiteColor,
                        side: const BorderSide(color: SSecondaryColor),
                        padding:
                            const EdgeInsets.symmetric(vertical: SButtonHeight),
                      ),
                      child: Text(
                        SSignUp.toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
