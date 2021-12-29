import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';
import '../cookie_request.dart';

class ScheduleForm extends StatefulWidget {
  static const routeName = '/add-schedule';

  const ScheduleForm ({Key? key}) : super(key: key);

  @override
  _ScheduleForm createState() => _ScheduleForm();
}

class _ScheduleForm extends State<ScheduleForm> {

  final _formkey = GlobalKey<FormState>();
  // static const Color dark = Color(0xffffff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Schedule Form'),
        backgroundColor: Colors.grey[500],
        foregroundColor: Colors.deepPurple[900],
      ),
      drawer: const MainDrawer(), // optional
      body: Container(
        color: Colors.white24,
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                // padding: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child:Text('Add Schedule in here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.teal[200])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name: '),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      hintText: "Enter a schedule title",
                      labelText: "Name of schedule",
                      icon: Icon(Icons.assignment),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)
                      )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please add a valid text for name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Day: ')
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    decoration: new InputDecoration(
                        hintText: "Enter a day of schedule",
                        labelText: "Day of schedule",
                        icon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add a valid day';
                      }
                      return null;
                    },
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Start Time: ')
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: new InputDecoration(
                        hintText: "Enter a start time of schedule",
                        labelText: "Start Time of schedule",
                        icon: Icon(Icons.watch_later),
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add a valid time';
                      }
                      return null;
                    },
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Due Time: ')
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: new InputDecoration(
                        hintText: "Enter a end time of schedule",
                        labelText: "End Time of schedule",
                        icon: Icon(Icons.watch_later_outlined),
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please add a valid time';
                      }
                      return null;
                    },
                  )
              ),
              Padding(
                // padding: const EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // if the form is valid, display a snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add Schedule Success')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[200],
                    // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    textStyle: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold
                    )
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.white60),),
                ),
              ),
            ],
          ),
        ),
      )

    );
  }

}



class WeeklySchedule extends StatefulWidget {
  static const routeName = '/weekly-schedule';

  const WeeklySchedule({Key? key}) : super(key: key);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();
}

class _WeeklyScheduleState extends State<WeeklySchedule> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(ScheduleForm.routeName);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      // body: Container(
      //   color: Colors.blue,
      //   child: Form(
      //     key: _form,
      //   ),
      // )
    );
  }

}