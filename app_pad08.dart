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
    return const MaterialApp(
      title: "AppPad",
      debugShowCheckedModeBanner: false,
      home: Home(cor: 0xFF000000),
    );
  }
}

//home
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_pad/sliders.dart';
import 'package:app_pad/button.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
//flutter pub add flutter_slider_drawer

class Home extends StatelessWidget {
  const Home({Key? key, required this.cor, }) : super(key: key);
  final int cor;
  final String title = "AppPad";

  String percentageModifier(double value) {
    return '';
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]
    );

    void alerta(){
      showDialog(
          context: context,
          builder: (content){
            return const AlertDialog(
              title: Text(textAlign: TextAlign.center,"Sobre o APP"),
              content: Text(textAlign: TextAlign.center, "Criado por Pedro Santos\nCopyright 2023"),
            );
          });
    }

    void predef(){
      showDialog(
          context: context,
          builder: (content){
            return AlertDialog(
              title: Text(textAlign: TextAlign.center, "Predefinições"),
              content: Container(
                child: Column(
                  children: [
                    PredefButton(),
                    PredefButton(),
                    PredefButton(),
                    PredefButton(),
                  ],
                )
              ),
            );
        }
      );
    }

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: FractionallySizedBox(
          child: SliderDrawer(
              slideDirection: SlideDirection.RIGHT_TO_LEFT,
              appBar: SliderAppBar(
                  drawerIconSize: height * 0.07,
                  appBarPadding: EdgeInsets.only(right: width * 0.06, top: height * 0),
                  isTitleCenter: false,
                  appBarColor: Colors.grey.shade200,
                  appBarHeight: height * 0.14,
                  title: Text(title,
                      textScaleFactor: height * 0.004,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700
                      )
                  )
              ),
              slider: Container(
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SliderHigh(),
                          SliderMid(),
                          SliderLow(),
                        ],
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                  onPressed: predef,
                                    child: Text(
                                      style: TextStyle(
                                       color: Colors.black
                                      ),
                                      "Predefinições"
                                    ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: alerta,
                                  child: Text(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: height * 0.032
                                      ),
                                      "Sobre o App")),
                              const Icon(
                                  Icons.info_outlined),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              child: Container(
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
              )
          ),
        )
    );
  }
}

//sliders
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
//flutter pub add sleek_circular_slider
import 'package:shared_preferences/shared_preferences.dart';
//flutter pub add shared_preferences

class SliderHigh extends StatefulWidget {
  const SliderHigh({Key? key}) : super(key: key);

  @override
  State<SliderHigh> createState() => _SliderHighState();
}

class _SliderHighState extends State<SliderHigh> {
  String percentageModifier(double value) {
    return 'HIGH';
  }

  double _counter1 = 0;

  _contagem(conta1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('counter1', conta1);
    setState(() {
      _counter1 = (prefs.getDouble('counter1') ?? 50);
    });
  }

  @override
  void initState() {
    _pegaContador();
    super.initState();
  }

  _pegaContador() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getDouble('counter1') ?? 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
          size: height * 0.22,
          customColors: CustomSliderColors(
              trackColor: Colors.black,
              hideShadow: true,
              progressBarColor: Colors.grey[400],
              dotColor: Colors.grey[600]
          ),
          customWidths: CustomSliderWidths(
            progressBarWidth: width * 0.01,
            handlerSize: width * 0.01,
          ),
          infoProperties: InfoProperties(
              modifier: percentageModifier
          )
      ),
      onChangeEnd: (double value) {_contagem(value);},
      initialValue: _counter1,
    );
  }
}

class SliderMid extends StatefulWidget {
  const SliderMid({Key? key}) : super(key: key);

  @override
  State<SliderMid> createState() => _SliderMidState();
}

class _SliderMidState extends State<SliderMid> {
  String percentageModifier(double value) {
    return 'MID';
  }

  double _counter2 = 0;

  _contagem(conta2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('counter2', conta2);
    setState(() {
      _counter2 = (prefs.getDouble('counter2') ?? 50);
    });
  }

  @override
  void initState() {
    _pegaContador1();
    super.initState();
  }

  _pegaContador1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter2 = (prefs.getDouble('counter2') ?? 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
          size: height * 0.22,
          customColors: CustomSliderColors(
              trackColor: Colors.black,
              hideShadow: true,
              progressBarColor: Colors.grey[400],
              dotColor: Colors.grey[600]
          ),
          customWidths: CustomSliderWidths(
            progressBarWidth: width * 0.01,
            handlerSize: width * 0.01,
          ),
          infoProperties: InfoProperties(
              modifier: percentageModifier
          )
      ),
      onChange: (double value) {_contagem(value);},
      initialValue: _counter2,
    );
  }
}

class SliderLow extends StatefulWidget {
  const SliderLow({Key? key}) : super(key: key);

  @override
  State<SliderLow> createState() => _SliderLowState();
}

class _SliderLowState extends State<SliderLow> {
  String percentageModifier(double value) {
    return 'LOW';
  }

  double _counter3 = 0;

