import 'package:flutter/material.dart';

class Day {
  Day(this.title, [this.projects = const <Project>[]]);
  String title;
  List<Project> projects;
  bool dayCheck = false;
}

class Project {
  Project(this.project, [this.tasks = const <Task>[]]);
  String project;
  List<Task> tasks;
  bool projectCheck = false;
}

class Task {
  Task(this.task);
  String task;
  bool taskCheck = false;
}

List<Day> day = <Day>[
  Day(
    'Today',
    <Project>[
      Project(
        'Project Billions',
        <Task>[Task('Meet Datuk')],
      )
    ],
  ),
  Day('Tomorrow'),
  Day('In 2 Days'),
  Day('Unplanned'),
  Day('Done'),
];

class CalenderView extends StatefulWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: day
              .map(
                (e) => ExpansionTile(
                  title: Text(e.title),
                  initiallyExpanded: true,
                  children: e.projects
                      .map(
                        (e) => ExpansionTile(
                          title: Text(e.project),
                          initiallyExpanded: true,
                          children: List.from([
                            Row(
                              children: [
                                Expanded(child: Container()),
                                const Expanded(
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Expanded(child: Container())
                              ],
                            )
                          ])
                            ..addAll(e.tasks
                                .map((e) => ListTile(
                                      title: Text(e.task),
                                    ))
                                .toList()),
                        ),
                      )
                      .toList(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
