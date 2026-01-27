# Rest-Client

A collection of REST API request templates for the [VS Code REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) extension.

## Supported Services

| Service | Requests | Description |
|---------|----------|-------------|
| Connectwise Manage | 43 | IT service management - companies, tickets, projects, sales |
| Microsoft Graph | 26 | Microsoft 365 - users, groups, tenant administration |
| Bitwarden | 4 | Password management - groups, members, organization |
| Proofpoint | 3 | Email security - user management |
| Cloudflare | 1 | CDN analytics via GraphQL |
| Sherweb | 1 | Cloud service provider API |

## Requirements

- [VS Code](https://code.visualstudio.com/)
- [REST Client Extension](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)

## Setup

1. Install the REST Client extension in VS Code
2. Create a `.vscode/settings.json` file in your workspace with your credentials:

**Note:**: Depending on which services you plan to use, you may not need to include all environment variables shown below. Some `.http` files may require only a subset of these variables.

```json
{
  "rest-client.environmentVariables": {
    "connectwise": {
      "baseUrl": "https://YOUR-COMPANY.connectwise.com/v4_6_release/apis/3.0",
      "publicKey": "YOUR_PUBLIC_KEY",
      "privateKey": "YOUR_PRIVATE_KEY",
      "companyid": "YOUR_COMPANY_ID",
      "clientid": "YOUR_CLIENT_ID"
    },
    "msgraph": {
      "tenantId": "YOUR_TENANT_ID",
      "clientId": "YOUR_CLIENT_ID",
      "clientSecret": "YOUR_CLIENT_SECRET"
    }
  }
}
```

1. Open any `.http` file and click "Send Request" above the request

## Usage

Each `.http` file contains one or more API requests. Variables use the `{{variableName}}` syntax and are loaded from your environment settings.

See the README files in each service folder for specific setup instructions.

## License

MIT
