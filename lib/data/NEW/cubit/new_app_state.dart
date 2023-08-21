part of 'new_app_cubit.dart';

sealed class NewAppState {}

final class NewAppInitial extends NewAppState {}

class LoadingState extends NewAppState {}

class ErrorState extends NewAppState {}

class DoneState extends NewAppState {}

class PickImageState extends NewAppState {}

class GetSum extends NewAppState {}

// for login
class LoginLoadingState extends NewAppState {}

class LoginErrorState extends NewAppState {
  final String error;
  LoginErrorState(this.error);
}

class LoginDoneState extends NewAppState {}

// for create acc
class CreateAccLoadingState extends NewAppState {}

class CreateAccErrorState extends NewAppState{
  final String error;
  CreateAccErrorState(this.error);
}

class CreateAccDoneState extends NewAppState {}

// for get user data
class GetDatDoneState extends NewAppState {}

class GetDatLoadingState extends NewAppState {}

class GetDatErrorState extends NewAppState {
  final String error;
  GetDatErrorState(this.error);
}

// for upload image
class UploadDoneState extends NewAppState {}

class UploadLoadingState extends NewAppState {}

class UploadErrorState extends NewAppState {
  final String error;
  UploadErrorState(this.error);
}
