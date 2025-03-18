import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lixar_music/Page/DetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    'Search Albums',
    'Fundamental Chord',
    'Progresi Chord',
  ];
  int _selectedIndex = 0;

  TextEditingController searchController = TextEditingController();
  List<dynamic> albums = [];

  // Function to fetch albums
  Future<void> searchAlbums(String query) async {
    if (query.isEmpty) {
      setState(() {
        albums = [];
      });
      return;
    }

    final url =
        Uri.parse('https://deezerdevs-deezer.p.rapidapi.com/search?q=$query');
    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '2cefc083d9msh90ba4b8bb483a49p116402jsn13c58bae9599',
        'x-rapidapi-host': 'deezerdevs-deezer.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        albums = data['data'];
      });
    } else {
      throw Exception('Failed to load albums');
    }
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  searchAlbums(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search Songs',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                    fontFamily: 'Poppins',
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white60,
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 0, 41, 49),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            if (albums.isNotEmpty)
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  var album = albums[index];
                  return ListTile(
                    title: Text(
                      album['title'] ?? 'Unknown',
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 13,
                      ),
                    ),
                    subtitle: Text(
                      album['artist']?['name'] ?? 'No Artist',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                        fontSize: 11,
                      ),
                    ),
                    onTap: () {
                      // Navigate to DetailPage and pass the album data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            title: album['title'],
                            artist: album['artist']['name'],
                            albumTitle: album['album']['title'],
                            albumCoverUrl: album['album']['cover_medium'],
                            duration: album['duration'] ?? 0,
                            rank: album['rank'] ?? 0,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            if (albums.isEmpty && searchController.text.isNotEmpty)
              const Center(
                child: Text(
                  'No results found.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            SizedBox(height: 15),
            if (searchController.text.isEmpty)
              const Center(
                child: Text(
                  "Let's know the song you want",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                ),
              ),
          ],
        );
      case 1:
        return Column(
          children: [
            SizedBox(height: 10),
            Image.asset(
              'lib/assets/BaseChord.png',
              height: 400,
              width: 400,
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                'Beberapa chord diatas merupakan Chord Dasar dalam bermain gitar.\n'
                'Dalam bermain gitar, Chord dasar seperti diatas sering disebut sebagai "Chord Gampang".\n\n'
                'Perlu diingat, urutan senar pada gitar dimulai dari bawah, yang berarti paling bawah merupakan senar 1.\n'
                'Semua chord dasar/chord gampang ini berada di rentang kurang lebih Fret 1-4\n\n'
                'Selain chord dasar diatas, ada juga Chord gantung atau "Chord Balok".\n\n'
                'Berikut beberapa Chord Balok yang sering digunakan : ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Image.asset(
              'lib/assets/F_chord.png',
              width: 370,
              height: 130,
            ),
            Image.asset(
              'lib/assets/G_chord.png',
              width: 370,
              height: 130,
            ),
            Image.asset(
              'lib/assets/A_chord.png',
              width: 370,
              height: 130,
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                'Perlu Kalian ingat dan ketahui, semua chord Mayor yang memiliki pola seperti di atas\n'
                '(F, G, A) memiliki Minor balok di fret yang sama, hanya menghapus 1 jari yang menekan senar 3.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'lib/assets/B_chord.png',
              width: 370,
              height: 130,
            ),
            Image.asset(
              'lib/assets/C_chord.png',
              width: 370,
              height: 130,
            ),
            Image.asset(
              'lib/assets/D_chord.png',
              width: 370,
              height: 130,
            ),
            Image.asset(
              'lib/assets/E_chord.png',
              width: 370,
              height: 130,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                'Lalu, ketika Chord Mayor memiliki pola seperti Chord dasar A seperti gambar diatas\n'
                '(B, C, D, E) memiliki Minor balok di fret yang sama, yang diubah hanya posisi yang semula seperti Chord A,\nmenjadi seperti Chord Balok(F, G, A).\n\n'
                'Kalian juga bisa berusaha mengikat kalau Chord Balok B, C, D, E beserta Minornya yang benar hanya memblok hingga senar 5, oleh karena itu pada gambar diatas senar 6 diberi tanda X\n\n'
                '*Catatan : Tanda "#" pada Chord bisa disebut Sharp atau Crash. Cara mengetahui letak dari Chord ini, kalian hanya perlu menggeser 1 fret ke kanan dari chord tersebut berada.\n'
                'Kalian bisa pertahatikan gambar diatas pada bagian Yang dilingkari.\n'
                'Contoh : D berada di Fret 5, ketika menjadi D# berada di Fret 6.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Image.asset(
              'lib/assets/ProgresiChord.png',
              width: 380,
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  'Dalam memainkan sebuah lagu, kalian bisa untuk mengingat Progresi Chord guna memainkan lagu tanpa terpaku pada hafalan chord, dan memudahkan kalian utuk melakukan Inprovisasi.\n\n'
                  'Dalam tabel diatas kalian bisa memahaminya bahwa angka romawi ialah sebagai urutan Chord. Romawi I ialah Mayor Chord, lalu II urutan ke-2 dari chord tersebut, dan seterusnya.\n\n'
                  'Berikut beberapa kegunaan utama dari progresi chord:\n\n'
                  '-> Menentukan suasana dan emosi: Progresi chord yang berbeda dapat menciptakan suasana dan emosi yang berbeda-beda. Misalnya, progresi chord mayor cenderung terdengar ceria dan optimis, sedangkan progresi chord minor cenderung terdengar melankolis atau sedih.\n\n'
                  '-> Membentuk melodi: Melodi sebuah lagu seringkali mengikuti atau berinteraksi dengan progresi chord. Progresi chord yang kuat dapat memberikan dasar yang kokoh bagi melodi yang indah.\n\n'
                  '-> Menciptakan variasi: Dengan mengubah progresi chord, kita dapat menciptakan variasi dalam sebuah lagu, membuatnya tidak monoton.\n\n'
                  '-> Mengidentifikasi genre musik: Progresi chord tertentu seringkali dikaitkan dengan genre musik tertentu. Misalnya, progresi I-IV-V sangat umum ditemukan dalam musik rock, sedangkan progresi II-V-I sering digunakan dalam jazz.\n\n'
                  '-> Memudahkan improvisasi: Memahami progresi chord dapat membantu musisi untuk melakukan improvisasi dengan lebih mudah, karena mereka sudah memiliki dasar harmoni yang kuat.\n\n'
                  'Contoh Sederhana:\n'
                  '-> Bayangkan sebuah lagu anak-anak yang sederhana. Progresi chord yang sering digunakan adalah I-IV-V (misalnya, C-F-G). Progresi ini sangat mudah diingat dan memberikan kesan yang ceria dan menyenangkan.\n\n'
                  '*Dalam konteks yang lebih luas, progresi chord adalah bahasa universal dalam musik. Dengan memahami bagaimana progresi chord bekerja, kita dapat lebih menghargai keindahan musik dan bahkan menciptakan musik kita sendiri.\n\n'
                  'Intinya, progresi chord adalah elemen fundamental dalam musik yang memiliki peran penting dalam menciptakan suasana, melodi, dan struktur sebuah lagu.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )),
          ],
        );
      default:
        return const Text(
          "Content not available.",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 14,
          ),
        );
    }
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 0, 255, 247)
              : const Color.fromARGB(98, 0, 255, 247),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            categories[index],
            style: TextStyle(
              color: Color.fromARGB(255, 2, 55, 65),
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004D5C),
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(98, 0, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profilePage');
              },
              icon: Image.asset(
                "lib/assets/user.png",
                color: Color.fromARGB(255, 2, 55, 65),
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Welcome to Lixar Music!',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // ScrollView pada root
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategoryItem(index),
              ),
            ),
            const SizedBox(height: 5),
            _buildContent(),
          ],
        ),
      ),
    );
  }
}
