import 'package:flutter/material.dart';
import 'package:banai_delayed_displays/banai_delayed_displays.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              
              const BanaiDelayedDisplays(
                fadeIn: true,
                from: Offset(0, 0.35),
                delay: Duration(milliseconds: 300),
                duration: Duration(milliseconds: 500),
                placelholder: Text(''),
                child: Text('delayed_displays_example'),
              ),

              BanaiDelayedDisplays(
                fadeIn: true,
                from: const Offset(0, 0.35),
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 500),
                placelholder: Container(
                  width: 200,
                  height: 50,
                  color: Colors.transparent,
                ),
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.blue,
                  child: const Text('delayed_displays_example'),
                ),
              ),


              Container(
                height: 100,
              ),

              const BanaiDelayedDisplays(
                fadeIn: true,
                from: Offset(0.35, 0.35),
                delay: Duration(milliseconds: 300),
                duration: Duration(milliseconds: 500),
                placelholder: Text(''),
                child: Text('delayed_displays_example'),
              ),

              BanaiDelayedDisplays(
                fadeIn: true,
                from: const Offset(-0.35, 0.35),
                delay: const Duration(milliseconds: 300),
                duration: const Duration(milliseconds: 500),
                placelholder: Container(
                  width: 200,
                  height: 50,
                  color: Colors.transparent,
                ),
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.blue,
                  child: const Text('delayed_displays_example'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
