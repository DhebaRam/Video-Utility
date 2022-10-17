import 'package:get_it/get_it.dart';
import '../home/provider/home_provider.dart';
final getIt = GetIt.instance;
// final getIt=GetIt.instance;

initialize(){
  getIt.registerSingleton(HomeProvider());
}