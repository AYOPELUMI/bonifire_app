import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../features/bonfire/presentation/screens/bonfire_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BonfireRoute.page, initial: true),
      ];
}
