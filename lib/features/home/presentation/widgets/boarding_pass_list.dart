import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_needzaio_app/features/home/home.dart';

class BoardingPassList extends ConsumerStatefulWidget {
  const BoardingPassList({Key? key}) : super(key: key);

  @override
  ConsumerState<BoardingPassList> createState() => _BoardingPassListState();
}

class _BoardingPassListState extends ConsumerState<BoardingPassList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(getBoardingPassNotifierProvider.notifier).execute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final execute = ref.watch(getBoardingPassNotifierProvider);

    return execute.maybeWhen(
        orElse: SizedBox.new,
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (boardingPasses) {
          return ListView.builder(
            reverse: true,
            itemCount: boardingPasses.length,
            itemBuilder: (_, index) {
              final boardingPass = boardingPasses[index];
              return BoardingPassCard(boardingPass: boardingPass);
            },
          );
        });
  }
}
