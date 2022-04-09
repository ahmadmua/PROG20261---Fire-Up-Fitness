import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/calendarEvent/event.dart';
import 'package:project/home-screen.dart';
import 'package:project/pedometer-screen.dart';
import 'package:project/workEd-screen.dart';
import 'createWorkout-screen.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}


class _CalendarScreenState extends State<CalendarScreen> {
  int _currentIndex = 1;

  Map<DateTime, List<Event>> _selectedEvents = {};
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _selectedEvents = {};
  }

  List<Event> getEventsFromDay(DateTime date){
    return _selectedEvents[date]?? [];
  }

  @override
  void dispose(){
    super.dispose();
    _eventController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Calendar"),
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            if(value == 0){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            }
            else if(value == 1){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const CalendarScreen();
              }));
            }
            else if(value == 2){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const CreateWorkoutScreen();
              }));
            }
            else if(value == 3){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const WorkEdScreen();
              }));
            }
            else if(value == 4){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const PedometerScreen();
              }));
            }
            setState(() => _currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              label: ('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: ('Calendar'),
              icon: Icon(Icons.calendar_month),
            ),
            BottomNavigationBarItem(
              label: ('Add Workout'),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: ('Exercises'),
              icon: Icon(Icons.fitness_center),
            ),
            BottomNavigationBarItem(
              label: ('Pedometer'),
              icon: FaIcon(FontAwesomeIcons.personWalking),
            ),
          ],
        ),
        body: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2015, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: getEventsFromDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              headerStyle: const HeaderStyle(
                formatButtonShowsNext: false
              ),
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Color.fromRGBO(255, 130, 100, 1),
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Color.fromRGBO(255, 130, 100, 0.7),
                  shape: BoxShape.circle,
                )
              ),
            ),
            ...getEventsFromDay(_selectedDay).map((Event event) => ListTile(title: Text(event.title),)),
          ],
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {

                  } else {
                    if (_selectedEvents[_selectedDay] != null) {
                      _selectedEvents[_selectedDay]?.add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      _selectedEvents[_selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }

                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState((){});
                  return;
                },
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 130, 100, 1),
        label: const Text("Add Event"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
