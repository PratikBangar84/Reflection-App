import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

void main() {
  runApp(MyOg());
}

class MyOg extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fonts = [
    'OpenSans',
    'Billabong',
    'GrandHotel',
    'Oswald',
    'Quicksand',
    'BeautifulPeople',
    'BeautyMountains',
    'BiteChocolate',
    'BlackberryJam',
    'BunchBlossoms',
    'CinderelaRegular',
    'Countryside',
    'Halimun',
    'LemonJelly',
    'QuiteMagicalRegular',
    'Tomatoes',
    'TropicalAsianDemoRegular',
    'VeganStyle',
  ];
  TextStyle _textStyle = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontFamily: 'Billabong',
  );
  String _text = 'Text';

  TextAlign _textAlign = TextAlign.center;

  void _tapHandler(text, textStyle, textAlign) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(
        milliseconds: 400,
      ), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Container(
          color: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              // top: false,
              child: Container(
                child: TextEditor(
                  fonts: fonts,
                  text: text,
                  textStyle: textStyle,
                  textAlingment: textAlign,
                  minFontSize: 10,
                  paletteColors: [
                    Colors.black,
                    Colors.white,
                    Colors.blue,
                    Colors.red,
                    Colors.green,
                    Colors.yellow,
                    Colors.pink,
                    Colors.cyanAccent,
                  ],
                  decoration: EditorDecoration(
                    textBackground: TextBackgroundDecoration(
                      disable: Text('Disable'),
                      enable: Text('Enable'),
                    ),
                    doneButton: Icon(Icons.close, color: Colors.white),
                    fontFamily: Icon(Icons.title, color: Colors.white),
                    colorPalette: Icon(Icons.palette, color: Colors.white),
                    alignment: AlignmentDecoration(
                      left: Text(
                        'left',
                        style: TextStyle(color: Colors.white),
                      ),
                      center: Text(
                        'center',
                        style: TextStyle(color: Colors.white),
                      ),
                      right: Text(
                        'right',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onEditCompleted: (style, align, text) {
                    setState(() {
                      _text = text;
                      _textStyle = style;
                      _textAlign = align;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: Center(
            child: Stack(children: [
          Image.asset('assets/images/screen.jpg'),
          Center(
            child: GestureDetector(
              onTap: () => _tapHandler(_text, _textStyle, _textAlign),
              child: Text(
                _text,
                style: _textStyle,
                textAlign: _textAlign,
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment(0.05, 0.4),
              child: FloatingActionButton.extended(
                backgroundColor: const Color(0xff03dac6),
                foregroundColor: Colors.black,
                onPressed: () {
                  // Respond to button press
                },
                icon: Icon(Icons.add_a_photo),
                label: Text(
                  'Photo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ])),
      ),
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 1
                },
                child: Icon(Icons.photo),
              )), //button first

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 2
                },
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.colorize),
              )), // button second

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 3
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(Icons.edit),
              )),

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 3
                },
                backgroundColor: Colors.pinkAccent,
                child: Icon(Icons.add),
              )),

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.green,
                child: Icon(Icons.home),
              )),
          // button third

          // Add more buttons here
        ],
      ),
    );
  }
}
