import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF004D5C),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Aplikasi
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0), // Jarak dari atas layar
              child: Image.asset(
                'lib/assets/LixarMusic.png', // Ganti dengan path logo Anda
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 100), // Jarak antara logo dan teks pengantar
            // Teks Pengantar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Halo, musisi! Selamat datang di Lixar Music!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Mainkan melodi hatimu dengan chord yang mudah. Musikmu, chord-mu. Mari belajar berkreasi dengan Gitar-mu!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 229, 255)
                          .withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
            // Tombol Get Started
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/loginPage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
