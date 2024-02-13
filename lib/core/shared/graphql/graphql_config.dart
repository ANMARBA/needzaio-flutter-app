import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLClientConfig {
  GraphQLClient getClient() {
    Map<String, String> defaultHeaders = {
      'x-hasura-admin-secret':
          'en7AUc0ze7LlcYI1m4ssslsZUxZduQrdBvQlBBSQhSw24HpvbVknbuykgik3O1MC'
    };
    final HttpLink httpLink = HttpLink(
      'https://alert-lemming-19.hasura.app/v1/graphql',
      defaultHeaders: defaultHeaders,
    );

    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
  }
}
