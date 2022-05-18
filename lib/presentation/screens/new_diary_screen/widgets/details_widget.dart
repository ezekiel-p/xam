import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xam/logic/bloc/reqres_bloc.dart';
import 'package:xam/logic/bloc/reqres_event.dart';
import 'package:xam/logic/bloc/reqres_state.dart';

import '../../../../core/constants/strings.dart';
import '../../../../data/providers/helper.dart';
import '../../../widgets/utils.dart';
import 'dropdowns/area_dropdown_widget copy.dart';
import 'dropdowns/task_category_dropdown_widget.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({Key? key}) : super(key: key);

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  TextEditingController textEditingController = TextEditingController();
  DateTime dateTime = DateTime.now().add(const Duration(days: 1));
  String selectedDate = formatDate(DateTime.now()).toString();
  List<String> images = [];

  bool initialLoad = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReqResBloc, ReqResState>(
      builder: (reqResContext, reqResState) {
        if (initialLoad) {
          reqResContext.read<ReqResBloc>().add(DateChanged(date: selectedDate));

          initialLoad = false;
        }

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
                    Strings.details,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Utils.showSheet(
                        context,
                        child: buildDatePicker(),
                        onClicked: () {
                          final value = formatDate(dateTime);

                          setState(() {
                            selectedDate = value;
                          });

                          reqResContext
                              .read<ReqResBloc>()
                              .add(DateChanged(date: selectedDate));
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade200))),
                            child: Text(selectedDate.toString()),
                          ),
                        )
                      ],
                    ),
                  ),
                  const AreaDropdownWidget(),
                  const TaskCategoryDropdownWidget(),
                  TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: Strings.tags,
                      labelStyle: TextStyle(color: Color(0xFF424242)),
                    ),
                    onChanged: (value) {
                      reqResContext
                          .read<ReqResBloc>()
                          .add(TagsChanged(tags: value));
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

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          minimumYear: dateTime.year,
          minimumDate: dateTime,
          maximumYear: dateTime.year + 2,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
