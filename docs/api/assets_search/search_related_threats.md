# :octicons-shield-24: Search related threats

:octicons-beaker-24: Experimental

__Route: `GET /orgs/{slug}/apps/atomics/compute/is-threat/{type}/{atomic}`__

This compute resource is used to get related threats of an Atomic node.

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
```

## Request

*This is an example request to get related threats of a domain*

```http
GET /orgs/{slug}/apps/atomics/compute/is-threat/domain/oldtw.com HTTP/1.1
Host: sailor.riskboard.eu:443
X-Sailor-Token: $TOKEN
```

## Response

``` {.js .annotate}
{
  "status": "ok",
  "data": {
    "atomic": { // (1)
      "type": "domain",
      "atomic": "oldtw.com",
      "fingerprint": "atomic_v1_3cfcde7b62e6bc6e9cfb610a929314d0504477e68f9c8438ae4c20d339b070f7",
      "tlp": "clear",
      "provider": "unknown",
      "confidence": "medium",
      "relations": [
        {
          "type": "children_of",
          "target": {
            "type": "tld",
            "atomic": "com",
            "fingerprint": "atomic_v1_d2a2270fbe714969f1fd48cf29802e98b4c19526a97315f4df7c0db083ae7cfe",
            "tlp": "clear",
            "provider": "unknown",
            "confidence": "medium",
            "relations": [],
            "properties": {},
            "created": "2022-12-19T15:47:51.156224Z",
            "updated": "2022-12-19T15:47:51.156256Z"
          },
          "properties": {}
        }
      ],
      "properties": {
        "domain": "oldtw",
        "name": "oldtw"
      },
      "created": "2022-12-19T15:47:51.156224Z",
      "updated": "2022-12-19T15:47:51.156256Z"
    },
    "compute": {
      "is_threat": {
        "decision": {
          "value": true, // (2)
          "reason": [ // (3)
            "child_connection",
            "malware_hosting",
            "moderate_threat"
          ],
          "confidence": "medium" // (5)
        },
        "context": {
          "threats": [ // (6)
            {
              "indicator": { // (7)
                "type": "url",
                "atomic": "https://oldtw.com/pim/index.php?qbot.zip",
                "fingerprint": "atomic_v1_770feb46ce22e58233c86675222b6aadd8a085696cb300a31862ad8b75ae4a14"
              },
              "threat": "malware_hosting", // (8)
              "confidence": "very_high",
              "reason": "reported as malware_download (BB06,iso,NG11,Qakbot,qbot,Quakbot,TR,zip) by Cryptolaemus1",
              "first_seen": "2022-11-17T20:13:47.529354Z",
              "last_seen": "2022-11-17T20:13:47.529359Z",
              "algorithm": "child_connection",
              "metrics": { // (9)
                "active_days": 0,
                "last_seen_days": 32,
                "freshness": 0.95,
                "reliability": 1.0,
                "hops": 3,
                "algorithm_weight": 0.5,
                "global_score": 0.27222222222222225
              }
            }
          ],
          "score": 0.27222222222222225 // (4)
        }
      }
    }
  },
  "error": []
}
```

1. Object representation of Atomic node
2. Boolean value `true` indicates that node is related to threats
3. Array of String, indicates why the node is related to threats
4. Float value, confidence score of existing relations with threats (computed with `global_score` field of each threat)
5. String ; Confidence of the decision `very_high`, `high`, `medium` or `low`
6. Array of Object, each object represents a threat related to the Atomic node
7. Object, object representation of indicator node involved in the decision
8. String, threat name of the indicator
9. Object, metrics of the threat, used in the `global_score` field to compute the confidence score of the decision
