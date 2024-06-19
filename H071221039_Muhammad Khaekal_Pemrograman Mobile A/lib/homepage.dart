import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(26.0, 30.0, 35.0, 20.0),
            child: AppBar(
                title: const Text('Hello, Khaekal!'),
                actions: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=${Random().nextInt(70)}', // Ganti dengan URL gambar profil Anda
                    ),
                  )
                ]
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
              child: Text(
                "Momen Favorit",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(40, 20, 35, 0),
              child: Row(
                  children: List<FavoritePlace>.generate(
                      10, (index) {
                    return FavoritePlace(index: index + 1,);
                  }
                  )
              ),
            )
          ],
        )
    );
  }
}

class FavoritePlace extends StatelessWidget {
  const FavoritePlace({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: 280,
      height: 450,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Image.network(
              'https://picsum.photos/id/${index + 450}/200/300',
              fit: BoxFit.cover,
              height: 300,
              width: 280,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Place ${index}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Ditempat ini saya menemukan kenangan indah dengan dia, anjay dia',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
