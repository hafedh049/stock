import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stock/utils/themes.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.dark,
      dark: darkTheme,
      light: lightTheme,
      builder: (ThemeData light, ThemeData dark) {
        return ResponsiveSizer(
          builder: (BuildContext context, Orientation orientation, ScreenType deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: light,
              darkTheme: dark,
              home: ,
            );
          },
        );
      },
    );
  }
}
