---
title: "Atomics Rest API documentation"
description: "Learn how to use Atomics Rest API."
---

## Investigate mutualization of an IP address

Route: `GET /v1/compute/is-mutualized/{ip}`

This compute resource is used to know if an IP is mutualized or not.

The only parameter is `ip` and {==must be an IPv4 or IPv6 address==}.

??? example "HTTP request example"

    ```http
    GET /v1/compute/is-mutualized/3.5.140.56 HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: Bearer $TOKEN
    ```

??? example "HTTP response example"

    ``` {.js .annotate}
    {
      "status": "ok",
      "data": {
        "atomic": { // (1)
          "atomic": "3.5.140.56",
          "type": "ipv4_addr",
          "fingerprint": "atomic_v1_61babe98fa387a9cd2385e6b36119e6c8fa46ba188e7928dbe87ebd45f43bc64",
          "tlp": "amber",
          "provider": "unknown",
          "confidence": "medium",
          "relations": [
            {
              "target": {
                "atomic": "3.5.140.0/22",
                "type": "ipv4_prefix",
                "fingerprint": "atomic_v1_772a0c171f76d17155e2fd4c7dd81d9004f14ad4388bfceae9f9c917a80d6732"
              },
              "type": "belong_to",
              "properties": {}
            }
          ],
          "properties": {
            "ipv4_addr_int": 50695224
          },
          "created": null,
          "updated": null
        },
        "compute": {
          "mutualized": {
            "decision": {
              "value": true, // (2)
              "reason": [ // (3)
                "taxonomy_exists",
                "is_cloud_provider"
              ]
            },
            "context": {
              "service": [ // (4)
                {
                  "purpose": "cloud_provider",
                  "name": "Amazon Web Services",
                  "service": null,
                  "region": null,
                  "platform": "AWS"
                },
                {
                  "purpose": "cloud_provider",
                  "name": "EC2 ap-northeast-2",
                  "service": "EC2",
                  "region": "ap-northeast-2",
                  "platform": "AWS"
                },
                {
                  "purpose": "cloud_provider",
                  "name": "S3 ap-northeast-2",
                  "service": "S3",
                  "region": "ap-northeast-2",
                  "platform": "AWS"
                },
                {
                  "purpose": "cloud_provider",
                  "name": "AMAZON ap-northeast-2",
                  "service": "AMAZON",
                  "region": "ap-northeast-2",
                  "platform": "AWS"
                },
                {
                  "purpose": "business",
                  "name": "Amazon.com, Inc.",
                  "service": null,
                  "region": null,
                  "platform": null
                }
              ],
              "domain": [], // (5)
              "taxonomy": [ // (6)
                {
                  "updated": "2022-07-07T08:55:31.786500",
                  "value": true,
                  "reason": [
                    "is_cloud_provider"
                  ]
                }
              ]
            }
          }
        }
      },
      "error": []
    }
    ```
    
    1.    Object representation of Atomic node
    2.    Boolean value `true` indicates that IP is mutualized
    3.    Array of String, indicates why IP is tagged as mutualized ; Could be one of :
        - `no_data` no context have been found to compute the decision 
        - `taxonomy_exists` *(live with one ore more reasons)* indicates that an analysis has already been set in the previous 72 hours.
        - `has_multiple_domains` engine have found multiple domains living on the same host
        - `is_cloud_provider` IP is related to an organization or a service tagged as a Cloud Provider
        - `is_cloud_solution` IP is related to an organization or a service tagged as a Cloud Solution
        - `is_hosting` IP is related to an organization or a service tagged as Hosting
        - `is_cdn` IP is related to an organization or a service tagged as CDN
    4.    Array of Object ; Organizations or services related to the given IP
    5.    Array of String ; List of domains living on the given IP
    6.    Array of Object ; List of taxonomy linked to the given IP *(previous analysis)* 
    
## Compute the fingerprint of an Atomic

> Documentation in progress ...

## Get stats about Atomic nodes type

> Documentation in progress ...
