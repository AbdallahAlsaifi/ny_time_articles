import 'dart:ui' as ui;

class Sizes {
  /// screen width & height
  static double screenWidth =
      ui.window.physicalSize.width / ui.window.devicePixelRatio;

  static double screenHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;

  /// Icon sizes
  static double soloCenteredIconSize = 50;
  static double smallIconSize = 16;

  /// Text sizes
  static double text1 = 18;
  static double text2 = 16;
  static double text3 = 14;

  /// layout sizes
  static double defaultSpacingHeight = 8;
  static double smallSpacingHeight = 5;

  static double defaultPadding = 16;
  static double screenSymmetricPadding = 12;
  static double screenPadding = 8;

  static double avatarRadius = 30;
  static double detailsImageHeight = screenHeight*0.25;


}
