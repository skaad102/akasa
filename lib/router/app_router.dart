import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:prueba_a_kasa/ui/pages/home.dart';
import 'package:prueba_a_kasa/ui/pages/login.dart';
import 'package:prueba_a_kasa/ui/pages/splash_page.dart';

import '../ui/model/app_state_manager.dart';

// class AppRouter extends RouterDelegate
//     with ChangeNotifier, PopNavigatorRouterDelegateMixin {
//   final GlobalKey<NavigatorState> navigatorKey;

//   final AppStateManager appStateManager;

//   AppRouter({required this.appStateManager})
//       : navigatorKey = GlobalKey<NavigatorState>() {
//     appStateManager.addListener(notifyListeners);
//   }
//   @override
//   void dispose() {
//     appStateManager.removeListener(notifyListeners);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Page> _pages = [
//       if (!appStateManager.isInitialized) SplashPage.page(),
//       if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
//         HomePage.page(),
//     ];
//     return Navigator(
//       key: navigatorKey,
//       pages: [],
//       onPopPage: _handlePopPage,
//     );
//   }

//   bool _handlePopPage(
//       // 1
//       Route<dynamic> route,
//       // 2
//       result) {
//     // 3
//     if (!route.didPop(result)) {
//       // 4
//       return false;
//     }
//     // 5
//     // TODO: Handle Onboarding and splash
//     // TODO: Handle state when user closes grocery item screen
//     // TODO: Handle state when user closes profile screen
//     // TODO: Handle state when user closes WebView screen
//     // 6
//     return true;
//   }

//   @override
//   Future<void> setNewRoutePath(configuration) async => null;
// }

class AppRouter with ChangeNotifier {
  final AppStateManager appStateManager;

  AppRouter({required this.appStateManager});

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          final inicio = Provider.of<AppStateManager>(context).isInitialized;
          // final incio = AppStateManager().isInitialized;
          if (!inicio) {
            return const SplashPage();
          }
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
    ],
    // errorBuilder: (context, state) => ErrorScreen(state.error),
  );

  GoRouter get router => _router;
}
