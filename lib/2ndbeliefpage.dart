import 'package:flutter/material.dart';
import 'package:flutter_application_5/belief.dart';

class beliefpage extends StatelessWidget {
  const beliefpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belief'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('            Belief           '),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 241, 43, 181),
                  onPrimary: Colors.black,
                  side: BorderSide(width: 3, color: Colors.pink),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(20)),
            ),
            SizedBox(
              height: 50,
            ),
            Theme(
              data: ThemeData(
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      side: BorderSide(width: 3, color: Colors.pink),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20)),
                ),
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    child: const Text('   Old Belief   '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('     New Belief     '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('     Category     '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('          Tag          '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('       Source       '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    child: const Text('          Save         '),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Belief()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 241, 43, 181),
                        onPrimary: Colors.black,
                        side: BorderSide(width: 3, color: Colors.pink),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(20)),
                  ),
                  SizedBox(
                    height: 50,
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
