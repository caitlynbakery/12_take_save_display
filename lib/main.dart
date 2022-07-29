import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:take_save_display_12/blocs/theta/theta_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThetaBloc(),
      child: MaterialApp(
        home: BlocBuilder<ThetaBloc, ThetaState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black54,
                  title: Text("Image App"),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<ThetaBloc>().add(PictureEvent());
                          },
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.amber,
                          ),
                          iconSize: 80,
                        ),
                      ],
                    ),
                    // state.inProgress && state.fileUrl.isEmpty
                    //     ? Column(
                    //         children: [
                    //           CircularProgressIndicator(),
                    //           Text('Processing Photo')
                    //         ],
                    //       )
                    //     : state.inProgress && state.fileUrl.isNotEmpty
                    //         ? Column(
                    //             children: [
                    //               CircularProgressIndicator(),
                    //               Text('Saving to Gallery')
                    //             ],
                    //           )
                    //         : state.cameraState == 'done' &&
                    //                 state.fileUrl.isNotEmpty &&
                    //                 state.finishedSaving == true
                    //             ? Container(
                    //                 child: Text('Image'),
                    //               )
                    //             : Container(),
                    state.cameraState == 'done' &&
                            state.fileUrl.isNotEmpty &&
                            state.finishedSaving == true
                        ? Container(
                            child: Text('Image Here'),
                          )
                        : state.cameraState == 'initial'
                            ? Container()
                            : state.fileUrl.isNotEmpty
                                ? Column(
                                    children: [
                                      CircularProgressIndicator(),
                                      Text('Saving to Gallery')
                                    ],
                                  )
                                : Column(
                                    children: [
                                      CircularProgressIndicator(),
                                      Text('Processing Photo')
                                    ],
                                  ),
                    IconButton(
                        onPressed: () async {
                          final image = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image == null) return;
                          context
                              .read<ThetaBloc>()
                              .add(ImagePickerEvent(image));
                        },
                        icon: Icon(Icons.image))
                  ],
                ));
          },
        ),
      ),
    );
  }
}
