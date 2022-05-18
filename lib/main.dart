import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'data/repositories/reqres_repository.dart';
import 'logic/bloc/reqres_bloc.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/app_router.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 15;
  }
}

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ReqResRepository()),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) => ReqResBloc(
                  reqResRepo: context.read<ReqResRepository>(),
                )),
      ], child: const BasicApp()),
    );
  }
}

class BasicApp extends StatefulWidget {
  const BasicApp({
    Key? key,
  }) : super(key: key);

  @override
  _BasicAppState createState() => _BasicAppState();
}

class _BasicAppState extends State<BasicApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, constraints, orientation) {
      return OverlaySupport(
        child: MaterialApp(
          title: Strings.appTitle,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.newDiaryScreen,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      );
    });
  }
}
