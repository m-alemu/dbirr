import 'package:flutter/material.dart';
import 'package:dbirr/controller/my_controller.dart';
import 'package:dbirr/helpers/theme/theme_customizer.dart';

class LayoutController extends MyController {
  ThemeCustomizer themeCustomizer = ThemeCustomizer();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> scrollKey = GlobalKey();

  // LayoutController() {
  //   save = false;
  // }

  @override
  void onReady() {
    super.onReady();
    ThemeCustomizer.addListener(onChangeTheme);
  }

  void onChangeTheme(ThemeCustomizer oldVal, ThemeCustomizer newVal) {
    themeCustomizer = newVal;
    update();

    if (newVal.rightBarOpen) {
      scaffoldKey.currentState?.openEndDrawer();
    } else {
      scaffoldKey.currentState?.closeEndDrawer();
    }
  }

  enableNotificationShade() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  disableNotificationShade() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    super.dispose();
    ThemeCustomizer.removeListener(onChangeTheme);
  }
}
