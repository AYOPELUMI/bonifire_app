// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BonfireRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BonfireScreen(),
      );
    }
  };
}

/// generated route for
/// [BonfireScreen]
class BonfireRoute extends PageRouteInfo<void> {
  const BonfireRoute({List<PageRouteInfo>? children})
      : super(
          BonfireRoute.name,
          initialChildren: children,
        );

  static const String name = 'BonfireRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
