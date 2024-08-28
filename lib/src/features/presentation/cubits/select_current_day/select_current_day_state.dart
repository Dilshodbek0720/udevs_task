part of 'select_current_day_cubit.dart';

class SelectCurrentDayState extends Equatable {
  const SelectCurrentDayState({
    required this.dateTime,
  });

  final DateTime dateTime;

  SelectCurrentDayState copyWith({
    DateTime? dateTime,
  }) =>
      SelectCurrentDayState(
        dateTime: dateTime ?? this.dateTime,
      );

  @override
  List<Object> get props => [
        dateTime,
      ];
}
