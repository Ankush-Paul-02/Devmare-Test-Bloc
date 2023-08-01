import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:devmate/src/model/models.dart';

import '../../services/repository/database_repository.dart';
import '../../services/storage/storage_repository.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnboardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final DatabaseRepository _databaseRepository;
  final StorageRepository _storageRepository;

  OnboardingBloc({
    required DatabaseRepository databaseRepository,
    required StorageRepository storageRepository,
  })  : _databaseRepository = databaseRepository,
        _storageRepository = storageRepository,
        super(OnboardingLoading()) {
    on<StartOnboarding>(_onStartOnboarding);
    on<UpdateUser>(_onUpdateUser);
    on<UpdateUserImages>(_onUpdateUserImages);
  }

  void _onStartOnboarding(
      StartOnboarding event,
      Emitter<OnBoardingState> emit,
      ) async {
    User user = const User(
      id: '',
      name: '',
      age: 0,
      gender: '',
      imageUrls: [],
      jobTitle: '',
      interests: [],
      bio: '',
      location: '',
    );
    String documentId = await _databaseRepository.createUser(user);
    emit(OnboardingLoaded(user: user.copyWith(id: documentId)));
  }

  void _onUpdateUser(
      UpdateUser event,
      Emitter<OnBoardingState> emit,
      ) {
    if (state is OnboardingLoaded) {
      _databaseRepository.updateUser(event.user);
      emit(OnboardingLoaded(user: event.user));
    }
  }

  void _onUpdateUserImages(
      UpdateUserImages event,
      Emitter<OnBoardingState> emit,
      ) async {
    if (state is OnboardingLoaded) {
      User user = (state as OnboardingLoaded).user;
      await _storageRepository.uploadImage(user, event.image);

      _databaseRepository.getUser(user.id!).listen((user) {
        add(UpdateUser(user: user));
      });
    }
  }
}
