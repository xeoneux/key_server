Write a server which can generate random api keys, assign them for usage and release them after sometime. Following endpoints should be available on the server to interact with it.
1. There should be one endpoint to generate keys.
2. There should be an endpoint to get an available key. On hitting this endpoint server should serve a random key which is not already being used. This key should be blocked and should not be served again by E2 while it is in this state. If no eligible key is available then it should serve 404.
3. There should be an endpoint to unblock a key. Unblocked keys can be served via E2 again.
4. There should be an endpoint to delete a key. Deleted keys should be purged.
5. All keys are to be kept alive by clients calling this endpoint every 5 minutes. If a particular key has not received a keep alive in last five minutes then it should be deleted and never used again.

Apart from these endpoints, following rules should be enforced:
1. All blocked keys should get released automatically within 60 secs if E3 is not called.
No endpoint call should result in an iteration of whole set of keys i.e. no endpoint request should be O(n). They should either be O(lg n) or O(1).

Also add RSpecs (Unit tests) along with the code.
