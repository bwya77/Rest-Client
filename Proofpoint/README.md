You need to set the following environment variables in your `settings.json` file for these requests to work:
```json
"rest-client.environmentVariables": {
    "proofpoint": {
        "baseUrl": "https://us1.proofpointessentials.com/api/v1/orgs/DOMAIN.COM",
        "user": "USERNAME",
        "password": "PASSWORD",
    }
}
```