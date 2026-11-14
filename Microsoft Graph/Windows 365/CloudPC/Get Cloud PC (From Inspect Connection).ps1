<#
.SYNOPSIS
    Authenticates against the undocumented Windows 365 (CloudPC) first-party API
    and retrieves details for a given Cloud PC.

.DESCRIPTION
    Uses MSAL.PS to request a delegated access token (scope: EndUser.Access) for
    the Windows 365 IW Service resource (aud: 7c0a6aea-533c-458c-9f81-15568f10f6e4),
    using a custom app registration ("W365-CLI-PowerShell") that has been granted
    admin consent for that resource/scope. Then calls the CloudPC API with the
    resulting bearer token.

.PARAMETER CloudPcId
    The Cloud PC GUID to look up. Defaults to the one used during setup.

.PARAMETER TenantId
    Entra tenant ID. Defaults to the windowsfromanywhere.com tenant.

.PARAMETER ClientId
    App registration (public client) ID used to request the token.
    Must have delegated EndUser.Access permission + admin consent granted
    against the Windows 365 resource (7c0a6aea-533c-458c-9f81-15568f10f6e4).

.EXAMPLE
    .\Get-W365CloudPC.ps1
    .\Get-W365CloudPC.ps1 -CloudPcId "95194d88-cec5-4b65-af62-26dbd1814364" -TenantID "ecf660db-ffc4-4d26-b980-29e0dc12189e"
#>
[CmdletBinding()]
param(
    [string]$CloudPcId = "",
    [string]$TenantId  = "",
    [string]$ClientId  = "14562271-779b-429b-9b98-10a1d5758df3",
    [string]$Resource  = "7c0a6aea-533c-458c-9f81-15568f10f6e4"
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Module -ListAvailable MSAL.PS)) {
    Write-Host "Installing MSAL.PS..." -ForegroundColor Yellow
    Install-Module MSAL.PS -Scope CurrentUser -Force
}
Import-Module MSAL.PS

Write-Host "Requesting token for Windows 365 resource..." -ForegroundColor Cyan
$token = Get-MsalToken -ClientId $ClientId `
    -TenantId $TenantId `
    -Scopes "$Resource/.default" `
    -Interactive `
    -UseEmbeddedWebView:$false `
    -RedirectUri "http://localhost"

if (-not $token.AccessToken) {
    throw "Failed to acquire access token."
}

$headers = @{ Authorization = "Bearer $($token.AccessToken)" }
$uri = "https://windows365.microsoft.com/u/api/v1/cloudPCs/$CloudPcId"

Write-Host "Calling $uri ..." -ForegroundColor Cyan
$result = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

$result | ConvertTo-Json -Depth 10
