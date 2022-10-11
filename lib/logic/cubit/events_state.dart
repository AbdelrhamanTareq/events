part of 'events_cubit.dart';

@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}
class EventsLoading extends EventsState {}
class EventsLoaded extends EventsState {
  final List<Events> data;

  EventsLoaded(this.data);
}
class EventsErorr extends EventsState {
  final String error;

  EventsErorr(this.error);

}
