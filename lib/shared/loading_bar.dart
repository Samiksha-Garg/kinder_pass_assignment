import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/constants.dart';

class MyLoadingBar extends StatelessWidget {
  MyLoadingBar({required this.child, required this.isLoading});

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        // color: kPrimaryColor,
        progressIndicator: Container(
          padding: const EdgeInsets.all(4.0),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            strokeWidth: 2.0,
          ),
        ),
        inAsyncCall: isLoading,
        child: child);
  }
}
