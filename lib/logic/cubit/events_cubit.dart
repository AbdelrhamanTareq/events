import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/models.dart';
import '../../data/repository/repository_impl.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit(this.repositoryImpl) : super(EventsInitial());

  final RepositoryImpl repositoryImpl;

  getEvents() async {
    final dataOrError = await repositoryImpl.getEvents();
    dataOrError.fold((error) {
      emit(EventsErorr(error.message));
    }, (data) {
      emit(EventsLoaded(data));
    });
  }
}
