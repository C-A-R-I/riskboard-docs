# :octicons-workflow-24: Get related services of an Atomic

__Route: `GET /orgs/{slug}/apps/atomics/compute/is-service/{type}/{atomic}`__

This compute resource is used to get related services of an Atomic node.

## Parameters

Parameter `type` must be one of :

```txt
ipv4_addr
ipv4_prefix
ipv6_addr
ipv6_prefix
autonomous_system
organization
domain
fqdn
url
email
service
server
certificate
threat
```

## Request

*This is an example of a request to get related services of an IPv4 address.*

```http
GET /orgs/{slug}/apps/atomics/compute/is-service/ipv4_addr/8.8.4.4 HTTP/1.1
Host: sailor.riskboard.eu:443
X-Sailor-Token: $TOKEN
```

## Response

``` {.js .annotate}
{
    "status": "ok",
    "data": {
        "atomic": { // (1)
            "atomic": "8.8.4.4",
            "type": "ipv4_addr",
            "fingerprint": "atomic_v1_4d2b6784de33efb81a4b2fcdc9d1e89ea7b06c0988a857e2766822c3ea391d8a",
            "tlp": "clear",
            "provider": "unknow",
            "confidence": "medium",
            "relations": [
                {
                    "target": {
                        "atomic": "8.8.4.0/24",
                        "type": "ipv4_prefix",
                        "fingerprint": "atomic_v1_b888281a9ae35909c9d8f99a4426e2c3e20426147423bc65434f4ae527995bdd"
                    },
                    "type": "belong_to",
                    "properties": {}
                }
            ],
            "properties": {
                "ip_addr_int": 134743044
            },
            "created": null,
            "updated": null
        },
        "compute": {
            "is_service": {
                "decision": {
                    "value": true, // (2)
                    "reason": [ // (3)
                        "related_to_service",
                        "is_dns_provider",
                        "is_cloud_solution"
                    ],
                    "confidence": "very_high" // (5)
                },
                "context": {
                    "confidence_score": 0.8888888888888888, // (4)
                    "purpose": [ // (6)
                        "dns_provider",
                        "cloud_solution"
                    ],
                    "service": [], // (7)
                    "region": [], // (8)
                    "platform": [ // (9)
                        "Google"
                    ]
                }
            }
        }
    },
    "error": []
}
```

1. Object representation of Atomic node
2. Boolean value `true` indicates that node is related to a service
3. Array of String, indicates why the node is related to a service
4. Float value, confidence score of existing relations with service
5. String ; Confidence of the decision `very_high`, `high`, `medium` or `low`
6. Array of String, Aggregated values of the service purposes
7. Array of String, Aggregated values of the service name
8. Array of String, Aggregated values of the service region
9. Array of String, Aggregated values of the service platform
