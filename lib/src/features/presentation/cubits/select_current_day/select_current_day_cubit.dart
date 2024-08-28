import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_current_day_state.dart';

class SelectCurrentDayCubit extends Cubit<SelectCurrentDayState> {
  SelectCurrentDayCubit()
      : super(
          SelectCurrentDayState(
            dateTime: DateTime.now(),
          ),
        );

  void selectDate(DateTime dateTime) {
    emit(
      state.copyWith(dateTime: dateTime),
    );
  }
}
