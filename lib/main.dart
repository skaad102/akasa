import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_a_kasa/ui/theme/theme.dart';

import 'router/app_router.dart';
import 'ui/model/app_state_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final theme = ThemeAKasa.light();
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(appStateManager: _appStateManager);
    _appStateManager.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // home: Router(routerDelegate: _appRouter),
        routeInformationProvider: _appRouter.router.routeInformationProvider,
        routerDelegate: _appRouter.router.routerDelegate,
        routeInformationParser: _appRouter.router.routeInformationParser,
        theme: theme,
      ),
    );
  }
}
