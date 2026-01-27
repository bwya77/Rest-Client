Configure environment variables for the REST Client extension

Add the following to your workspace .vscode/settings.json so the requests in this repo can use the Sherweb API. Replace the placeholder values with your actual credentials:

```json
"rest-client.environmentVariables": {
    "sherweb": {
        "baseUrl": "https://api.sherweb.com",
        "client_id": "YOUR_CLIENT_ID",
        "client_secret": "YOUR_CLIENT_SECRET",
        "ocp_apim_subscription_key": "YOUR_SUBSCRIPTION_KEY",
        "access_token": "YOUR_ACCESS_TOKEN"
    }
}
```

Notes
- Place these settings in the workspace (project) .vscode/settings.json to avoid committing secrets to a shared/global config.
- client_id, client_secret and ocp_apim_subscription_key come from your Sherweb API credentials/portal.
- access_token is typically obtained via the authorization step in this repo (it expires — refresh as needed and update the value).
- When using requests in this repo, reference values with the environment name, e.g.:
    - URL: {{sherweb.baseUrl}}/...
    - Header Authorization: Bearer {{sherweb.access_token}}
    - Header Ocp-Apim-Subscription-Key: {{sherweb.ocp_apim_subscription_key}}
- For long-term automation, consider using a secure secret store or CI secrets instead of storing client_secret/access_token in files.
- If you need help obtaining tokens or adding these settings to your workspace, run the authorization request included in this repo or ask for guidance.