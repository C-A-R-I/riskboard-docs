
The Rest API is accessible at [:material-web: api.atomics.paonia.io/v1](https://api.atomics.paonia.io/v1)

## :octicons-repo-24: OpenAPI

The OpenAPI specification is available at [:material-code-json: /v1/openapi.json](https://api.atomics.paonia.io/v1/openapi.json)

## :octicons-shield-lock-24: Authentication

Authorization flows are be done by using token authentication.

Local tokens are provided by the Atomics support. If you don't have one, please contact us.

The bearer token must be provided in the `Authorization` header of each request.

If it's not valid, a `401 – Unauthorized` response will be returned.

??? example "HTTP request example"

    ```http hl_lines="3"
    GET /v1 HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: Bearer $TOKEN
    ```
