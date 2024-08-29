import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3B58A1),
          title: const Text(
            'Hello Admin',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                children: [
                  Image.network('https://picsum.photos/250?image=1'),
                  Image.network('https://picsum.photos/250?image=2'),
                  Image.network('https://picsum.photos/250?image=3'),
                  Image.network('https://picsum.photos/250?image=4'),
                ],
              )
            ],
          ),
        ));
  }
}

class Navigators extends StatelessWidget {
  final Icon icon;
  Function fun;
  Navigators({super.key, required this.icon, required this.fun});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(
      children: [
        SizedBox(
          height: 1,
        )
      ],
    ));
  }
}
