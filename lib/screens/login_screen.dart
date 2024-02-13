import 'package:event_list/main.dart';
import 'package:event_list/screens/home_screen.dart';
import 'package:event_list/backend/shared_preference/local_store.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _handleSignIn(BuildContext context) async {
    try {
      final result = await _googleSignIn.signIn();
      if (result != null) {
        // final GoogleSignInAccount account = result;
        prefs.setBool(LocalStore.isLoggedIn, true);
        print("Logged in");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (error) {
      print("##################"+error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with google'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleSignIn(context),
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
