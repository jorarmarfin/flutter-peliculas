import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String movie =
    //     ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie'.to;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _sliverAppBar(),
        SliverList(delegate: SliverChildListDelegate([_imagenTitulo(context)]))
      ],
    ));
  }

  Widget _sliverAppBar() {
    const _imagen = 'https://via.placeholder.com/500x300';
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: const Text(
              'Titulo',
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
          placeholder: AssetImage('assets/no-imagen.jpg'),
          image: NetworkImage(_imagen),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imagenTitulo(context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-imagen.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Titulo',
                style: theme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Subtitulo',
                style: theme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate,
                    size: 15,
                    color: Colors.orange,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'pelicula algo',
                    style: theme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
