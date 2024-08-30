import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:playstore_flutter/store/AppStore.dart';
import 'package:playstore_flutter/utils/AppTheme.dart';
import 'package:playstore_flutter/utils/PSConstants.dart';
import 'package:playstore_flutter/screens/PSSplashScreen.dart';

AppStore appStore = AppStore();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  appStore.toggleDarkMode(value: await getBool(isDarkModeOnPref, defaultValue: false));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          title: 'PlayStore flutter',
        //  theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
          builder: scrollBehaviour(),
          debugShowCheckedModeBanner: false,
          home: PSSplashScreen(),
        );
      },
    );
  }
}
