import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
    Duration _duration = Duration();
  Timer? _timer;
  bool _isRunning = false;

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        _duration += Duration(milliseconds: 1);
      });
    });
    _isRunning = true;
  }

  void _pauseTimer() {
    _timer?.cancel();
    _isRunning = false;
  }

  void _resetTimer() {
    setState(() {
      _duration = Duration();
    });
    _pauseTimer();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 231, 165),
appBar: AppBar(
        title: Text('Stopwatch App',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
        centerTitle: true,
        backgroundColor:Color.fromARGB(255, 187, 239, 245), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_duration.inSeconds.remainder(60).toString().padLeft(2, '0')}:${(_duration.inMilliseconds.remainder(1000) ~/ 10).toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 48,color:Color.fromARGB(255, 62, 6, 2) ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 248, 168, 168),shadowColor:Color.fromARGB(255, 76, 32, 219)),
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                  child: Text(_isRunning ? 'Pause' : 'Start',style: TextStyle(fontSize: 20,color: Colors.black),),
                ),
                SizedBox(width: 20),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 248, 168, 168),shadowColor: Color.fromARGB(255, 76, 32, 219)),
                  onPressed: _resetTimer,
                  child: Text('Reset',style: TextStyle(fontSize: 20,color: Colors.black),),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}