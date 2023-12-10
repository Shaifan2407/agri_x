import 'package:agri_x/src/constants/colors.dart';
import 'package:agri_x/src/constants/image_string.dart';
import 'package:agri_x/src/constants/sizes.dart';
import 'package:agri_x/src/features/authentication/controllers/profile_controller.dart';
import 'package:agri_x/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        centerTitle: true,
        title:
            Text("Edit Profile", style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(SDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(SLoginScreenImage),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: SPrimaryColor,
                              ),
                              child: const Icon(LineAwesomeIcons.camera,
                                  size: 20.0, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullName,
                              decoration: const InputDecoration(
                                  label: Text("Full Name"),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded)),
                            ),
                            const SizedBox(height: SFormHeight - 20),
                            TextFormField(
                              initialValue: userData.email,
                              decoration: const InputDecoration(
                                  label: Text("E-mail"),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            const SizedBox(height: SFormHeight - 20),
                            TextFormField(
                              initialValue: userData.phoneNo,
                              decoration: const InputDecoration(
                                  label: Text("Phone No"),
                                  prefixIcon: Icon(Icons.numbers)),
                            ),
                            const SizedBox(height: SFormHeight - 20),
                            TextFormField(
                              initialValue: userData.password,
                              decoration: const InputDecoration(
                                  label: Text("Password"),
                                  prefixIcon: Icon(Icons.fingerprint)),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: SPrimaryColor,
                                  foregroundColor: SDarkColor,
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: SButtonHeight),
                                ),
                                child: const Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      color: SDarkColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text("Something Went Wrong"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
