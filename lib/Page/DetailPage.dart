import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String artist;
  final String albumTitle;
  final String albumCoverUrl;
  final int duration;
  final int rank;

  const DetailPage({
    super.key,
    required this.title,
    required this.artist,
    required this.albumTitle,
    required this.albumCoverUrl,
    required this.duration,
    required this.rank,
  });

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
              'Detail song',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Album Cover
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  albumCoverUrl,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // Track Title
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 238, 255),
                ),
              ),

              const SizedBox(height: 10),

              // Artist Name
              Text(
                'Artist : $artist', // Display static artist name
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.white60,
                ),
              ),

              const SizedBox(height: 10),

              // Album Title
              Text(
                'Album : $albumTitle', // Display static album title
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.white60,
                ),
              ),

              const SizedBox(height: 10),

              // Album Duration
              Text(
                "Duration : $duration's ", // Display static album title
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.white60,
                ),
              ),

              const SizedBox(height: 10),

              // Album rank
              Text(
                'Rank : $rank', // Display static album title
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
