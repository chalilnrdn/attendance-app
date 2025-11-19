import 'package:attendance_app/wrapper/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD5BZ7kPA44gWI1XsRdtHjORQdZ0wAKgNQ", 
      appId: "1:348294672505:android:d419e2c19d4842f0f5a4a8", 
      messagingSenderId: "348294672505", 
      projectId: "attendance-app-38d27"
      )
  );

  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light
          ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0
        ),
      ),
      home: AuthWrapper(),
    );
  }
}