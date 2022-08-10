---
title: "Atomics Rest API documentation"
description: "Learn how to use Atomics Rest API."
---

This service is restricted to authenticated users.

Authorization flows can be done using one of both strategies:

## Local

Local tokens are provided by the Atomics support. If you don't have one, please contact us.

The bearer token must be provided in the `Authorization` header of each request.

If it's not valid, a `401 – Unauthorized` response will be returned.

??? example "HTTP request example"

    ```http hl_lines="3"
    GET /v1 HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: Bearer $TOKEN
    ```

## Service User

To use a service user, you can refers to the [corresponding documentation](/iam/service_user).

The `token_type` and `access_token` must be provided in the `Authorization` header of each request.

If it's not valid, a `401 – Unauthorized` response will be returned.

??? example "HTTP request example"

    ```http hl_lines="3"
    GET /v1 HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: $token_type $access_token
    ```