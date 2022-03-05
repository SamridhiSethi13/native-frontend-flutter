// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
      routes: {
        'loading': (_) => LoadingListPage(),
      },
      /*theme: ThemeData(
        primarySwatch: Colors.green,
      ),*/
      home: LoadingListPage(),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  @override
  _LoadingListPageState createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 64, 129, 1),
        //backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'Loading List',
            style: GoogleFonts.nunito(
              color: const Color.fromARGB(255, 213, 248, 214),
              fontSize:40.0,
              fontWeight: FontWeight.bold,
              shadows: [
                const Shadow(
                  color: Color.fromARGB(0, 0, 0, 0),
                  blurRadius: 1.5,
                )
              ]
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        color: Colors.pink[100],
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 213, 248, 214),
                highlightColor: const Color.fromARGB(255, 255, 133, 174),
                enabled: _enabled,
                child: ListView.builder(
                  itemBuilder: (_, __) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          color: const Color.fromARGB(255, 213, 248, 214),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: const Color.fromARGB(255, 213, 248, 214),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                              ),
                              Container(
                                width: double.infinity,
                                height: 8.0,
                                color: const Color.fromARGB(255, 213, 248, 214),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                              ),
                              Container(
                                width: 40.0,
                                height: 8.0,
                                color: const Color.fromARGB(255, 213, 248, 214),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 6,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 213, 248, 214),),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                  alignment: Alignment.center,
                  elevation: MaterialStateProperty.all(7.0),
                  shadowColor: MaterialStateProperty.all(Colors.green),
                  overlayColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _enabled = !_enabled;
                  });
                },
                icon: Icon(
                  _enabled ? Icons.stop :Icons.play_arrow,
                  color:  _enabled ? const Color.fromARGB(255, 241, 15, 91) : Colors.green[700],
                  size: _enabled ? 30.0 : 30.0,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    _enabled ? 'Stop' : 'Play',
                    style: GoogleFonts.nunito(
                      color:  _enabled ? const Color.fromARGB(255, 241, 15, 91) : Colors.green[700],
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
