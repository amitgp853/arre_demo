import 'package:arre_demo/constants/color_constants.dart';
import 'package:arre_demo/constants/string_constants.dart';
import 'package:arre_demo/modules/player/player_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorConstants.primaryColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstants.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: StringConstants.initial,
      getPages: [
        GetPage(
          name: StringConstants.initial,
          page: () => const PlayerScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => PlayerController());
          }),
        )
      ],
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: child ?? Container(),
    );
  }
}
