import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Dhruv Bhalani"),
              accountEmail: Text("Dhruvbhalani9@.gmail"),
              decoration: BoxDecoration(color: Colors.red),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/156923442?s=400&u=8b2e6cf085f2185acbd956c2d57714c15f80d74e&v=4"),
              ),
            ),
            const Text(
              "Clocks",
              selectionColor: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRmy9tqJR9bUTjT-fEEzVk4txB01RRKHG1Mw&s"
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWYzGfZUrsi8J-sPK5EwwuPUVcGGBgyBWhPQ&s"),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: AnalogClock(
            digitalClockColor: Colors.black,
            height: 500,
            numberColor: Colors.blue,
            tickColor: Colors.red,
          ),
        ),
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
