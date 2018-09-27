import 'dart:io';
import 'dart:async';
import 'package:oauth2/oauth2.dart' as oauth2;

class PrAuthTest {
  void login(String usr, String pw) async {
// This URL is an endpoint that's provided by the authorization server. It's
// usually included in the server's documentation of its OAuth2 API.
    final authorizationEndpoint =
    Uri.parse("https://bigbuild-test.authentication.sap.hana.ondemand.com/oauth/authorize");

// The user should supply their own username and password.
    final username = usr;
    final password = pw;

// The authorization server may issue each client a separate client
// identifier and secret, which allows the server to tell which client
// is accessing it. Some servers may also have an anonymous
// identifier/secret pair that any client may use.
//
// Some servers don't require the client to authenticate itself, in which case
// these should be omitted.
    final identifier = "sb-copin-test!t108";
    final secret = "nHxucX/WVj2bXOPQHRskwehb5QI=";

// Make a request to the authorization endpoint that will produce the fully
// authenticated Client.
    var client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: identifier, secret: secret);

// Once you have the client, you can use it just like any other HTTP client.
    var result = await client.read(
        "https://test-copin-task-service.cfapps.sap.hana.ondemand.com/api/odata/v1/Tasks?\$skip=0&\$top=20&\$orderby=DueDate%20asc&\$filter=ProjectUuid%20eq%20%27b67733f1-d46c-43d8-832a-324d02cb222e%27&\$inlinecount=allpages");

// Once we're done with the client, save the credentials file. This will allow
// us to re-use the credentials and avoid storing the username and password
// directly.
    new File("~/.myapp/credentials.json")
        .writeAsString(client.credentials.toJson());
  }
}