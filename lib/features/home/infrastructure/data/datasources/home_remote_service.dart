import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_needzaio_app/core/core.dart';
import 'package:flutter_needzaio_app/features/home/home.dart';

abstract class HomeRemoteService {
  Future<List<BoardingPassDTO>> getBoardingPasses();
  Future<BoardingPassDTO> addBoardingPass(BoardingPassDTO boardingPass);
}

/// Implementation of [HomeRemoteService]
@Injectable(as: HomeRemoteService)
class HomeRemoteServiceImpl extends HomeRemoteService {
  /// Constructor
  HomeRemoteServiceImpl(this._client);

  final GraphQLClient _client;

  @override
  Future<List<BoardingPassDTO>> getBoardingPasses() async {
    List<BoardingPassDTO> boardingPasses = [];
    final QueryResult query = await _client.query(QueryOptions(
      document: gql(boardingPassQuery),
      fetchPolicy: FetchPolicy.networkOnly,
    ));

    final data = query.data;

    if (data != null) {
      boardingPasses =
          (data['BoardingPass'] as List).map<BoardingPassDTO>((value) {
        return BoardingPassDTO.fromJson(value as Map<String, dynamic>);
      }).toList();
    }

    return boardingPasses;
  }

  @override
  Future<BoardingPassDTO> addBoardingPass(BoardingPassDTO boardingPass) async {
    try {
      final QueryResult mutate = await _client.mutate(MutationOptions(
        document: gql(insertBoardingPassMutation),
        fetchPolicy: FetchPolicy.networkOnly,
        variables: boardingPass.toJson(),
      ));

      final data = mutate.data;

      if (data != null) {
        return BoardingPassDTO.fromJson(data['insert_BoardingPass']['returning']
            [0] as Map<String, dynamic>);
      }
      throw const CommonFailure.noData();
    } catch (e) {
      throw const CommonFailure.server();
    }
  }
}
