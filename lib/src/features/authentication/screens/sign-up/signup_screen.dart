import 'package:agri_x/src/constants/colors.dart';
import 'package:agri_x/src/constants/image_string.dart';
import 'package:agri_x/src/constants/sizes.dart';
import 'package:agri_x/src/constants/text_string.dart';
import 'package:agri_x/src/features/authentication/controllers/signup_controller.dart';
import 'package:agri_x/src/features/authentication/models/user_model.dart';
import 'package:agri_x/src/features/authentication/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(SDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* -- section-1 -- */
                Image(
                  image: const AssetImage(SWelcomeScreenImage),
                  height: size.height * 0.2,
                ),
                Text(
                  "Get On Board",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "Create your profile to start your journey",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: SFormHeight - 10),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.fullName,
                          decoration: const InputDecoration(
                              label: Text("Full Name"),
                              prefixIcon: Icon(Icons.person_outline_rounded)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                              label: Text("Email"),
                              prefixIcon: Icon(Icons.email_outlined)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.phoneNo,
                          decoration: const InputDecoration(
                              label: Text("Phone No"),
                              prefixIcon: Icon(Icons.numbers)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone no';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.password,
                          decoration: const InputDecoration(
                              label: Text("Password"),
                              prefixIcon: Icon(Icons.fingerprint)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                // SignUpController.instance.registerUser(
                                //     controller.email.text.trim(),
                                //     controller.password.text.trim());
                                //============================================
                                // SignUpController.instance.phoneAuthentication(
                                //     controller.phoneNo.text.trim());
                                // Get.to(() => OTPScreen());
                                //============================================
                                final user = UserModel(
                                  email: controller.email.text.trim(),
                                  password: controller.password.text.trim(),
                                  phoneNo: controller.phoneNo.text.trim(),
                                  fullName: controller.fullName.text.trim(),
                                );
                                SignUpController.instance.createUser(user);
                                //SignUpController.instance.createUser(user);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              backgroundColor: Colors.black,
                              foregroundColor: SWhiteColor,
                              side: const BorderSide(color: SSecondaryColor),
                              padding: const EdgeInsets.symmetric(
                                  vertical: SButtonHeight),
                            ),
                            child: Text(SSignUp.toUpperCase()),
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                  side:
                                      const BorderSide(color: SSecondaryColor),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: SButtonHeight),
                                ),
                                label:
                                    Text("Sign in With Google".toUpperCase()),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(LoginScreen());
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "Already Have an account? ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                  children: [
                                    TextSpan(
                                        text: SLogin.toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.blue)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
