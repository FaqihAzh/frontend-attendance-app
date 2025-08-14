import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/themes/app_theme.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/controllers/attendance_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Attendance App',
      theme: AppTheme.lightTheme,
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => AttendanceController());
          }),
        ),
        // You can add other routes and their bindings here
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}