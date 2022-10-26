import 'dart:async';

import 'package:tut_app/domain/model.dart';
import 'package:tut_app/presentation/base/baseviewmodel.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //Stream controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late List<SliderObject> _list;
  int _currentIndex = 0;

  //*inputs sec
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //Send this slider data to our view depending on the current index
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++; //+!
    if (nextIndex >= _list.length) {
      _currentIndex = 0; //To create infinite loop and go to the first index
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--; //-1
    if (previousIndex == -1) {
      //*Notice if the list has 4 items, that means 0,1,2,3 | I know u know that, but hell yeah I repeat it again
      _currentIndex = _list.length - 1;
      //To create infinite loop and go to the the length of slider list
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //*Output sec
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //Private functions
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

  _postDataToView() {
    //Adding data to the sink to be available in the stream
    inputSliderViewObject.add(SliderViewObject(
      _list[_currentIndex],
      _list.length,
      _currentIndex,
    ));
  }
}

//Inputs mean the orders that our ViewModel will recieve from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); //When the user clicks on the right arrow or swipe lift.
  void goPrevious(); //When the user clicks on the left arrow or swipe right.
  void onPageChanged(int index);
  Sink
      get inputSliderViewObject; //This is the way we add to the streams, stream input
}

//Inputs mean the data or results that will be sent from our view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(
    this.sliderObject,
    this.numOfSlides,
    this.currentIndex,
  );
}
