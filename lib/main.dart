import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => Counter(),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    
    final counter = Provider.of<Counter>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Counter>(
            builder: (context, value, child) {
              return Text(
                value.counter.toString(),
                style: TextStyle(fontSize: 35),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  counter.minus();
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  counter.add();
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void add() {
    _counter += 1;
    notifyListeners();
  }

  void minus() {
    _counter -= 1;
    notifyListeners();
  }
}
