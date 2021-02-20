import 'package:evolve/intro.dart';
import 'package:evolve/splashscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dart:math' as math;

math.Random rnd = new math.Random();
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'ag',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        routes: {
          'second': (context) => WaveDemoHomePage(),
          'example': (context) => Example(),
          'splashscreen': (context) => SplashScreen(),
          'homepage': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
          'intro': (context) => Home(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentValuein = 4;
  int _currentValuehold1 = 0;
  int _currentValueout = 4;
  int _currentValuehold2 = 0;
  int _sessionlength = 1;
  bool status = false;

  Decoration _decoration = new BoxDecoration(
    border: new Border(
      top: new BorderSide(
        style: BorderStyle.solid,
        color: Colors.black26,
      ),
      bottom: new BorderSide(
        style: BorderStyle.solid,
        color: Colors.black26,
      ),
    ),
    shape: BoxShape.rectangle,
  );
  @override
  Widget build(BuildContext context) {
    Widget horizontallist1 = new Container(
      height: 200,
      width: 100,
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
            width: 50,
            child: Text(
              'In',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
              height: 150,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: new NumberPicker.integer(
                  initialValue: _currentValuein,
                  minValue: 0,
                  maxValue: 10,
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    //decoration: TextDecoration.underline,
                    //decorationColor: Colors.red,
                    //decorationStyle: TextDecorationStyle.wavy,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    // decoration: TextDecoration.underline,
                    // decorationColor: Colors.red,
                    // decorationStyle: TextDecorationStyle.wavy,
                  ),
                  decoration: _decoration,
                  onChanged: (newValue) =>
                      setState(() => _currentValuein = newValue))),
          // new Text(
          //   "IN: $_currentValuein",
          //   textAlign: TextAlign.center,
          //   overflow: TextOverflow.ellipsis,
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          // ),
        ],
      ),
    );
    Widget horizontallist2 = new Container(
      height: 200,
      width: 100,
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
            width: 50,
            child: Text(
              'Hold',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
              height: 150,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: new NumberPicker.integer(
                  initialValue: _currentValuehold1,
                  minValue: 0,
                  maxValue: 10,
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    //decoration: TextDecoration.underline,
                    //decorationColor: Colors.red,
                    //decorationStyle: TextDecorationStyle.wavy,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    // decoration: TextDecoration.underline,
                    // decorationColor: Colors.red,
                    // decorationStyle: TextDecorationStyle.wavy,
                  ),
                  decoration: _decoration,
                  onChanged: (newValue) =>
                      setState(() => _currentValuehold1 = newValue))),
          // new Text(
          //   "HOLD: $_currentValuehold1",
          //   textAlign: TextAlign.center,
          //   overflow: TextOverflow.ellipsis,
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          // ),
        ],
      ),
    );
    Widget horizontallist3 = new Container(
      height: 200,
      padding: EdgeInsets.only(left: 5, right: 5),
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
            width: 50,
            child: Text(
              'Out',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
              height: 150,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: new NumberPicker.integer(
                  initialValue: _currentValueout,
                  minValue: 0,
                  maxValue: 10,
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    //decoration: TextDecoration.underline,
                    //decorationColor: Colors.red,
                    //decorationStyle: TextDecorationStyle.wavy,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    // decoration: TextDecoration.underline,
                    // decorationColor: Colors.red,
                    // decorationStyle: TextDecorationStyle.wavy,
                  ),
                  decoration: _decoration,
                  onChanged: (newValue) =>
                      setState(() => _currentValueout = newValue))),
          // new Text(
          //   "OUT: $_currentValueout",
          //   textAlign: TextAlign.center,
          //   overflow: TextOverflow.ellipsis,
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          // )
        ],
      ),
    );
    Widget horizontallist4 = new Container(
      height: 200,
      width: 100,
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 30,
            width: 50,
            child: Text(
              'Hold',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'ag', fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
              height: 150,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: new NumberPicker.integer(
                  initialValue: _currentValuehold2,
                  minValue: 0,
                  maxValue: 10,
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                    fontFamily: 'ag',
                    //decoration: TextDecoration.underline,
                    //decorationColor: Colors.red,
                    //decorationStyle: TextDecorationStyle.wavy,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    // decoration: TextDecoration.underline,
                    // decorationColor: Colors.red,
                    // decorationStyle: TextDecorationStyle.wavy,
                  ),
                  decoration: _decoration,
                  haptics: true,
                  onChanged: (newValue) =>
                      setState(() => _currentValuehold2 = newValue))),

          // new Text(
          //   "HOLD: $_currentValuehold2",
          //   textAlign: TextAlign.center,
          //   overflow: TextOverflow.ellipsis,
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          // ),
        ],
      ),
    );
    Widget sessionlength = new Container(
      height: 50,
      width: 82,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: new NumberPicker.integer(
                initialValue: _sessionlength,
                minValue: 0,
                maxValue: 10,
                textStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                  //decoration: TextDecoration.underline,
                  //decorationColor: Colors.red,
                  //decorationStyle: TextDecorationStyle.wavy,
                ),
                // decoration: _decoration,
                listViewWidth: 2,
                haptics: true,
                onChanged: (newValue) =>
                    setState(() => _sessionlength = newValue)),
          ),
          Text("min "),
          // new Text(
          //   "HOLD: $_sessionlength",
          //   textAlign: TextAlign.center,
          //   overflow: TextOverflow.ellipsis,
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          // )
        ],
      ),
    );
    return Scaffold(
      appBar: new AppBar(
          title: new Center(
        child: Text(
          "Evolve",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 1000,
              padding: EdgeInsets.only(top: 20.0, left: 5, right: 5),
              child: Text(
                'Evolve is simple app to control breathing and meditate in this world of chaos.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'ag',
                ),
              ),
            ),
            Text(
              'BREATH CYCLE SETTINGS(1-30 SEC)',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'ag',
              ),
            ),

            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10),
                children: <Widget>[
                  horizontallist1,
                  horizontallist2,
                  horizontallist3,
                  horizontallist4,
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Session Length:   ",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                sessionlength,
                Text(
                  "    Show Stats: ",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                FlutterSwitch(
                  width: 50.0,
                  height: 30.0,
                  valueFontSize: 20.0,
                  toggleColor: Colors.blue,
                  toggleSize: 30.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 2.0,
                  showOnOff: false,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                // Text(
                //   'Value : $status',
                //   style: TextStyle(color: Colors.red, fontSize: 10.0),
                // )
              ],
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            // Text(
            //   "Info",
            //   textAlign: TextAlign.center,
            //   overflow: TextOverflow.ellipsis,
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            // ),
            ListTile(
              leading: Icon(
                Icons.book_rounded,
                color: Colors.black,
                size: 40,
              ),
              title: Text('Tutorial',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onTap: () {
                // change app state...
                // Navigator.pop(context); // close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.phone_android_outlined,
                color: Colors.black,
                size: 40,
              ),
              title: Text("Notes",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onTap: () {
                // change app state...
                // Navigator.pop(context); // close the drawer
              },
            ),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            new Text(
              "Total Session Length: $_sessionlength",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            new Text(
              "Total Number of Breath Cycles: $_currentValuehold2",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            FlatButton(
              height: 50,
              onPressed: () {
                Navigator.pushNamed(context, 'second');
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.black, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.hourglass_empty_sharp,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  Text('Start',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
            ),
            FlatButton(
              height: 50,
              onPressed: () {
                Navigator.pushNamed(context, 'example');
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.black, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.hourglass_empty_sharp,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  Text('Wave Example',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.only(left: 10),
            //     children: <Widget>[
            //       horizontallist1,
            //       horizontallist2,
            //       horizontallist3,
            //       horizontallist4,
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: ListView(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     padding: EdgeInsets.only(left: 10),
            //     children: <Widget>[
            //       Text(
            //         "Session Length",
            //         textAlign: TextAlign.center,
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //       ),
            //       sessionlength,
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class WaveDemoHomePage extends StatefulWidget {
  WaveDemoHomePage({Key key1, this.title1}) : super(key: key1);

  final String title1;

  @override
  _WaveDemoHomePageState createState() => _WaveDemoHomePageState();
}

class _WaveDemoHomePageState extends State<WaveDemoHomePage> {
  _buildCard({
    Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage backgroundImage,
    double height = 152.0,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.only(right: 0.0, left: 0.0, bottom: 0.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0))),
        child: WaveWidget(
          config: config,
          backgroundColor: backgroundColor,
          backgroundImage: backgroundImage,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 2,
        ),
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;
  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
        elevation: 10.0,
        backgroundColor: Colors.blueGrey[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(_blur == null ? Icons.blur_off : Icons.blur_on),
            onPressed: () {
              setState(() {
                _blur = _nextBlur();
              });
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 16.0),
            _buildCard(
              backgroundColor: Colors.purpleAccent,
              config: CustomConfig(
                gradients: [
                  [Colors.red, Color(0xEEF44336)],
                  [Colors.red[800], Color(0x77E57373)],
                  [Colors.orange, Color(0x66FF9800)],
                  [Colors.yellow, Color(0x55FFEB3B)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: _blur,
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
            ),
            _buildCard(
              height: 256.0,
              backgroundImage: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
                ),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.softLight),
              ),
              config: CustomConfig(
                colors: [
                  Colors.pink[400],
                  Colors.pink[300],
                  Colors.pink[200],
                  Colors.pink[100]
                ],
                durations: [18000, 8000, 5000, 12000],
                heightPercentages: [0.85, 0.86, 0.88, 0.90],
                blur: _blur,
              ),
            ),
            _buildCard(
                config: CustomConfig(
                  colors: [
                    Colors.white70,
                    Colors.white54,
                    Colors.white30,
                    Colors.white24,
                  ],
                  durations: [32000, 21000, 18000, 5000],
                  heightPercentages: [0.25, 0.26, 0.28, 0.31],
                  blur: _blur,
                ),
                backgroundColor: Colors.blue[600]),
          ],
        ),
      ),
    );
  }

  String get newMethod => widget.title1;
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liquid Progress Indicator Examples"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              child: Text("Linear"),
              color: Colors.grey[300],
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LiquidLinearProgressIndicatorPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LiquidLinearProgressIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liquid Linear Progress Indicators"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _AnimatedLiquidLinearProgressIndicator(),
          // Container(
          //   width: double.infinity,
          //   height: 35,
          //   padding: EdgeInsets.symmetric(horizontal: 24.0),
          //   child: LiquidLinearProgressIndicator(
          //     backgroundColor: Colors.black,
          //     valueColor: AlwaysStoppedAnimation(Colors.red),
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   height: 35,
          //   padding: EdgeInsets.symmetric(horizontal: 24.0),
          //   child: LiquidLinearProgressIndicator(
          //     backgroundColor: Colors.white,
          //     valueColor: AlwaysStoppedAnimation(Colors.pink),
          //     borderColor: Colors.red,
          //     borderWidth: 5.0,
          //     direction: Axis.vertical,
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   height: 35,
          //   padding: EdgeInsets.symmetric(horizontal: 24.0),
          //   child: LiquidLinearProgressIndicator(
          //     backgroundColor: Colors.white,
          //     valueColor: AlwaysStoppedAnimation(Colors.grey),
          //     borderColor: Colors.blue,
          //     borderWidth: 5.0,
          //     center: Text(
          //       "Loading...",
          //       style: TextStyle(
          //         fontSize: 12.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   height: 35,
          //   padding: EdgeInsets.symmetric(horizontal: 24.0),
          //   child: LiquidLinearProgressIndicator(
          //     backgroundColor: Colors.lightGreen,
          //     valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
          //     direction: Axis.vertical,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController.addListener(() => setState(() {
          _animationController.value > 0.8
              ? _animationController.stop()
              : _animationController.repeat();
        }));
    _animationController.repeat();
    bool a = _animationController.isCompleted;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = _animationController.value * 10.0;
    return Center(
      child: Container(
        width: double.infinity,
        height: 500.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            LiquidLinearProgressIndicator(
              value: _animationController.value + 0.1,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.cyan[100]),
              borderRadius: 12.0,
              direction: Axis.vertical,
              center: Text(
                "${percentage.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            LiquidLinearProgressIndicator(
              value: _animationController.value,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.blue[100]),
              borderRadius: 12.0,
              direction: Axis.vertical,
              center: Text(
                "${percentage.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
