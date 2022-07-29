// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theta_bloc.dart';

class ThetaState extends Equatable {
  final String message;
  final String fileUrl;
  final String cameraState;
  final String id;
  final bool finishedSaving;
  final XFile? images;

  ThetaState(
      {required this.message,
      this.fileUrl = "",
      this.cameraState = "initial",
      this.id = "",
      this.finishedSaving = false,
      this.images
      //instantiate File here
      });

  factory ThetaState.initial() => ThetaState(message: "Response from Camera");

  @override
  List<dynamic> get props => [
        images,
        message,
        id,
        cameraState,
        finishedSaving,
      ];

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
