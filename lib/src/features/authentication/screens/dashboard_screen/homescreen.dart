import 'package:agri_x/src/constants/colors.dart';
import 'package:agri_x/src/features/authentication/screens/dashboard_screen/News_Screen.dart';
import 'package:agri_x/src/features/authentication/screens/dashboard_screen/contact_Us_Screen.dart';
import 'package:agri_x/src/features/authentication/screens/dashboard_screen/feedback_screen.dart';
import 'package:agri_x/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:get/get.dart';
import 'monitoring_screen.dart';
import 'profile_screen.dart';
import 'store_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Agri-X"),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.logout_1_copy),
              tooltip: 'Log Out',
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
            ),
          ],
          backgroundColor: SPrimaryColor,
          elevation: 50.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                items: [
                  'assets/images/1.jpg',
                  'assets/images/2.jpg',
                  'assets/images/3.jpg',
                ].map((assetPath) {
                  return Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildClickableSection(context, 'Store', Icons.store, () {
                    // Navigate to the Store screen using GetX
                    Get.to(() => ProductGridScreen());
                  }),
                  _buildClickableSection(context, 'Monitoring', Icons.monitor,
                      () {
                    // Navigate to the Monitoring screen using GetX
                    Get.to(() => const MonitoringScreen());
                  }),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildClickableSection(context, 'Profile', Icons.person, () {
                    // Navigate to the Profile screen using GetX
                    Get.to(() => const ProfileScrren());
                  }),
                  _buildClickableSection(
                      context, 'Agri news', Icons.contact_mail, () {
                    Get.to(() => const NewsScreen());
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildClickableSection(context, 'Contact Us', Icons.person,
                      () {
                    // Navigate to the Profile screen using GetX
                    Get.to(() => const ContactUsScreen());
                  }),
                  _buildClickableSection(
                      context, 'FeedBack', Icons.contact_mail, () {
                    Get.to(() => const FeedbackScreen());
                  }),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableSection(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.4, // Adjust the width as needed
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40.0,
              color: SPrimaryColor,
            ),
            const SizedBox(height: 10.0),
            Text(
              title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
