You need to set the following environment variables in your `settings.json` file for these requests to work:
```json
"rest-client.environmentVariables": {
    "connectwise-prod": {
        "baseUrl": "https://COMPANY.COM/v4_6_release/apis/3.0",
        "publicKey": "PUBLICKEY",
        "privateKey": "PRIVATEKEY",
        "companyid": "COMPANYID",
        "clientid": "CLIENTID"
    }
}
```