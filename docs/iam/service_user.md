---
title: "Paonia - IAM - Service User"
description: "Learn how to use service users."
---

Service Users are provided by the Paonia support. If you don't have one, please contact us.

You will be provided three values:

- `userId` the identifier of your service user
- `keyId` the identifier of the public key
- `key` the private key (in PEM format)

We use the `private_key_jwt` ("JWT bearer token with private key", [RFC7523](https://tools.ietf.org/html/rfc7523)) authorization grant for this non-interactive authentication.

![Authorization Flow - "Private Key JWT"](../img/private_key_jwt_flow.png)

You need to follow these steps to authenticate a service user and receive an access token:

1. Create a JSON Web Token (JWT) and sign with your private key
2. With this JWT, request an OAuth token from [auth.paonia.io](https://auth.paonia.io)

With this token you can be authenticated in our products.

## Create a JWT

You need to create a JWT with the following header and payload and sign it with the RS256 algorithm.

Header:

```json hl_lines="3"
{
    "alg": "RS256",
    "kid":"YOUR_KEY_ID"
}
```

Payload:

```json hl_lines="2-3"
{
    "iss": "YOUR_USER_ID",
    "sub": "YOUR_USER_ID",
    "aud": "auth.paonia.io",
    "iat": [Current UTC timestamp, e.g. 1605179982, max. 1 hour ago],
    "exp": [UTC timestamp, e.g. 1605183582]
}
```

## Request an OAuth token

With the encoded JWT from the prior step, you will need to craft a POST request to the token endpoint:

```bash hl_lines="6"
curl --request POST \
  --url https://auth.paonia.io/oauth/v2/token \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer \
  --data scope='openid profile email' \
  --data assertion=YOUR_ENCODED_JWT
```

You should receive a successful response with access_token, token_type and time to expiry in seconds as expires_in.

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "access_token": "MtjHodGy4zxKylDOhg6kW90WeEQs2q...",
  "token_type": "Bearer",
  "expires_in": 43199
}
```

## Snippets

??? example "Javascript: get an access token"

    ```js hl_lines="1-3"

        const userId = '170652898399617621'
        const keyId = '170653025419919957'
        const key = "-----BEGIN RSA PRIVATE KEY-----\n [...] \n-----END RSA PRIVATE KEY-----";
        
        // ---------    

        const { generate } = require('jwt-bearer-client-auth');
        const axios = require('axios');
    
        const tokenEndpoint = `https://auth.paonia.io/oauth/v2/token`
        const expiresIn = 60;
    
        const assertion = await generate({
            {
                kid: keyId,
                kty: 'PEM',
                pem: key,
            },
            userId,
            userId,
            tokenEndpoint,
            expiresIn,
            {},
        });
    
        const response = await axios.get(`${tokenEndpoint}?grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&scope=openid profile&assertion=${assertion}`)
    
        console.log('> token_type:', response.data.token_type)
        console.log('> access_token:', response.data.access_token)
    ```
