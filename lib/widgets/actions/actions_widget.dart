import 'package:cryptotradex/widgets/actions/action_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';

Padding actionsWidget(ThemeData themeData) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        actionWidget(UniconsLine.download_alt, 'Receive', themeData, (){
          //idhar receive button ka logic daldio
        }),
        actionWidget(UniconsLine.money_bill, 'Topup', themeData, () {
          //idhar topup button ka logic daldio
        
        }),
        actionWidget(UniconsLine.upload_alt, 'Withdraw', themeData, () {
          //idhar withdraw button ka logi daldio
        }),
      ],
    ),
  );
}