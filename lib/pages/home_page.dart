// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
      appBar: _myAppBar(),
      body: _myBody(moviesProvider),
    );
  }

  _myAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Peliculas de cine'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  Widget _myBody(moviesProvider) {
    return SingleChildScrollView(
      //Este singleChildScrollView es para que se puda hacer scroll en la
      // pantalla cuando se coloca un objeto que sobre pasa
      child: Column(
        children: [
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          MovieSlider(
            movies: moviesProvider.popularMovies,
            tituloCollection: 'Populares....',
            onNextPage: () => moviesProvider.getPopularMovies(),
          )
        ],
      ),
    );
  }
}
