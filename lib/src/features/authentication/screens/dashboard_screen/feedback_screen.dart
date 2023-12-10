import 'package:agri_x/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => const NavigationMenu());
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        centerTitle: true,
        title: Text("Profile", style: Theme.of(context).textTheme.headline4),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LineAwesomeIcons.moon))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Provide Your Feedback',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text('We appreciate your feedback!'),
            SizedBox(height: 20),
            TextField(
              maxLines: 5, // Adjust the number of lines as needed
              decoration: InputDecoration(
                labelText: 'Enter your feedback here',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
