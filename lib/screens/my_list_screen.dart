import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider_practice/models/movie.dart';
import 'package:provider_practice/provider/movie_provider.dart';
//import 'package:provider_practice/services/sp_service.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  // getSharedPreferenceData() async {
  //   List<Movie> data = await getFromSP();
  //   Provider.of<MovieProvider>(context, listen: false).setFavorites(data);
  // }

  // @override
  // void initState() {
  //   getSharedPreferenceData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('My List ${_myList.length}'),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          itemBuilder: ((context, index) {
            final currentMovie = _myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.runTime ?? ''),
                trailing: TextButton(
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currentMovie);
                  },
                ),
              ),
            );
          })),
    );
  }
}
