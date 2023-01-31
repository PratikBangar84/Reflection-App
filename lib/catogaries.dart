import 'package:flutter/material.dart';
import 'package:flutter_application_5/2ndbeliefpage.dart';

class Catogaries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('            Your Categories           '),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => beliefpage()));
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
                    child: const Text('   Science   '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('      Maths      '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('      Sports       '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('       Art        '),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    child: const Text('          More         '),
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
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
