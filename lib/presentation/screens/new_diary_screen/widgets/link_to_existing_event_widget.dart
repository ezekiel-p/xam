import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xam/logic/bloc/reqres_bloc.dart';
import 'package:xam/logic/bloc/reqres_state.dart';

import '../../../../core/constants/strings.dart';
import '../../../../logic/bloc/reqres_event.dart';
import '../../../widgets/checkbox_widget.dart';
import 'dropdowns/event_dropdown_widget.dart';

class LinkToExistingEventWidget extends StatefulWidget {
  const LinkToExistingEventWidget({Key? key}) : super(key: key);

  @override
  State<LinkToExistingEventWidget> createState() =>
      _LinkToExistingEventWidgetState();
}

class _LinkToExistingEventWidgetState extends State<LinkToExistingEventWidget> {
  TextEditingController textEditingController = TextEditingController();
  List<String> images = [];
  bool isExisting = false;

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
                  CheckBoxWidget(
                    title: Strings.linkToExistingEvent,
                    value: isExisting,
                    onChange: (newValue) {
                      setState(() {
                        isExisting = newValue!;
                      });
                      reqResContext.read<ReqResBloc>().add(
                          IsLinkToExistingEvent(isLink: isExisting.toString()));
                    },
                  ),
                  const Divider(),
                  const EventDropdownWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
