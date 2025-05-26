import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'app/app_router.dart';
import 'features/bonfire/provider/speech_provider.dart';
import './res/theme.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize speech provider
  final container = ProviderContainer();
  await container.read(speechProvider.notifier).initSpeech();

  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Stroll Bonfire',
      debugShowCheckedModeBanner: false,
      theme: BonfireTheme.lightMode,
      themeMode: ThemeMode.dark,
      routerConfig: appRouter.config(),
    );
  }
}
