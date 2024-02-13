import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter_needzaio_app/core/core.dart';
import 'package:flutter_needzaio_app/features/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(getIt<GraphQLClient>()),
      child: CacheProvider(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Pases de Abordaje',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const BoardingPassList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BoardingPassFormPage(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
