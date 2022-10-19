import 'package:get_it/get_it.dart';
import '../GIF/provider/gif_provider.dart';
import '../home/provider/home_provider.dart';
final getIt = GetIt.instance;
// final getIt=GetIt.instance;

initialize(){
  getIt.registerSingleton(HomeProvider());
  getIt.registerSingleton(GIFProvider());
}