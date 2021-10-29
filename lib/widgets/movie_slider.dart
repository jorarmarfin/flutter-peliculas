import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

// ignore: must_be_immutable
class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? tituloCollection;
  final Function onNextPage;

  const MovieSlider(
      {Key? key,
      required this.movies,
      this.tituloCollection,
      required this.onNextPage})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, //Todo el ancho posible
      height: 250,
      // color: Colors.blue, //Color de fondo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _contenedor(context, widget.tituloCollection),
      ),
    );
  }

  List<Widget> _contenedor(context, tituloCollection) {
    if (tituloCollection == null) {
      return [];
    } else {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            tituloCollection,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        _listadoPeliculas(context)
      ];
    }
  }

  Widget _listadoPeliculas(context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) => _pelicula(context, index),
        itemCount: widget.movies.length,
      ),
    );
  }

  Widget _pelicula(context, int index) {
    final movie = widget.movies[index];
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instancie'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-imagen.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
