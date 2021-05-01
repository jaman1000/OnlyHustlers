import 'dart:async';

Stream<int> stopWatchStream() {
  StreamController<int> streamController;
  Timer timer;
  Duration timerInterval = Duration(minutes: 1);
  int counter = 0;

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
      counter = 0;
      streamController.close();
    }
  }

  void tick(_) {
    counter++;
    streamController.add(counter);
  }

  void startTimer() {
    timer = Timer.periodic(timerInterval, tick);
  }

  streamController = StreamController<int>(
    onListen: startTimer,
    onPause: stopTimer,
  );

  return streamController.stream;
}
