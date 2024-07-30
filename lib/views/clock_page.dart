import 'dart:math';

import 'package:flutter/material.dart';

class clockpage extends StatefulWidget {
  const clockpage({super.key});

  @override
  State<clockpage> createState() => _clockpageState();
}

class _clockpageState extends State<clockpage> {
  int h = 0, s = 0, m = 0;
  void clock() {
    s = DateTime.now().second;
    m = DateTime.now().minute;
    h = DateTime.now().hour;
    setState(() {});
    Future.delayed(const Duration(seconds: 1), () {
      clock();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    clock();
    super.initState();
  }

  bool _isAnalog = false;
  bool _isStrap = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Dhruv bhalani'),
              accountEmail: Text('dhruvbhalani@10gmail.com'),
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/156923442?v=4"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Analog Dial',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Switch(
                      value: _isAnalog,
                      onChanged: (val) {
                        if ((!val) && _isAnalog) {
                          _isStrap = true;
                          _isAnalog = val;
                        } else {
                          _isStrap = false;
                          _isAnalog = val;
                        }
                        setState(() {});
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Strap Dial',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Switch(
                      value: _isStrap,
                      onChanged: (val) {
                        if ((!val) && _isStrap) {
                          _isAnalog = true;
                          _isStrap = val;
                        } else {
                          _isAnalog = false;
                          _isStrap = val;
                        }

                        setState(() {});
                      }),
                ],
              ),
            )
          ],
        ),
      ),
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
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: _isStrap,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.scale(
                      scale: 6,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value: (h % 12) / 12,
                        color: Colors.orange,
                      ),
                    ),
                    Transform.scale(
                      scale: 5,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value: m / 60,
                        color: Colors.red,
                      ),
                    ),
                    Transform.scale(
                      scale: 4,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value: s / 60,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _isAnalog,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg-oTXjhnNIh7HNSWTHeeNy3Lpq0yhwckvDA&s",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Transform.rotate(
                    angle: h * (pi * 2) / 12,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Divider(
                        color: Colors.black,
                        thickness: 7,
                        indent: 120,
                        endIndent: size.width * 0.5 - 16,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: m * (pi * 2) / 60,
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Divider(
                        color: Colors.black,
                        thickness: 5,
                        indent: 95,
                        endIndent: size.width * 0.5 - 16,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: s * (pi * 2) / 60,
                    child: Transform.rotate(
                      angle: pi / 3,
                      child: Divider(
                        color: Colors.red,
                        thickness: 2,
                        indent: 70,
                        endIndent: size.width * 0.5 - 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
