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
      home: Home(
          r: 0xFF000000
      ),
    );
  }
}

//home
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
      home: Home(
          r: 0xFF000000
      ),
    );
  }
}

//sliders
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
//flutter pub add sleek_circular_slider
import 'package:shared_preferences/shared_preferences.dart';
//flutter pub add shared_preferences

class sliderhigh extends StatefulWidget {
  const sliderhigh({Key? key}) : super(key: key);

  @override
  State<sliderhigh> createState() => _sliderhighState();
}

class _sliderhighState extends State<sliderhigh> {
  String percentageModifier(double value) {
    return 'HIGH';
  }

  double _counter1 = 0;

  _contagem(_conta1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('counter1', _conta1);
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (_prefs.getDouble('counter1') ?? 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
          size: height * 0.25,
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
      initialValue: _counter1,
    );
  }
}

class slidermid extends StatefulWidget {
  const slidermid({Key? key}) : super(key: key);

  @override
  State<slidermid> createState() => _slidermidState();
}

class _slidermidState extends State<slidermid> {
  String percentageModifier(double value) {
    return 'MID';
  }

  double _counter2 = 0;

  _contagem(_conta2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('counter2', _conta2);
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter2 = (_prefs.getDouble('counter2') ?? 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
          size: height * 0.25,
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

class sliderlow extends StatefulWidget {
  const sliderlow({Key? key}) : super(key: key);

  @override
  State<sliderlow> createState() => _sliderlowState();
}

class _sliderlowState extends State<sliderlow> {
  String percentageModifier(double value) {
    return 'LOW';
  }

  double _counter3 = 0;

  _contagem(_conta3) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('counter3', _conta3);
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
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter3 = (_prefs.getDouble('counter3') ?? 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
          size: height * 0.25,
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
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
//flutter pub add assets_audio_player

class button extends StatefulWidget {
  const button({Key? key, required this.texto, required this.path}) : super(key: key);
  final String texto;
  final String path;

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  int color = 0xFFEDEDED;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.21;
    var height = MediaQuery.of(context).size.height * 0.173;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          assetsAudioPlayer.open(
            Audio(widget.path),
          );
          color = 0xFF3A3A3A;
        },
        onLongPress: () {
          assetsAudioPlayer.stop();
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

void playSound(String path){
  final assetsAudioPlayer = AssetsAudioPlayer();
  assetsAudioPlayer.open(
    Audio(path),
  );
}

void stopSound(){
  final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.stop();
}
