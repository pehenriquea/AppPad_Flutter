//main
import 'package:flutter/material.dart';
import 'package:app_pad/home.dart';
import 'package:flutter/services.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AppPad",
      debugShowCheckedModeBanner: false,
      home: Home(selectIndex: 0,),
    );
  }
}

//home
import 'package:app_pad/firstScreen.dart';
import 'package:app_pad/minorScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
//flutter pub add assets_audio_player

class Home extends StatefulWidget {
  Home({Key? key, required this.selectIndex}) : super(key: key);
  int selectIndex;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List screens = [
    const firstScreen(),
    const minorScreen()
  ];
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String title = "AppPad";

    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]
    );

    void alerta(){
      showDialog(
          context: context,
          builder: (content){
            return const AlertDialog(
              title: Text(textAlign: TextAlign.center,"Como Usar:"),
              content: Text(textAlign: TextAlign.center,
                      "Toque uma vez para dar play e pause.\n"
                      "Segure para parar de imediato.\n\n\n"
                      "Sobre o App\n"
                      "Criado por Pedro Santos\n"
                      "Copyright 2023"),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.011),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(width * 0.01),
                    child: ElevatedButton(
                      onPressed: (){
                        setState((){
                          if (widget.selectIndex == 0){
                            widget.selectIndex = 1;
                            assetsAudioPlayer.stop();
                          } else {
                            widget.selectIndex = 0;
                            assetsAudioPlayer.stop();
                          }
                        });
                      },
                      child: Text("Menores/Maiores"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF000000)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => alerta(),
                    child: Icon(Icons.info_outlined, color: Colors.black,),
                  )
                ],
              ),
            )
          ],
          title: Text(title, style: (TextStyle(color: Colors.black, fontSize: height * 0.06, fontWeight: FontWeight.w700))),
          backgroundColor: Colors.grey.shade200,
          toolbarHeight: height * 0.15,
        ),
        backgroundColor: Colors.grey[200],
        body: screens[widget.selectIndex]
    );
  }
}

//firstScreen
import 'package:flutter/material.dart';
import 'package:app_pad/button.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    var cor = 0xFF000000;

    return Scaffold(
      body: Container(
          color: Color(cor),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Button(
                        texto: "C",
                        path: "assets/audios/C.mp3",
                      ),
                      Button(
                        texto: "C#",
                        path: "assets/audios/CSharp.mp3",
                      ),
                      Button(
                        texto: "D",
                        path: "assets/audios/D.mp3",
                      ),
                      Button(
                        texto: "D#",
                        path: "assets/audios/DSharp.mp3",
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Button(
                        texto: "E",
                        path: "assets/audios/E.mp3",
                      ),
                      Button(
                        texto:  "F",
                        path: "assets/audios/F.mp3",
                      ),
                      Button(
                        texto: "F#",
                        path: "assets/audios/FSharp.mp3",
                      ),
                      Button(
                        texto: "G",
                        path: "assets/audios/G.mp3",
                      ),
                    ]),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Button(
                        texto: "G#",
                        path: "assets/audios/GSharp.mp3",
                      ),
                      Button(
                        texto: "A",
                        path: "assets/audios/A.mp3",
                      ),
                      Button(
                        texto: "A#",
                        path: "assets/audios/ASharp.mp3",
                      ),
                      Button(
                        texto: "B",
                        path: "assets/audios/B.mp3",
                      ),
                    ]),
              ]
          )
      ),
    );
  }
}

//minorScreen
import 'package:flutter/material.dart';
import 'package:app_pad/button.dart';

class minorScreen extends StatefulWidget {
  const minorScreen({Key? key}) : super(key: key);

  @override
  State<minorScreen> createState() => _minorScreenState();
}

class _minorScreenState extends State<minorScreen> {
  @override
  Widget build(BuildContext context) {
    var cor = 0xFF000000;

    return Scaffold(
        body: Container(
          color: Color(cor),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Button(
                        texto: "Am",
                        path: "assets/audios/C.mp3",
                      ),
                      Button(
                        texto: "A#m",
                        path: "assets/audios/CSharp.mp3",
                      ),
                      Button(
                        texto: "Bm",
                        path: "assets/audios/D.mp3",
                      ),
                      Button(
                        texto: "Cm",
                        path: "assets/audios/DSharp.mp3",
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Button(
                        texto: "C#m",
                        path: "assets/audios/E.mp3",
                      ),
                      Button(
                        texto:  "Dm",
                        path: "assets/audios/F.mp3",
                      ),
                      Button(
                        texto: "D#m",
                        path: "assets/audios/FSharp.mp3",
                      ),
                      Button(
                        texto: "Em",
                        path: "assets/audios/G.mp3",
                      ),
                    ]),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Button(
                        texto: "Fm",
                        path: "assets/audios/GSharp.mp3",
                      ),
                      Button(
                        texto: "F#m",
                        path: "assets/audios/A.mp3",
                      ),
                      Button(
                        texto: "Gm",
                        path: "assets/audios/ASharp.mp3",
                      ),
                      Button(
                        texto: "G#m",
                        path: "assets/audios/B.mp3",
                      ),
                    ]),
              ]
          )
      ),
    );
  }
}

