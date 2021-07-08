import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/controllers/authController.dart';
import 'package:dashbaord/controllers/menu_controller.dart';
import 'package:dashbaord/controllers/navigation_controller.dart';
import 'package:dashbaord/layout.dart';
import 'package:dashbaord/pages/404/error_page.dart';
import 'package:dashbaord/pages/authintication/authentication.dart';
import 'package:dashbaord/pages/clients/clients.dart';
import 'package:dashbaord/pages/drivers/drivers.dart';
import 'package:dashbaord/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MenuController());
  Get.put(NavigationController());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AuthinticationPageRoute,
      unknownRoute: GetPage(
        name: "not-found",
        page: () => PageNotFound(),
        transition: Transition.fadeIn,
      ),
      getPages: [
        GetPage(name: RootRoute, page: () => SiteLayout()),
        GetPage(
            name: AuthinticationPageRoute, page: () => AuthenticationPage()),
        GetPage(name: DriverPageRoute, page: () => DriversPage()),
        GetPage(name: ClientsPageRoute, page: () => ClientsPage()),
      ],
      debugShowCheckedModeBanner: false,
      title: "Dash",
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
    );
  }
}
