import 'package:get_it/get_it.dart';
import 'package:udevs_task/src/features/data/local/database.dart';
import 'package:udevs_task/src/features/data/remote/api_service.dart';
import 'package:udevs_task/src/features/data/repository/event_repository.dart';
import 'package:udevs_task/src/features/data/repository/get_location_repository.dart';

final GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerFactory(() => GetLocationRepository(ApiService()));
  locator.registerFactory(() => EventRepository(LocalDataBase()));
}
