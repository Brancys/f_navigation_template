import 'package:f_navigation_template/ui/pages/page1.dart';
import 'package:f_navigation_template/ui/pages/page2.dart';
import 'package:f_navigation_template/ui/pages/page3a.dart';
import 'package:f_navigation_template/ui/pages/page3b.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.greenM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      themeMode: ThemeMode.light,
      //todo: Implement name routing (initialRoute and getPages parameters)
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Page1()),
        GetPage(name: '/page2', page: () => Page2()),
        GetPage(name: '/page3a', page: () => const Page3A()),
        GetPage(name: '/page3b', page: () => Page3B()),
      ],
    );
  }
}
