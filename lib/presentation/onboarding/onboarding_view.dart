// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/colors_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentIndex = 0;

  late List<SliderObject> _list = _getSliderData();

  final PageController _pageController = PageController(initialPage: 0);

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onboardingLogo4,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        // elevation: AppSize.s1_5,
        elevation: 0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(
            //*Best Approach
            //*_list is a type List<SliderObject> but _list[index] is a SliderObject
            sliderObject: _list[index],
            //*Approach2 here is dump cuz _list[] is already a sliderObject bro
            // sliderObject: SliderObject(
            //   _list[index].title,
            //   _list[index].subtitle,
            //   _list[index].image,
            // ),
          );
        },
      ),
      bottomSheet: Container(
        color: ColorManager.darkGrey,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Left arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
            onTap: () {
              //go to the previous slide
              _pageController.animateToPage(
                _getPreviousIndex(),
                duration: Duration(
                  milliseconds: DurationConstant.d100,
                ),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),

        //Circle indicators
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(index: i),
              ),
          ],
        ),
        //Right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              height: AppSize.s20,
              width: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),
            onTap: () {
              //go to the next slide
              _pageController.animateToPage(
                _getNextIndex(),
                duration: Duration(
                  milliseconds: DurationConstant.d100,
                ),
                curve: Curves.bounceInOut,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getProperCircle({required int index}) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc); //slected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); //unselected slider
    }
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex--; //-1
    if (previousIndex == -1) {
      //*Notice if the list has 4 items, that means 0,1,2,3 | I know u know that, but hell yeah I repeat it again
      _currentIndex = _list.length -
          1; //To create infinite loop and go to the the length of slider list
    }
    return _currentIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex++; //+!
    if (nextIndex >= _list.length) {
      _currentIndex = 0; //To create infinite loop and go to the first index
    }
    return _currentIndex;
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage({
    Key? key,
    required this.sliderObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppSize.s40),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              sliderObject.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(
              sliderObject.subtitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(height: AppSize.s60),
          SvgPicture.asset(sliderObject.image),
        ],
      ),
    );
  }
}

class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject(
    this.title,
    this.subtitle,
    this.image,
  );
}
