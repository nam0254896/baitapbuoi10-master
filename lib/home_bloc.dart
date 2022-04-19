import 'dart:async';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc {
  final _homeState = HomeState();

  HomeBloc() {
    _chanelStreamEvent.listen((event) {
      if (event is IncreaseEvent) {
        _homeState.chanel++;
        _chanelStateStreamController.sink.add(_homeState.chanel);
      } else if (event is DecreaseEvent) {
        if (_homeState.chanel <= 0) {
        } else {
          _homeState.chanel--;
          _chanelStateStreamController.sink.add(_homeState.chanel);
        }
      }
    });

    _volumnStreamEvent.listen((event) {
      if (event is IncreaseVolumnEvent) {
        _homeState.volumn = _homeState.volumn + 5;
        _volumnStateStreamController.sink.add(_homeState.volumn);
      } else if (event is DecreaseVolumnEvent) {
        if (_homeState.volumn <= 0) {
        } else if (_homeState.volumn <= 10) {
          _homeState.volumn = 0;
          _volumnStateStreamController.sink.add(_homeState.volumn);
        } else {
          _homeState.volumn = _homeState.volumn - 10;
          _volumnStateStreamController.sink.add(_homeState.volumn);
        }
      } else {
        _homeState.volumn = 0;
        _volumnStateStreamController.sink.add(_homeState.volumn);
      }
    });
  }

  final _chanelEventStreamController = StreamController<ChanelEvent>();
  final _volumnEventStreamController = StreamController<VolumnEvent>();

  Stream<ChanelEvent> get _chanelStreamEvent =>
      _chanelEventStreamController.stream;

  Stream<VolumnEvent> get _volumnStreamEvent =>
      _volumnEventStreamController.stream;

  Sink<ChanelEvent> get chanelSinkEvent => _chanelEventStreamController.sink;
  Sink<VolumnEvent> get volumnSinkEvent => _volumnEventStreamController.sink;

  final _chanelStateStreamController = StreamController<int>();
  final _volumnStateStreamController = StreamController<int>();

  Stream<int> get chanel => _chanelStateStreamController.stream;
  Stream<int> get volumn => _volumnStateStreamController.stream;
}
