import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core/constants/strings.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/new_diary_screen/new_diary_screen.dart';

class AppRouter {
  static const String home = Strings.homeScreenRoute;
  static const String newDiaryScreen = Strings.newDiaryScreenRoute;

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newDiaryScreen:
        return MaterialPageRoute(
          builder: (_) => const NewDiaryScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        log(settings.name!);

        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}

class ChangeCredentialsArguments {
  final String token;

  ChangeCredentialsArguments(this.token);
}

class ScreenArguments {
  final int index;

  ScreenArguments(this.index);
}

class StringArguments {
  final String text;

  StringArguments(this.text);
}

class DiscussionArguments {
  final String boardType;
  final String entityId;
  final String canRespond;
  final String canDelete;

  DiscussionArguments(
      this.boardType, this.entityId, this.canRespond, this.canDelete);
}

class EventsArguments {
  final String slug;
  final String isOwner;
  final String isPublished;
  final String isEditMode;
  final String? eventQR;
  final String title;

  EventsArguments(this.slug, this.isOwner, this.isPublished, this.isEditMode,
      this.eventQR, this.title);
}
