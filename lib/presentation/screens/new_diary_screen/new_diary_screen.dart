import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder/geocoder.dart'; //already depreciated but added just to show the location purposes
import 'package:xam/logic/bloc/reqres_bloc.dart';
import 'package:xam/logic/bloc/reqres_event.dart';
import 'package:xam/logic/bloc/reqres_state.dart';
import 'package:xam/logic/form_submission_status.dart';
import 'package:xam/presentation/screens/result_screen/result_screen.dart';
import 'dart:async';
import 'package:location/location.dart';

import '../../../core/constants/strings.dart';
import '../../widgets/appbar.dart';
import '../../widgets/xam_elevated_primary_button.dart';
import 'widgets/add_to_site_diary_widget.dart';
import 'widgets/comments_widget.dart';
import 'widgets/details_widget.dart';
import 'widgets/link_to_existing_event_widget.dart';

class NewDiaryScreen extends StatefulWidget {
  const NewDiaryScreen({Key? key}) : super(key: key);

  @override
  State<NewDiaryScreen> createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<NewDiaryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LocationData? _currentPosition;
  String? _address, _dateTime;
  Location location = Location();

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    setState(() {
      _getAddress(_currentPosition!.latitude!, _currentPosition!.longitude!)
          .then((value) {
        setState(() {
          _address = value.first.addressLine;
        });
      });
    });
  }

  Future<List<Address>> _getAddress(double lat, double lang) async {
    final coordinates = Coordinates(lat, lang);
    List<Address> add =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReqResBloc, ReqResState>(
      listener: (reqResContext, reqResState) {
        final formStatus = reqResState.formStatus;
        if (formStatus is SubmissionSuccess) {
          reqResContext
              .read<ReqResBloc>()
              .add(FormStatusChanged(formStatus: FormSubmitted()));

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ResultScreen(
                  resReq: reqResState.reqRes!,
                ),
              ));
        }
      },
      child: BlocBuilder<ReqResBloc, ReqResState>(
        builder: (reqResContext, reqResState) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(75),
                child: getAppBar(_scaffoldKey, context,
                    withLeadingIcon: true,
                    elevation: 0.0,
                    backgroundColor: Colors.black,
                    title: Strings.appTitle),
              ),
              body: reqResState.formStatus is FormWaiting
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : ListView(
                      children: [
                        Column(
                          children: [
                            if (_address != null)
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_on_rounded),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "$_address",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            const AddToSiteDiaryWidget(),
                            const CommentsWidget(),
                            const DetailsWidget(),
                            const LinkToExistingEventWidget(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RRElevatedPrimaryButtonWidget(
                                      color: const Color(0xff97d700),
                                      onPressed: () {
                                        reqResContext
                                            .read<ReqResBloc>()
                                            .add(CreateNewDiary());
                                      },
                                      text: Strings.next,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
        },
      ),
    );
  }
}
