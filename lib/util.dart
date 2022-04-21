// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}


final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {

  for (var item in List.generate(28, (index) => index)) DateTime.utc(kFirstDay.year, kFirstDay.month, item * 7):

  List.generate(
        1, (index) => const Event('SHOULDERS \n\nArnold Press - 3x8 (Sets, Reps)'
      '\n\nBarbell Overhead Press - 3x8 (Sets, Reps)\n\n'
      'Dumbbell Lateral Raises - 3x12 (Sets, Reps)\n\n'
      'Scapula Shrugs - 3x20 (Sets, Reps)'
  ),
  ),
};



int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year+500, kToday.month + 500, kToday.day);
