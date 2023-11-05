import 'package:flutter/material.dart';

class StepperProvider extends ChangeNotifier {
  int currentStep = 0;

  void onStepContinue() {
    if (currentStep <= 1) {
      currentStep++;
    }
    notifyListeners();
  }

  void onStepCancel() {
    if (currentStep > 0) {
      currentStep--;
    }
    notifyListeners();
  }
}
