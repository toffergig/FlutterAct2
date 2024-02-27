import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_activity2/api/user_api_client.dart';
import 'package:flutter_activity2/Models/user_model.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockClient;
  late UserApiClient userApiClient;

  setUp(() {
    mockClient = MockHttpClient();
    userApiClient = UserApiClient(client: mockClient);
  });

  test(
    'Given UserApiClient is instantiated when fetchUsers is called and return is 200 then a List<UserModel> should be returned',
    () async {
      // Mocking the HTTP client response
      when(() => mockClient.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      )).thenAnswer((_) => Future.delayed(Duration.zero, () => Response('''
        [
          {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "address": {
                  "street": "Kulas Light",
                  "suite": "Apt. 556",
                  "city": "Gwenborough",
                  "zipcode": "92998-3874",
                  "geo": {
                      "lat": "-37.3159",
                      "lng": "81.1496"
                  }
              },
              "phone": "1-770-736-8031 x56442",
              "website": "hildegard.org",
              "company": {
                  "name": "Romaguera-Crona",
                  "catchPhrase": "Multi-layered client-server neural-net",
                  "bs": "harness real-time e-markets"
              }
          }
        ]
      ''', 200)));

      final userList = await userApiClient.fetchUsers();

      expect(userList, isA<List<UserModel>>());

      verify(
        () => mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users'),
        ),
      ).called(1);
    },
  );

  test(
    'Given UserApiClient is instantiated when fetchUsers is called and return is 404 then an Exception should be thrown',
    () async {

      when(
        () => mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users'),
        ),
      ).thenAnswer(
            (_) => Future.delayed(Duration.zero, () => Response('', 404)),
      );

      // Expecting an exception when fetchUsers is called
      expect(userApiClient.fetchUsers(), throwsException);
    },
  );
}
