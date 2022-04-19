import 'package:flutter/material.dart';

import 'home_bloc.dart';
import 'home_event.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = HomeBloc();

  void _decrementCounter() {
    _bloc.chanelSinkEvent.add(DecreaseEvent());
  }

  void _incrementCounter() {
    _bloc.chanelSinkEvent.add(IncreaseEvent());
  }

  void _incrementVolumnCounter() {
    _bloc.volumnSinkEvent.add(IncreaseVolumnEvent());
  }

  void _decrementVolumnCounter() {
    _bloc.volumnSinkEvent.add(DecreaseVolumnEvent());
  }

  void _muteVolumnCounter() {
    _bloc.volumnSinkEvent.add(MuteVolumnEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _bloc.chanel,
              initialData: 0,
              builder: (context, snapShot) {
                return Text(
                  'Kênh hiện tại: ${snapShot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            StreamBuilder(
              stream: _bloc.volumn,
              initialData: 0,
              builder: (context, snapShot) {
                return Text(
                  'Âm lượng hiện tại: ${snapShot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Text(
                  '-1',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Text(
                  '+1',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _incrementVolumnCounter,
                tooltip: 'IncrementVolumn',
                child: const Icon(Icons.volume_up_rounded),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: _decrementVolumnCounter,
                tooltip: 'DecrementVolumn',
                child: const Icon(Icons.volume_down),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: _muteVolumnCounter,
                tooltip: 'Mute',
                child: const Icon(Icons.volume_mute),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
