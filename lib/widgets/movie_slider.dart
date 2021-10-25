import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //Todo el ancho posible
      height: 250,
      color: Colors.blue, //Color de fondo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _contenedor(),
      ),
    );
  }

  List<Widget> _contenedor() {
    return [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Peliculas populares',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      _listadoPeliculas()
    ];
  }

  Widget _listadoPeliculas() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) => _pelicula(),
        itemCount: 20,
      ),
    );
  }

  Widget _pelicula() {
    return Container(
      width: 130,
      height: 190,
      color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
  }
}
