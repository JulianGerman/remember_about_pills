part of 'app_content_controller_bloc.dart';

@immutable
abstract class AppContentControllerState {}

class AppContentBeforeLoggedIn extends AppContentControllerState {}

class AppContentAfterLoggedIn extends AppContentControllerState {}
// class AppContentControllerInitial extends AppContentControllerState {}

// class TickerInitial extends TickerState {
//   const TickerInitial(int duration) : super(duration: duration);

//   String toString() => 'TimerInitial {duration :$duration}';
// }

// class TimerRunInProgress extends TickerState {
//   const TimerRunInProgress(int duration) : super(duration: duration);

//   String toString() => 'TimerRunPause {duration :$duration}';
// }

// class TimerRunPause extends TickerState {
//   const TimerRunPause(int duration) : super(duration: duration);

//   String toString() => 'TimerRunPause {duration :$duration}';
// }

// class TimerRunCompleted extends TickerState {
//   const TimerRunCompleted() : super();
// }
