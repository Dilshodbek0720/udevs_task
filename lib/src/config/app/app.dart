import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_task/src/config/theme/theme.dart';
import '../../features/presentation/blocs/events_for_calendar/event_for_calendar_bloc.dart';
import '../../features/presentation/blocs/get_events/get_events_bloc.dart';
import '../../features/presentation/cubits/select_current_day/select_current_day_cubit.dart';
import '../../features/presentation/pages/locator.dart';
import '../routes/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var neededDayCubit = BlocProvider.of<SelectCurrentDayCubit>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => EventsForCalendarBloc(locator())
              ..add(EventsForCalendarEvent())),
        BlocProvider(
          create: (BuildContext context) => GetEventsBloc(locator())
            ..add(
              GetTodosEvent(neededDayCubit.state.dateTime.toString()),
            ),
        )
      ],
      child: MaterialApp(
        theme: AppTheme.lighTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
