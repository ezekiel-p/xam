import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xam/logic/bloc/reqres_event.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../logic/bloc/reqres_bloc.dart';
import '../../../../../logic/bloc/reqres_state.dart';

class TaskCategoryDropdownWidget extends StatefulWidget {
  const TaskCategoryDropdownWidget({Key? key}) : super(key: key);

  @override
  State<TaskCategoryDropdownWidget> createState() =>
      _TaskCategoryDropdownWidgetState();
}

class _TaskCategoryDropdownWidgetState
    extends State<TaskCategoryDropdownWidget> {
  String? dropdownvalue;

  var items = [
    'Category 1',
    'Category 2',
    'Category 3',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReqResBloc, ReqResState>(
      builder: (reqResContext, reqResState) {
        return DropdownButton<String>(
          isExpanded: true,
          value: dropdownvalue,
          hint: const Text(Strings.taskCategory),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              dropdownvalue = newValue.toString();
            });

            reqResContext
                .read<ReqResBloc>()
                .add(TaskCategoryChanged(taskCategory: dropdownvalue!));
          },
        );
      },
    );
  }
}
