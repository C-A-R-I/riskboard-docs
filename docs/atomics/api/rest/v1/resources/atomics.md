---
title: "Atomics Rest API documentation"
description: "Learn how to use Atomics Rest API."
---

## Upsert one or more Atomic

> Documentation in progress ...

## Get all Atomic nodes by type

> Documentation in progress ...

## Search Atomic nodes by keyword

> Documentation in progress ...

## Get Atomic node by fingerprint

> Documentation in progress ...

## Search all organization for a given purpose

Route: `GET /v1/atomic/by-type/organization/by-purpose/{purpose}`

This endpoint return all organizations which match the purpose property.

The `purpose` value can be one of :

- `cloud_provider`
- `cloud_solution`
- `hosting`
- `cdn`
- `isp`
- `business`
- `security`
- `dns`
- `mail`

> :information_source: An optional parameter normalized (`?normalized=true`) could be added to get the atomic value instead of the common name.

??? example "HTTP request example"

    ```  { .http .annotate }
    GET /v1/atomics/by-type/organization/by-purpose/cloud_provider HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: Bearer $TOKEN
    ```

??? example "HTTP response example"

    ```  { .js .annotate }
    {
        "status": "ok",
        "data": [
            "Google Cloud Platform",
            "Microsoft Azure",
            "Amazon Web Services",
            "Oracle Cloud Infrastructure",
            "DigitalOcean",
            "..."
        ]
    }
    ```
