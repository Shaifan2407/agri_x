import 'package:agri_x/src/constants/colors.dart';
import 'package:agri_x/src/constants/image_string.dart';
import 'package:agri_x/src/constants/text_string.dart';
import 'package:agri_x/src/features/authentication/models/model_on_boarding.dart';
import 'package:agri_x/src/features/authentication/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: SOnBoardingImage1,
        title: SOnBoardingTitle1,
        subTitle: SOnBoardingSubTitle1,
        counterText: SOnBoardingCounter1,
        //height: size.height,
        bgcolor: SOnBoardingPage1Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: SOnBoardingImage2,
        title: SOnBoardingTitle2,
        subTitle: SOnBoardingSubTitle2,
        counterText: SOnBoardingCounter2,
        //height: size.height,
        bgcolor: SOnBoardingPage2Color,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: SOnBoardingImage3,
        title: SOnBoardingTitle3,
        subTitle: SOnBoardingSubTitle3,
        counterText: SOnBoardingCounter3,
        //height: size.height,
        bgcolor: SOnBoardingPage3Color,
      ),
    )
  ];

  void OnPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
