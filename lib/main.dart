import 'package:event_list/backend/providers/event_provider.dart';
import 'package:event_list/routes/router.dart';
import 'package:event_list/screens/home_screen.dart';
import 'package:event_list/screens/login_screen.dart';
import 'package:event_list/backend/shared_preference/local_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<EventProvider>(
      create: (_) => EventProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = prefs.getBool(LocalStore.isLoggedIn) ?? false;
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: EventRouter.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn ? HomeScreen() : LoginScreen(),
      //833867022416-ham2kcac3b5upomn032mv9fho5m2b62m.apps.googleusercontent.com
    );
  }
}
