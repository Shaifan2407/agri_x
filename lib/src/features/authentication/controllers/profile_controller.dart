import 'package:agri_x/src/repository/authentication_repository/authentication_repository.dart';
import 'package:agri_x/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  //get user email
  getUserData() {
    final email = _authRepo.firebaseUser.value?.phoneNumber;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
