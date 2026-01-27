Configure environment variables for the REST Client extension

Add the following to your workspace .vscode/settings.json so the requests in this repo can use the Cloudflare API. Replace the placeholder values with your actual credentials:

```json
"rest-client.environmentVariables": {
    "graphql-cloudflare":{
         "token":"",
         "zonetag":""
      }
}
```

Notes
- Place these settings in the workspace (project) .vscode/settings.json to avoid committing secrets to a shared/global config.
- You can find your zone tag when you log into the portal, it will be located on the right side under API
- Some API endpoints do not support the global API key. You will need to create a API key by going [here](https://dash.cloudflare.com/profile/api-tokens) and creating a new API token.