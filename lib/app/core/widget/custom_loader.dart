///Author-Pushkar Srivastava
///Date-11/06/22
import 'package:flutter/material.dart';
import 'package:riverpod_sample/app/core/widget/elevated_container.dart';

import '/app/core/values/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ElevatedContainer(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(
          color: AppColors.colorPrimary,
        ),
      ),
    );
  }
}
