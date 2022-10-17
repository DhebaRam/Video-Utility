import 'package:flutter/material.dart';

import 'app_colors.dart';

//Screen Dimensions
Size? screenSize;

// Spacing Constant
const spacingTiny = 5.0;
const spacingXSmall = 7.5;
const spacingSmall = 10.0;
const spacingMedium = 15.0;
const spacingLarge = 20.0;
const spacingXLarge = 25.0;
const spacingXXLarge = 30.0;
const spacingXXMLarge = 35.0;
const spacingXXXLarge = 40.0;
const spacingXXXSLarge = 50.0;
const spacingXXXXLarge = 75.0;

const buttonLabelFontSize = 18.0;
const tabBarTitle = 15.0;

//Local Camera View
const horizontalWidth = 110.0;
const verticalLength = 139.0;

// Font Weight Constant
const fontWeightRegular = FontWeight.w400;

TextStyle regularTextStyle = const TextStyle(
    fontSize: labelFontSize,
    color: AppColor.colorPrimary,
    fontWeight: FontWeight.w600);
TextStyle smallTitleTextStyle = const TextStyle(
    fontSize: smallTitleSize,
    color: AppColor.white,
    fontWeight: FontWeight.w500);

TextStyle titleTextStyle = const TextStyle(
    fontSize: headerTitleSize,
    color: AppColor.white,
    fontWeight: FontWeight.w500);

BoxDecoration boxDecoration = const BoxDecoration(
    color: AppColor.white, borderRadius: BorderRadius.all(Radius.circular(3)));
BoxDecoration bottomSheetDecoration =
    const BoxDecoration(color: AppColor.white);

//To Get Dynamic Screen Size
void getScreenSize(BuildContext context) {
  screenSize = MediaQuery.of(context).size;
}

// Image Size Constant
const imageXLarge = 170.0;

//Icon Size Constant
const smallIconSize = 20.0;

//Container Size
const containerHeigth = 115.0;

//Sized Box Size
const smallWidth = 20.0;
const smallHeigth = 20.0;

// Font Size Constant
const labelFontSize = 16.0;
const smallTitleSize = 22.0;
const headerTitleSize = 30.0;

// Image Size Constant
const imageMTinyLarge = 80.0;
const imageMTinySmall = 50.0;
