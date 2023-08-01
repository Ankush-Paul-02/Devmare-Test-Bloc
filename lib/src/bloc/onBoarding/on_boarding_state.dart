part of 'on_boarding_bloc.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnboardingLoading extends OnBoardingState {}

class OnboardingLoaded extends OnBoardingState {
  final User user;

  OnboardingLoaded({required this.user});

  @override
  List<Object> get props => [user];
}