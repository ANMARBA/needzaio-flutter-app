String insertBoardingPassMutation = """
  mutation InsertBoardingPass(\$arrivalTime: timestamptz!, \$airport: String!, \$age: numeric!, \$departureTime: timestamptz!, \$email: String!, \$flight: String!, \$lastName: String!, \$name: String!) {
    insert_BoardingPass(objects: {arrivalTime: \$arrivalTime, airport: \$airport, age: \$age, departureTime: \$departureTime, email: \$email, flight: \$flight, lastName: \$lastName, name: \$name}) {
      returning {
        id
        arrivalTime
        airport
        age
        departureTime
        email
        flight
        lastName
        name
      }
    }
  }
""";
