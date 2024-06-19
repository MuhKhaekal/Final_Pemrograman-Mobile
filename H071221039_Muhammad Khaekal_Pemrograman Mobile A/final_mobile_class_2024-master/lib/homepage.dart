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
            title: const Text('Hai, Kelvin!'),
            actions: [
              CircleAvatar(
                radius: 28,
                child: FlutterLogo(size: 25),
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
              "Tempat Favorit",
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
              children: List<scrollview>.generate(
                10, (index) {
                  return scrollview(index: index + 450,);
                }
              )
            ),
          )
        ],
      )
    );
  }
}

class scrollview extends StatelessWidget {
  const scrollview({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          'https://picsum.photos/id/' + index.toString() + '/200/300',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}