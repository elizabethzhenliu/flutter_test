import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'TestApp',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

//MyAppState: state of the app
//ChangeNotifier: notify widgets about changes in its state
//
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  //add getNext method
  void getNext() {
    current = WordPair.random();
    notifyListeners(); //let everyone knowwwwwwwoooooonnnnnnkkkkkk      eeeeeennnnnnooooooyyyyyyrrrrrreeeeeevvvvvveeeeee      tttttteeeeeellllll////////////
  }
}

// very widget defines a build method that is called everytime the circumstances change
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //watches the appstate using context.watch
    var appState = context.watch<MyAppState>();

    //every build method must return a widget
    //scaffold, column, text are both widgets
    //
    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          //accesses appstate's only member: current
          BigCard(appState: appState),

          //Button
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Text(appState.current.asLowerCase);
  }
}
