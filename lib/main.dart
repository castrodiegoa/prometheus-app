import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prometheus_app/pages/login_page.dart';
import 'package:prometheus_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prometheus_app/firebase_options.dart';
import 'package:prometheus_app/pages/home_page.dart';
import 'package:prometheus_app/pages/find_your_account.dart';
import 'package:prometheus_app/pages/confirm_your_account.dart';
import 'package:prometheus_app/pages/create_new_password.dart';
import 'package:prometheus_app/pages/primera_descarga_introduccion.dart'; // Importa la página de introducción

void main() async {
  await GetStorage.init(); // Inicializa GetStorage
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage(); // Accede a la instancia de GetStorage
    bool hasSeenOnboarding = box.read('hasSeenOnboarding') ?? false;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prometheus App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Verifica si ya se mostró el onboarding o no
      initialRoute: hasSeenOnboarding ? '/home' : '/onboarding',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
        ),
        GetPage(
          name: '/onboarding',
          page: () => OnboardingPage(),
        ), // Página de Onboarding
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ), // Página principal
        GetPage(
          name: '/forgot-password',
          page: () => FindAccountScreen(),
        ),
        GetPage(
          name: '/confirm-account',
          page: () => ConfirmAccountScreen(),
        ),
        GetPage(
          name: '/create-password',
          page: () => NewPasswordScreen(),
        ),
      ],
    );
  }
}

