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
          'example': (context) => _AnimatedLiquidLinearProgressIndicator(),
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
          "Evolve:Breathing Trainer",
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
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.black,
                size: 40,
              ),
              title: Text("History",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              onTap: () {
                Navigator.pop(context, 'intro'); // close the drawer
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
            //             int _currentValuein = 4;
            // int _currentValuehold1 = 0;
            // int _currentValueout = 4;
            // int _currentValuehold2 = 0;
            FlatButton(
              height: 50,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            _AnimatedLiquidLinearProgressIndicator(
                                inbreathe: _currentValuein,
                                hold1: _currentValuehold1,
                                out: _currentValueout,
                                hold2: _currentValuehold2)));
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
          ],
        ),
      ),
    );
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  _AnimatedLiquidLinearProgressIndicator(
      {Key key, this.inbreathe, this.hold1, this.out, this.hold2});

  final int inbreathe;
  final int hold1;
  final int out;
  final int hold2;
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
    int total = widget.inbreathe + widget.hold1 + widget.out + widget.hold2;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: total),
    );

    _animationController.addListener(() => setState(() {
          _animationController.value == widget.inbreathe / total
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
    return NewWidget(
        animationController: _animationController, percentage: percentage);
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required AnimationController animationController,
    @required this.percentage,
  })  : _animationController = animationController,
        super(key: key);

  final AnimationController _animationController;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Liquid Linear Progress Indicators"),
        // ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          Center(
            child: Container(
              width: double.infinity,
              height: 900,
              // padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: LiquidLinearProgressIndicator(
                      value: _animationController.value + 0.01,
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
                  ),
                  LiquidLinearProgressIndicator(
                    value: _animationController.value,
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation(Colors.blue[100]),
                    borderRadius: 12.0,
                    direction: Axis.vertical,
                    // center: Text(
                    //   "${percentage.toStringAsFixed(2)}",
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 20.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    //),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
