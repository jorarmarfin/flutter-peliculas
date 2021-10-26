import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: _myBody(),
    );
  }

  _myAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Peliculas de cine'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  Widget _myBody() {
    return SingleChildScrollView(
      //Este singleChildScrollView es para que se puda hacer scroll en la
      // pantalla cuando se coloca un objeto que sobre pasa
      child: Column(
        children: const [CardSwiper(), MovieSlider()],
      ),
    );
  }
}
