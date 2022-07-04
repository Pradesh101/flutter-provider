import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider_practice/services/sp_service.dart';
import '../provider/movie_provider.dart';
import 'my_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyListScreen()));
              },
              icon: const Icon(Icons.favorite),
              label: Text(
                'Go to my list ${myList.length}',
                style: const TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: ((context, index) {
                  final currentMovie = movies[index];
                  return Card(
                    key: ValueKey(currentMovie),
                    color: Theme.of(context).primaryColor,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        currentMovie.title,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        currentMovie.runTime ?? 'No information',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if (!myList.contains(currentMovie)) {
                            context
                                .read<MovieProvider>()
                                .addToList(currentMovie);
                            // addToSP(currentMovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .removeFromList(currentMovie);
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: myList.contains(currentMovie)
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
