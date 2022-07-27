// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theta_bloc.dart';

class ThetaState extends Equatable {
  final String message;
  final String fileUrl;
  final String cameraState;
  final String id;
  final bool finishedSaving;
  final bool inProgress;

  ThetaState(
      {required this.message,
      this.id = "",
      this.fileUrl = "",
      this.cameraState = "initial",
      this.finishedSaving = false,
      this.inProgress = false});

  factory ThetaState.initial() => ThetaState(message: "Response from Camera");

  @override
  List<Object> get props =>
      [message, id, cameraState, finishedSaving, inProgress];

  @override
  bool get stringify => true;

  ThetaState copyWith({
    String? message,
  }) {
    return ThetaState(
      message: message ?? this.message,
    );
  }
}
