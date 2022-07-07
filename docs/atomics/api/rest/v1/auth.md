---
title: "Atomics Rest API documentation"
description: "Learn how to use Atomics Rest API."
---

This service is restricted by an authorization control based on tokens. A token can be requested to the Atomics support.
The token must be passed in the Authorization header. 

If not valid, a `401 – Unauthorized` response will be returned.

??? example "HTTP request example"

    ```http hl_lines="3"
    GET /v1 HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: Bearer $TOKEN
    ```

![You shall not pass](../../../../img/shallnotpass.gif)