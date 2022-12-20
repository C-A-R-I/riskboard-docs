# :octicons-verified-24: Enhanced Whois

:octicons-beaker-24: Experimental

__Route: `GET /v1/compute/whois/{fqdn}`__

A next gen whois service (not based on whois protocol).

## Parameters

The only parameter is `fqdn`.

## Request

*This is an example request to get information about a FQDN.*

??? example "HTTP request example"

    ```http
    GET /v1/compute/whois/photo.google.com HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: $token_type $access_token
    ```

## Response

``` {.js .annotate}
{
  "status": "ok",
  "data": {
    "atomic": {
      "type": "fqdn",
      "atomic": "photo.google.com",
      "fingerprint": "atomic_v1_f030e725d758f2e4e10ce61a7cd81309eb7fbd954c55716516d8b6c9003a3643",
      "tlp": "clear",
      "provider": "unknown",
      "confidence": "medium",
      "relations": [
        {
          "type": "children_of",
          "target": {
            "type": "domain",
            "atomic": "google.com",
            "fingerprint": "atomic_v1_e2ff9e8fae6fb45c874fdd8f8b77a47435ff7069e3bfb231bbcfb356dd687da5"
          },
          "properties": {}
        }
      ],
      "properties": {
        "subdomain": "photo",
        "domain": "google"
      },
      "created": "2022-12-19T15:47:39.347608Z",
      "updated": "2022-12-19T15:47:39.347656Z"
    },
    "compute": {
      "whois": {
        "decision": null,
        "context": {
          "domain": {
            "atomic": "google.com",
            "fingerprint": "atomic_v1_e2ff9e8fae6fb45c874fdd8f8b77a47435ff7069e3bfb231bbcfb356dd687da5",
            "tlp": "clear",
            "confidence": "medium",
            "properties": {
              "domain": "google",
              "name": "google"
            },
            "created": "2022-12-19T15:47:39.347608Z",
            "updated": "2022-12-19T15:47:39.347656Z"
          },
          "records": [
            {
              "domain": "google.com",
              "first_seen": "2022-09-06T16:30:38.454894Z",
              "last_seen": "2022-10-27T23:46:25.618527Z",
              "owner_id": "atomic_v1_8df1b0941aefafe8e7202f41efa25a58befb1a73d2580df6bf1ae0f22a11cdfd",
              "owner_name": "Google LLC",
              "registration_date": null
            }
          ]
        }
      }
    }
  },
  "error": []
}
```



