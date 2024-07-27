import 'dart:math';

import 'package:flutter/material.dart';

class clockpage extends StatefulWidget {
  const clockpage({super.key});

  @override
  State<clockpage> createState() => _clockpageState();
}

class _clockpageState extends State<clockpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/");
            },
            icon: const Icon(Icons.home),
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Transform.scale(
                scaleX: 5,
                child: const CircularProgressIndicator(
                  value: 1,
                ),
              ),
            ),
            Transform.rotate(
              angle: pi / 2,
              child: Divider(
                color: Colors.black,
                indent: 100,
                endIndent: 50,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Transform.translate(
                offset: Offset(0, 0), child: CircularProgressIndicator())
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.rotate_left),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              child: const Icon(Icons.rotate_right), onPressed: () {}),
        ],
      ),
    );
  }
}
