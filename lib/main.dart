import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gyym/Responsive/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gyym/providers/user_provider.dart';
import 'Responsive/mobile_screen.dart';
import 'Responsive/web_screen.dart';
import 'Screens/login_Screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
          title: 'GYYM',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black87,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveScreen(
                      webScreen: WebScreen(), mobScreen: MobileScreen());
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("%{snapshot.error}"),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const LoginScreen();
            },
          )),
    );
  }
}
