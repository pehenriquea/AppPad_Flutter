// main
import 'package:flutter/material.dart';
import 'package:AppPad/home.dart';
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
import 'package:flutter/services.dart';
import 'package:AppPad/sliders.dart';
import 'package:AppPad/button.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
//flutter pub add flutter_slider_drawer

class Home extends StatelessWidget {
  const Home({Key? key, required this.r, }) : super(key: key);
  final int r;
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
                          sliderhigh(),
                          slidermid(),
                          sliderlow(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                              Icons.info_outlined),
                          TextButton(
                              onPressed: alerta,
                              child: const Text(
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                  "Sobre o App"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              child: Container(
                  color: Color(r),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              button(
                                texto: "C",
                              ),
                              button(
                                  texto: "C#"),
                              button(
                                  texto: "D"),
                              button(
                                  texto: "D#"),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              button(
                                  texto: "E"),
                              button(
                                  texto:  "F"),
                              button(
                                  texto: "F#"),
                              button(
                                  texto: "G"),
                            ]),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              button(
                                  texto: "G#"),
                              button(
                                  texto: "A"),
                              button(
                                  texto: "A#"),
                              button(
                                  texto: "B"),
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
import 'package:crypto/crypto.dart';
//flutter pub add crypto
import 'package:shared_preferences/shared_preferences.dart';
//flutter pub add shared_preferences



class sliderhigh extends StatelessWidget {
  const sliderhigh({Key? key}) : super(key: key);

  String percentageModifier(double value) {
    return 'HIGH';
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
      onChange: (double value) {

      },
    );
  }
}

class slidermid extends StatelessWidget {
  const slidermid({Key? key}) : super(key: key);

  String percentageModifier(double value) {
    return 'MID';
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
      onChange: (double value) {
        print(value);
      },
    );
  }
}

class sliderlow extends StatelessWidget {
  const sliderlow({Key? key}) : super(key: key);

  String percentageModifier(double value) {
    return 'LOW';
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
      onChange: (double value) {
        print(value);
      },
    );
  }
}


//button
import 'package:AppPad/home.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({Key? key, required this.texto}) : super(key: key);
  final String texto;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.21;
    var height = MediaQuery.of(context).size.height * 0.173;

    return Container(
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: () {

          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xFFEDEDED))
          ),
          child: Text(texto,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 30
            ),
          ),
        ),
      ),
    );
  }
}
