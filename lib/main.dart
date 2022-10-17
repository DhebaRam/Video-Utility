import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_utility/splash_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:video_utility/utils/get_it.dart';
import 'home/provider/home_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late HomeProvider _homeProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeProvider = getIt<HomeProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => _homeProvider),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ));
  }
}