//button
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
//flutter pub add assets_audio_player
import 'package:shared_preferences/shared_preferences.dart';
//flutter pub add shared_preferences

class Button extends StatefulWidget {
  const Button({Key? key, required this.texto, required this.path}) : super(key: key);
  final String texto;
  final String path;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int color = 0xFFEDEDED;
  int _valor = 0;
  double vol = 0.01;
  final assetsAudioPlayer = AssetsAudioPlayer();

  _selected(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('valor', value);
    setState(() {
      _valor = (prefs.getInt('valor') ?? 0);
    });
  }

  _play() async {
    await assetsAudioPlayer.open(
        Audio(widget.path),
        loopMode: LoopMode.single,
        volume: 0.01
    );
  }

  @override
  void initState() {
    _takeValue();
    super.initState();
  }

  _takeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _valor = (prefs.getInt('valor') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.233;
    var height = MediaQuery.of(context).size.height * 0.173;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (_valor == 0){
              color = 0xFF757575;
              _play();
              Future.delayed(const Duration(milliseconds: 170), () {
              assetsAudioPlayer.setVolume(0.03);
                Future.delayed(const Duration(milliseconds: 170), () {
                assetsAudioPlayer.setVolume(0.07);
                  Future.delayed(const Duration(milliseconds: 170), () {
                  assetsAudioPlayer.setVolume(0.13);
                    Future.delayed(const Duration(milliseconds: 170), () {
                    assetsAudioPlayer.setVolume(0.2);
                      Future.delayed(const Duration(milliseconds: 170), () {
                      assetsAudioPlayer.setVolume(0.3);
                        Future.delayed(const Duration(milliseconds: 170), () {
                        assetsAudioPlayer.setVolume(0.4);
                          Future.delayed(const Duration(milliseconds: 170), () {
                          assetsAudioPlayer.setVolume(0.5);
                            Future.delayed(const Duration(milliseconds: 170), () {
                            assetsAudioPlayer.setVolume(0.6);
                              Future.delayed(const Duration(milliseconds: 170), () {
                              assetsAudioPlayer.setVolume(0.7);
                                Future.delayed(const Duration(milliseconds: 170), () {
                                assetsAudioPlayer.setVolume(0.8);
                                  Future.delayed(const Duration(milliseconds: 170), () {
                                  assetsAudioPlayer.setVolume(0.9);
                                    Future.delayed(const Duration(milliseconds: 170), () {
                                    assetsAudioPlayer.setVolume(1);
                                    });
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                  });
                });
              });
              _selected(1);
            } else {
              color = 0xFFEDEDED;
              Future.delayed(const Duration(milliseconds: 170), () {
              assetsAudioPlayer.setVolume(0.89);
                Future.delayed(const Duration(milliseconds: 170), () {
                assetsAudioPlayer.setVolume(0.81);
                  Future.delayed(const Duration(milliseconds: 170), () {
                  assetsAudioPlayer.setVolume(0.7);
                    Future.delayed(const Duration(milliseconds: 170), () {
                    assetsAudioPlayer.setVolume(0.6);
                      Future.delayed(const Duration(milliseconds: 170), () {
                      assetsAudioPlayer.setVolume(0.5);
                        Future.delayed(const Duration(milliseconds: 170), () {
                        assetsAudioPlayer.setVolume(0.4);
                          Future.delayed(const Duration(milliseconds: 170), () {
                          assetsAudioPlayer.setVolume(0.3);
                            Future.delayed(const Duration(milliseconds: 170), () {
                            assetsAudioPlayer.setVolume(0.2);
                              Future.delayed(const Duration(milliseconds: 170), () {
                              assetsAudioPlayer.setVolume(0.1);
                                Future.delayed(const Duration(milliseconds: 170), () {
                                assetsAudioPlayer.setVolume(0.04);
                                  Future.delayed(const Duration(milliseconds: 170), () {
                                  assetsAudioPlayer.setVolume(0.01);
                                    Future.delayed(const Duration(milliseconds: 170), () {
                                    assetsAudioPlayer.setVolume(0);
                                    assetsAudioPlayer.stop();
                                    });
                                  });
                                });
                              });
                            });
                          });
                        });
                      });
                    });
                  });
                });
              });
              _selected(0);
            }
          });
        },
        onLongPress: (){
          setState(() {
            color = 0xFFEDEDED;
            assetsAudioPlayer.stop();
            _selected(0);
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(color)
        ),
        child: Text(widget.texto,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 30
          ),
        ),
      ),
    );
  }
}

//assets
  assets:
    - assets/audios/A.mp3
    - assets/audios/ASharp.mp3
    - assets/audios/B.mp3
    - assets/audios/C.mp3
    - assets/audios/CSharp.mp3
    - assets/audios/D.mp3
    - assets/audios/DSharp.mp3
    - assets/audios/E.mp3
    - assets/audios/F.mp3
    - assets/audios/FSharp.mp3
    - assets/audios/G.mp3
    - assets/audios/GSharp.mp3
