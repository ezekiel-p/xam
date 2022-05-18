import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xam/logic/bloc/reqres_bloc.dart';
import 'package:xam/logic/bloc/reqres_event.dart';
import 'package:xam/logic/bloc/reqres_state.dart';

import '../../../../core/constants/strings.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({Key? key}) : super(key: key);

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  TextEditingController textEditingController = TextEditingController();
  List<String> images = [];

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
                    Strings.comments,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const Divider(),
                  TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                        hintText: Strings.comments,
                        labelStyle: TextStyle(color: Color(0xFF424242))),
                    onChanged: (value) {
                      reqResContext
                          .read<ReqResBloc>()
                          .add(CommentsChanged(comments: value));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
