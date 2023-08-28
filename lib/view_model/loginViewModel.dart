import 'package:get/get.dart';

class LoginViewModel extends GetxController{

  RxBool checkValue = false.obs;

  changeValue(RxBool value){
    checkValue = value;
    //update();
  }
}