  _contagem(conta3) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('counter3', conta3);
    setState(() {
      _counter3 = (prefs.getDouble('counter3') ?? 50);
    });
  }

  @override
  void initState() {
    _pegaContador();
    super.initState();
  }

  _pegaContador() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter3 = (prefs.getDouble('counter3') ?? 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
          size: height * 0.22,
          customColors: CustomSliderColors(
              trackColor: Colors.black,
              hideShadow: true,
              progressBarColor: Colors.grey[400],
              dotColor: Colors.grey[600]
          ),
          customWidths: CustomSliderWidths(
            progressBarWidth: width * 0.01,
            handlerSize: width * 0.01,
          ),
          infoProperties: InfoProperties(
              modifier: percentageModifier
          )
      ),
      onChange: (double value) {_contagem(value);},
      initialValue: _counter3,
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
  final assetsAudioPlayer = AssetsAudioPlayer();

  _selected(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('valor', value);
    setState(() {
      _valor = (prefs.getInt('valor') ?? 0);
    });
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
    var width = MediaQuery.of(context).size.width * 0.21;
    var height = MediaQuery.of(context).size.height * 0.173;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (_valor == 0){
              color = 0xFF757575;

              assetsAudioPlayer.open(
                  Audio(widget.path),
                  loopMode: LoopMode.single,
                  volume: 0.001
              );
              Timer(const Duration(milliseconds: 150), () {
                assetsAudioPlayer.setVolume(0.001);
                Timer(const Duration(milliseconds: 150), () {
                  assetsAudioPlayer.setVolume(0.005);
                  Timer(const Duration(milliseconds: 150), () {
                    assetsAudioPlayer.setVolume(0.008);
                    Timer(const Duration(milliseconds: 150), () {
                      assetsAudioPlayer.setVolume(0.01);
                      Timer(const Duration(milliseconds: 150), () {
                        assetsAudioPlayer.setVolume(0.03);
                        Timer(const Duration(milliseconds: 150), () {
                          assetsAudioPlayer.setVolume(0.05);
                          Timer(const Duration(milliseconds: 150), () {
                            assetsAudioPlayer.setVolume(0.09);
                            Timer(const Duration(milliseconds: 150), () {
                              assetsAudioPlayer.setVolume(0.1);
                              Timer(const Duration(milliseconds: 150), () {
                                assetsAudioPlayer.setVolume(0.2);
                                Timer(const Duration(milliseconds: 150), () {
                                  assetsAudioPlayer.setVolume(0.3);
                                  Timer(const Duration(milliseconds: 150), () {
                                    assetsAudioPlayer.setVolume(0.4);
                                    Timer(const Duration(milliseconds: 150), () {
                                      assetsAudioPlayer.setVolume(0.5);
                                      Timer(const Duration(milliseconds: 150), () {
                                        assetsAudioPlayer.setVolume(0.6);
                                        Timer(const Duration(milliseconds: 150), () {
                                          assetsAudioPlayer.setVolume(0.7);
                                          Timer(const Duration(milliseconds: 150), () {
                                            assetsAudioPlayer.setVolume(0.8);
                                            Timer(const Duration(milliseconds: 150), () {
                                              assetsAudioPlayer.setVolume(0.93);
                                              Timer(const Duration(milliseconds: 150), () {
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
                      });
                    });
                  });
                });
              });
              _selected(1);
            } else {
              color = 0xFFEDEDED;
              Timer(const Duration(milliseconds: 250), () {
                assetsAudioPlayer.setVolume(0.93);
                Timer(const Duration(milliseconds: 250), () {
                  assetsAudioPlayer.setVolume(0.8);
                  Timer(const Duration(milliseconds: 250), () {
                    assetsAudioPlayer.setVolume(0.7);
                    Timer(const Duration(milliseconds: 250), () {
                      assetsAudioPlayer.setVolume(0.6);
                      Timer(const Duration(milliseconds: 250), () {
                        assetsAudioPlayer.setVolume(0.5);
                        Timer(const Duration(milliseconds: 250), () {
                          assetsAudioPlayer.setVolume(0.4);
                          Timer(const Duration(milliseconds: 250), () {
                            assetsAudioPlayer.setVolume(0.3);
                            Timer(const Duration(milliseconds: 250), () {
                              assetsAudioPlayer.setVolume(0.2);
                              Timer(const Duration(milliseconds: 250), () {
                                assetsAudioPlayer.setVolume(0.1);
                                Timer(const Duration(milliseconds: 250), () {
                                  assetsAudioPlayer.setVolume(0.09);
                                  Timer(const Duration(milliseconds: 250), () {
                                    assetsAudioPlayer.setVolume(0.05);
                                    Timer(const Duration(milliseconds: 250), () {
                                      assetsAudioPlayer.setVolume(0.03);
                                      Timer(const Duration(milliseconds: 250), () {
                                        assetsAudioPlayer.setVolume(0.01);
                                        Timer(const Duration(milliseconds: 250), () {
                                          assetsAudioPlayer.setVolume(0.008);
                                          Timer(const Duration(milliseconds: 250), () {
                                            assetsAudioPlayer.setVolume(0.004);
                                            Timer(const Duration(milliseconds: 250), () {
                                              assetsAudioPlayer.setVolume(0.001);
                                              Timer(const Duration(milliseconds: 250), () {
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
                      });
                    });
                  });
                });
              });
              _selected(0);
            }
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

class PredefButton extends StatefulWidget {
  const PredefButton({Key? key, required this.texto}) : super(key: key);
  final String texto;

  @override
  State<PredefButton> createState() => _PredefButtonState();
}

class _PredefButtonState extends State<PredefButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: () {},
          child: Text(
              widget.texto,
          )
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
