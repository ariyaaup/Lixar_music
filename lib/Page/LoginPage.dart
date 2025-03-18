import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lixar_music/Page/HomePage.dart';
import 'package:lixar_music/main.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to Sign In, Please try again!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
              ),
            ),
          ),
        );
      });
    }
  }

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  String errorMessage = ' ';

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF004D5C),
      ),
      body: Container(
        color: Color(0xFF004D5C),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'lib/assets/LixarMusic.png',
              height: 150,
              width: 150,
            ),
            TextField(
              controller: _controllerEmail,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
              obscureText: false,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF777777),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF333333),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                fillColor: const Color(0xFFFFFFFF),
                filled: true,
                hintText: 'Email',
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controllerPassword,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF777777),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF333333),
                    ),
                    borderRadius: BorderRadius.circular(15)),
                fillColor: const Color(0xFFFFFFFF),
                filled: true,
                hintText: 'Password',
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                signInWithEmailAndPassword();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 14, 157, 157),
              ),
              child: const Text(
                "Sign IN",
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset('lib/assets/or.png'),
            SizedBox(
              height: 20,
            ),
            IconButton(
              icon: Image.asset(
                'lib/assets/google.png',
                height: 40,
                width: 40,
              ),
              onPressed: () async {
                try {
                  await Auth().loginWithGoogle();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Successfully login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                  Navigator.popAndPushNamed(context, '/homePage');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to login with Google !',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                  print(e);
                }
              },
            ),
            IconButton(
              icon: Image.asset(
                'lib/assets/singup.png',
                fit: BoxFit.fill,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/registPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
