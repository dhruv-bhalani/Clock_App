import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Dhruv Bhalani"),
              accountEmail: Text("Dhruvbhalani9@.gmail"),
              decoration: BoxDecoration(color: Colors.red),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/156923442?s=400&u=8b2e6cf085f2185acbd956c2d57714c15f80d74e&v=4"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        // child:
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_sharp),
        onPressed: () {
          Navigator.of(context).pushNamed("clockpage");
        },
      ),
    );
  }
}
