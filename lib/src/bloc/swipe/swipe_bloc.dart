// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:devmate/src/model/models.dart';
import 'package:equatable/equatable.dart';

part 'swipe_event.dart';

part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsersEvent>(_onLoadUsers);
    on<SwipeLeftEvent>(_onSwipeLeft);
    on<SwipeRightEvent>(_onSwipeRight);
  }

  void _onLoadUsers(
    LoadUsersEvent event,
    Emitter<SwipeState> emit,
  ) {
    emit(SwipeLoaded(users: event.users));
  }

  void _onSwipeLeft(
    SwipeLeftEvent event,
    Emitter<SwipeState> emit,
  ) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      try {
        emit(
          SwipeLoaded(
            users: List.from(state.users)..remove(event.user),
          ),
        );
      } catch (_) {}
    }
  }

  void _onSwipeRight(
      SwipeRightEvent event,
      Emitter<SwipeState> emit,
      ) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      try {
        emit(
          SwipeLoaded(
            users: List.from(state.users)..remove(event.user),
          ),
        );
      } catch (_) {}
    }
  }
}
