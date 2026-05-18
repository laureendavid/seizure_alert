import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfhXtIo7JahGIZ2OQ-t_CUs3ou9xMoxsk",
            authDomain: "capstone-2fedw8.firebaseapp.com",
            projectId: "capstone-2fedw8",
            storageBucket: "capstone-2fedw8.firebasestorage.app",
            messagingSenderId: "209226694725",
            appId: "1:209226694725:web:527d79672fc85b74f2632c"));
  } else {
    await Firebase.initializeApp();
  }
}
