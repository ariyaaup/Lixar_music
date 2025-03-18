import 'package:flutter/material.dart';
import 'package:lixar_music/Page/ImageCarousel.dart';
import 'package:lixar_music/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004D5C),
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: true,
        foregroundColor: Color.fromARGB(255, 0, 238, 255),
        backgroundColor: const Color.fromARGB(98, 0, 255, 255),
        title: const Row(
          children: [
            SizedBox(width: 5),
            Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
                // fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFF004D5C),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'About developer',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.white38,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ImageCarousel(),
            ),
            Spacer(),
            Image.asset('lib/assets/singOut_or.png'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Auth().singOut();
                Auth().signOutGoogle();
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, '/loginPage');
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                "Sign out",
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
