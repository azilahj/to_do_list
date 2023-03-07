import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        fontFamily: 'NotoSansKR',
      ),
      home: const MyHomePage(title: 'To-Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.selected,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.grey;
    }

    bool isChecked = false;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 12,
                    left: 12,
                    right: 12,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 12.0,
                          offset: const Offset(0, 12.0),
                        ),
                      ],
                    ),
                    child: Card(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 12, bottom: 8, left: 12, right: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Automated Testing Script',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 1, left: 12, right: 12),
                            child: Row(
                              children: const [
                                Expanded(flex: 3, child: Text('Start Date')),
                                Expanded(flex: 3, child: Text('End Date')),
                                Expanded(flex: 3, child: Text('Time Left')),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 1, bottom: 12, left: 12, right: 12),
                            child: Row(
                              children: const [
                                Expanded(flex: 3, child: Text('21 Oct 2019')),
                                Expanded(flex: 3, child: Text('23 Oct 2019')),
                                Expanded(flex: 3, child: Text('23 hrs 22 min')),
                              ],
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 214, 214, 178),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 12, right: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: const [
                                        Text('Status'),
                                        Text('\tIncomplete',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          children: [
                                            const Text('Tick if completed'),
                                            Checkbox(
                                              checkColor: Colors.white,
                                              fillColor: MaterialStateProperty
                                                  .resolveWith(getColor),
                                              value: isChecked,
                                              onChanged: (bool? value) {
                                                if (isChecked = false) {
                                                  isChecked = true;
                                                } else {
                                                  isChecked = false;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondRoute()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 12,
              left: 12,
              right: 12,
            ),
            child: Column(
              children: [
                const Text('To-Do List'),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const Text('Start Date'),
                InputDatePickerFormField(
                  firstDate: DateTime(DateTime.now().year - 120),
                  lastDate: DateTime(DateTime.now().year + 20),
                  keyboardType: TextInputType.datetime,
                  fieldLabelText: 'Select a date',
                  onDateSubmitted: (date) {},
                  onDateSaved: (date) {
                    //setState(() {
                    //  selectedDate = date;
                    //});
                  },
                ),
                const Text('Estimate End Date'),
                InputDatePickerFormField(
                  firstDate: DateTime(DateTime.now().year - 120),
                  lastDate: DateTime(DateTime.now().year + 20),
                  keyboardType: TextInputType.datetime,
                  fieldLabelText: 'Select a date',
                  onDateSubmitted: (date) {},
                  onDateSaved: (date) {
                    //setState(() {
                    //  selectedDate = date;
                    //});
                  },
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const ElevatedButton(
          onPressed: null,
          child: Text('Create Now'),
        ),
      ),
    );
  }
}
