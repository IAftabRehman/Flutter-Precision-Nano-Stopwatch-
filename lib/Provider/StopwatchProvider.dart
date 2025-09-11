import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class StopwatchProvider extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  Ticker? _ticker;

  Duration _elapsed = Duration.zero;
  Duration get elapsed => _elapsed;

  bool get timerOn => _stopwatch.isRunning;

  void start() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();

      // Keep ticker alive
      _ticker ??= Ticker(_onTick)..start();

      notifyListeners(); // 🔹 Update UI immediately
    }
  }

  void stop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      notifyListeners(); // 🔹 Update UI immediately
    }
  }

  void reset() {
    _stopwatch.reset();
    _elapsed = Duration.zero;
    notifyListeners();
  }

  void _onTick(Duration _) {
    if (_stopwatch.isRunning) {
      _elapsed = _stopwatch.elapsed;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }
}
