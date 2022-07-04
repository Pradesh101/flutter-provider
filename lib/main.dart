import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/counter.dart';
import 'package:provider_practice/provider/movie_provider.dart';
import 'package:provider_practice/screens/home_screen.dart';
//import 'package:provider_practice/services/sp_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<Counter>(
    //   create: (BuildContext context) =>  Counter(),
    //   child: MaterialApp(
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: MyHomePage(title: 'Flutter Provider Tutorial'),
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
        ChangeNotifierProvider.value(
          value: MovieProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: const MyHomePage(title: 'Flutter Provider'),
        home: const HomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    // var counter = Provider.of<Counter>(context).getCounter;
    // var counterProvider = context.watch<Counter>();
    // print(counterProvider.getCounter);
    // To access states, you can use:
    // context.watch<T>(): Make the widget listen to changes on T
    // context.read<T>(): Returns T without listening to it
    // context.select<T, R>(R cb(T value)): Allows a widget to listen to only a small part of T
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: const Text(
                'Movie',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counter>(builder: (context, viewModel, child) {
              return Text(
                '${viewModel.count}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            // Text(
            //   '$counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
