import 'package:get_it/get_it.dart';
import 'package:greeter/services/greeter_service.dart';
import 'package:greeter/utils/id_generator.dart';
import 'package:greeter/view_models/greeter_view_model.dart';

final locator = GetIt.I;

setupLocator() {
  locator.registerFactory(() => GreeterViewModel(locator<GreeterService>()));

  locator.registerLazySingleton(() => GreeterService(IdGenerator()));
}
