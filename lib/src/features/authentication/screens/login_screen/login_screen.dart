import 'package:agri_x/src/constants/colors.dart';
import 'package:agri_x/src/constants/image_string.dart';
import 'package:agri_x/src/constants/sizes.dart';
import 'package:agri_x/src/constants/text_string.dart';
import 'package:agri_x/src/features/authentication/controllers/signup_controller.dart';
import 'package:agri_x/src/features/authentication/screens/forget_password/forget_password_otp/otpScreen.dart';
import 'package:agri_x/src/features/authentication/screens/sign-up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    //final controller = Get.put(LoginController());
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(SDefaultSize),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /* -- section-1 -- */
              Image(
                image: const AssetImage(SWelcomeScreenImage),
                height: size.height * 0.2,
              ),
              Text(
                SLoginTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                SLoginSubTitle,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              /* -- end -- */

              /* -- section-2 --*/
              Form(
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.phoneNo,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "Phone No",
                        hintText: "PhoneNo",
                      ),
                    ),
                    const SizedBox(
                      height: SFormHeight - 10,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          SignUpController.instance.phoneAuthentication(
                              controller.phoneNo.text.trim());
                          Get.to(() => OTPScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: Colors.black,
                          foregroundColor: SWhiteColor,
                          side: const BorderSide(color: SSecondaryColor),
                          padding: const EdgeInsets.symmetric(
                              vertical: SButtonHeight),
                        ),
                        child: const Text("LOGIN"),
                      ),
                    ),
                    const SizedBox(
                      height: SFormHeight - 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("OR"),
                        const SizedBox(
                          height: SFormHeight - 18,
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              vertical:
                                  10.0), // Adjust vertical margin as needed
                          child: OutlinedButton.icon(
                            icon: const Image(
                              image: AssetImage(SGoogleLogo),
                              width: 20.0,
                            ),
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              foregroundColor: Colors.black,
                              side: const BorderSide(color: SSecondaryColor),
                              padding: const EdgeInsets.symmetric(
                                  vertical: SButtonHeight),
                            ),
                            label: Text("Sign in With Google".toUpperCase()),
                          ),
                        ),
                        const SizedBox(
                          height: SFormHeight - 18,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child: Text.rich(
                            TextSpan(
                              text: "Don't have an Account?",
                              style: Theme.of(context).textTheme.bodyText1,
                              children: const [
                                TextSpan(
                                    text: " Sign Up",
                                    style: TextStyle(color: Colors.blue)),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
