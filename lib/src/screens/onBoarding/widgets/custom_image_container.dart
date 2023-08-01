import 'package:devmate/src/bloc/onBoarding/on_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imageUrl;

  const CustomImageContainer({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          bottom: BorderSide(color: bgColor1, width: 1),
          top: BorderSide(color: bgColor1, width: 1),
          left: BorderSide(color: bgColor1, width: 1),
          right: BorderSide(color: bgColor1, width: 1),
        ),
      ),
      child: (imageUrl == null)
          ? Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  color: accentColor,
                ).onTap(
                  () async {
                    ImagePicker _picker = ImagePicker();
                    final XFile? _image = await _picker.pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 50,
                    );

                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: 'No images were selected!'.text.make(),
                        ),
                      );
                    }
                    if (_image != null) {
                      VxToast.show(context, msg: 'Uploading...');
                      // StorageRepository().uploadImage(_image);
                      context.read<OnboardingBloc>().add(
                            UpdateUserImages(
                              image: _image,
                            ),
                          );
                    }
                  },
                ),
              ),
            )
          : Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
    ).pOnly(bottom: 10, right: 10);
  }
}
