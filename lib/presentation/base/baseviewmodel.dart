abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //Here we have the shared variables & functions that will be used throughout any viewModel.

}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. viewModel
  void dispose(); //will be called when viewModel dies
}

abstract class BaseViewModelOutputs {}
