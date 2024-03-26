import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tmdbtask/core/utils/caching2/cache_manager.dart';

import 'app.dart';
import 'core/services/dependency_injection.dart';
import 'core/utils/helpers/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ServicesLocator().init();

  runApp(const MyApp());
}
