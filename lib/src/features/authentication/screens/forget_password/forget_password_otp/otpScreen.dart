import 'package:agri_x/src/constants/colors.dart';
import 'package:agri_x/src/constants/sizes.dart';
import 'package:agri_x/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// ignore: must_be_immutable
class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  var otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CO\nDE",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(
              "VERIFICATION",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 30.0),
            const Text(
              "Enter Verification Code",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                // print("OTP is => $code");
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.black,
                  foregroundColor: SWhiteColor,
                  side: const BorderSide(color: SSecondaryColor),
                  padding: const EdgeInsets.symmetric(vertical: SButtonHeight),
                ),
                child: const Text(
                  ("Verify"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
