import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xam/logic/bloc/reqres_bloc.dart';
import 'package:xam/logic/bloc/reqres_event.dart';
import 'package:xam/logic/bloc/reqres_state.dart';

import '../../../../../core/constants/strings.dart';

class AreaDropdownWidget extends StatefulWidget {
  const AreaDropdownWidget({Key? key}) : super(key: key);

  @override
  State<AreaDropdownWidget> createState() => _AreaDropdownWidgetState();
}

class _AreaDropdownWidgetState extends State<AreaDropdownWidget> {
  String? dropdownvalue;

  var items = [
    'Australia',
    'USA',
    'Canada',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReqResBloc, ReqResState>(
      builder: (reqResContext, reqResState) {
        return DropdownButton<String>(
          isExpanded: true,
          value: dropdownvalue,
          hint: const Text(Strings.selectArea),
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
                .add(AreaChanged(area: dropdownvalue!));
          },
        );
      },
    );
  }
}
