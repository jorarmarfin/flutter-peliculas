import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, //Todo el ancho posible
      height: 250,
      // color: Colors.blue, //Color de fondo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _contenedor(context),
      ),
    );
  }

  List<Widget> _contenedor(context) {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Peliculas populares',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      _listadoPeliculas(context)
    ];
  }

  Widget _listadoPeliculas(context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) => _pelicula(context),
        itemCount: 20,
      ),
    );
  }

  Widget _pelicula(context) {
    const _imagen = 'https://via.placeholder.com/300x400';
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
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-imagen.jpg'),
                image: NetworkImage(_imagen),
                width: 130,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(
            'Tengo un tiulo muy largo Tengo un tiulo muy largo Tengo un tiulo muy largo',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
