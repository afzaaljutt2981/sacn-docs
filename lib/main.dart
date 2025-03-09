import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:scan_docs/global/appConfigs/hive_setup.dart';
import 'package:scan_docs/ui/splash/splash_view.dart';
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await AppStartupConfiguration.doConfigurations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        responsiveWidgets: [MaterialApp.router.toString()],
        splitScreenMode: true,
        builder: (context, child) {
          SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          );
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scan Docs',
            home: MySplashScreen(),
          );
        });
  }
}
