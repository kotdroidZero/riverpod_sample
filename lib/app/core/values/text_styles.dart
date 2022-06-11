import 'package:flutter/material.dart';
import 'package:riverpod_sample/app/core/values/app_colors.dart';

const pageTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: AppColors.appBarTextColor);

const cardTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: AppColors.textColorPrimary);

const labelStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w700,
  height: 1.8,
  color: Colors.white,
);

final labelStylePrimaryTextColor = labelStyle.copyWith(
  color: AppColors.textColorPrimary,
  height: 1,
);
