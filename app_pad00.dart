import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  String title = "AppPad";

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: FractionallySizedBox(
              child: SliderDrawer(
                sliderOpenSize: 500,
                  slideDirection: SlideDirection.RIGHT_TO_LEFT,
                  key: _key,
                  appBar: SliderAppBar(
                      appBarPadding: const EdgeInsets.only(right: 35),
                      isTitleCenter: false,
                      appBarColor: Colors.grey.shade200,
                      title: Text(title,
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                          )
                      )
                  ),
                  slider: Container(
                      color: Colors.grey.shade200

                  ),
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            _ElevatedButton(
                                texto: "C"),
                            _ElevatedButton(
                                texto: "C#"),
                            _ElevatedButton(
                                texto: "D"),
                            _ElevatedButton(
                                texto: "D#"),
                          ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              _ElevatedButton(
                                  texto: "E"),
                              _ElevatedButton(
                                  texto: "F"),
                              _ElevatedButton(
                                  texto: "F#"),
                              _ElevatedButton(
                                  texto: "G"),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              _ElevatedButton(
                                  texto: "G#"),
                              _ElevatedButton(
                                  texto: "A"),
                              _ElevatedButton(
                                  texto: "A#"),
                              _ElevatedButton(
                                  texto: "B"),
                            ]),
                      ]
                    )
                  )
              ),
            )
        )
      ),
    );
  }
}

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({Key? key, required this.texto}) : super(key: key);
  final String texto;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.21;
    var height = MediaQuery.of(context).size.height * 0.173;
    return Container(
      color: Colors.black,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: (){},
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xEEEEEEFF))
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
