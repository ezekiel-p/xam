import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xam/logic/bloc/reqres_bloc.dart';
import 'package:xam/logic/bloc/reqres_event.dart';
import 'package:xam/logic/bloc/reqres_state.dart';

import '../../../../core/constants/strings.dart';
import '../../../../data/providers/helper.dart';
import '../../../widgets/attachment_widget.dart';
import '../../../widgets/checkbox_widget.dart';
import '../../../widgets/xam_elevated_primary_button.dart';

class AddToSiteDiaryWidget extends StatefulWidget {
  const AddToSiteDiaryWidget({Key? key}) : super(key: key);

  @override
  State<AddToSiteDiaryWidget> createState() => _AddToSiteDiaryWidgetState();
}

class _AddToSiteDiaryWidgetState extends State<AddToSiteDiaryWidget> {
  List<String> images = [];
  bool isInclude = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReqResBloc, ReqResState>(
      builder: (reqResContext, reqResState) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Strings.addPhotosToSiteDiary,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const Divider(),
                  if (images.isNotEmpty)
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return AttachmentWidget(
                                size: 80.0,
                                url: images[index],
                                onTap: () {
                                  setState(() {
                                    images.removeWhere(
                                        (element) => element == images[index]);
                                  });
                                });
                          }),
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: RRElevatedPrimaryButtonWidget(
                          color: const Color(0xff97d700),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            getMediaPicker(context, (value) {
                              setState(() {
                                images.add(value!.path);
                              });
                            });
                            reqResContext
                                .read<ReqResBloc>()
                                .add(GetAttachments(attachments: images));
                          },
                          text: Strings.addAPhoto,
                        ),
                      ),
                    ],
                  ),
                  CheckBoxWidget(
                    title: Strings.includeInPhotoGallery,
                    value: isInclude,
                    onChange: (newValue) {
                      setState(() {
                        isInclude = newValue!;
                      });

                      reqResContext.read<ReqResBloc>().add(
                          IsIncludeInPhotoGalleryChanged(
                              isInclude: isInclude.toString()));
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
