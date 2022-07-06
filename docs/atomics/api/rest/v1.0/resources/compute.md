---
title: "Atomics Rest API documentation"
description: "Learn how to use Atomics Rest API."
---

## Investigate mutualization of an IP address

Route: `GET /compute/is-mutualized/{ip}`

This compute resource is used to know if an IP is mutualized or not.

The only parameter is `ip` and {==must be an IPv4 or IPv6 address==}.

??? example "HTTP request example"

    ```http
    GET /compute/is-mutualized/35.247.255.130 HTTP/1.1
    Host: api.atomics.paonia.io:443
    Authorization: Bearer $TOKEN
    ```

??? example "HTTP response example"

    ``` {.js .annotate}
    {
        "status": "ok",
        "data": {
            "atomic": { // (1)
                "atomic": "35.247.255.130",
                "type": "ipv4_addr",
                "fingerprint": "atomic_v1_c58041a6fbbcb5e1cfcf1620bd6234fc8e34a63fb17533dfde75c810ff48dc35",
                "tlp": "amber",
                "provider": "unknown",
                "confidence": "medium",
                "relations": [
                    {
                        "target": {
                            "atomic": "35.246.0.0/15",
                            "type": "ipv4_prefix",
                            "fingerprint": "atomic_v1_d6af0a54d219f3994f43d59baffe27d572a328312cae617905b434085afbb389"
                        },
                        "type": "belong_to",
                        "properties": {}
                    }
                ],
                "properties": {
                    "ipv4_addr_int": 603455362
                },
                "created": null,
                "updated": null
            },
            "compute": {
                "mutualized": {
                    "decision": {
                        "value": true, // (2)
                        "reason": [ // (3)
                            "is_cloud_provider",
                            "is_cloud_solution"
                        ]
                    },
                    "context": {
                        "service": [ // (4)
                            {
                                "purpose": "cloud_provider",
                                "name": [
                                    "GOOGLE-CLOUD-PLATFORM"
                                ],
                                "cloud_service": [],
                                "cloud_region": [],
                                "cloud_platform": [
                                    "GCP"
                                ]
                            },
                            {
                                "purpose": "cloud_solution",
                                "name": [
                                    "GOOGLE"
                                ],
                                "cloud_service": [],
                                "cloud_region": [],
                                "cloud_platform": [
                                    "Google"
                                ]
                            }
                        ],
                        "domain": [], // (5)
                        "taxonomy": [] // (6)
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
