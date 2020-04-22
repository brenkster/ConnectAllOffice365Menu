function Show-Menu

{
    param ([string]$Title = 'Choose your Connection')
    Clear-Host

Write-Host "================ PowerShell Module Options ================"
 
Write-Host "1: Press '1' to connect to Exchange Online."
Write-Host "2: Press '2' to connect to MSOL."
Write-Host "3: Press '3' to connect to AzureAD."
Write-Host "4: Press '4' to connect to Microsoft Teams."
Write-Host "5: Press '5' to connect to SharePoint Online."
Write-Host "6: Press '6' to connect to MSGraph."
Write-Host "7: Press '7' to connect to SkypeOnline."
Write-Host "8: Press '8' to connect to MSCommerce."
Write-Host "9: Press '9' to connect to AIP (Azure Information Protection)."
Write-Host "11: Press '11' to install the ExchangeOnlineManagement module."
Write-Host "12: Press '12' to install the MSOnline module."
Write-Host "13: Press '13' to install the AzureAD module."
Write-Host "14: Press '14' to install the Microsoft Temas module."
Write-Host "15: Press '15' to install SharePoint Online module."
Write-Host "16: Press '16' to install the Microsoft Graph module."
Write-Host "17: Press '17' to install the PowerShell Gallery repository."
Write-Host "18: Press '18' to install the MSCommerce Module."
Write-Host "19: Press '19' to install AIPService module."
Write-Host "20: Press '20' to install Visual Studo C++ 2019."

Write-Host "Q: Press 'Q' to quit."
Write-host "`n"
}

DO
{
Show-Menu –Title 'My Menu'

$input = Read-Host "Please make a selection"

switch ($input)
     {
    '1' {import-module ExchangeOnlineManagement
        Connect-ExchangeOnline -UserPrincipalName username@domain.com -ShowProgress $true}
    
    '2' {Import-Module MSOnline
        Connect-MsolService}
        
    '3' {Import-Module AZ
        Connect-AzureAD}

    '4' {Import-Module MicrosoftTeams
        Connect-MicrosoftTeams}

    '5' {Import-Module Microsoft.Online.SharePoint.PowerShell -Verbose
        Connect-SPOService -Url https://tenantname-admin.sharepoint.com}

    '6' {Import-Module Microsoft.Graph.Intune
        Connect-MSGraph}

    '7' {Import-Module SkypeOnlineConnector
        $sfboSession = New-CsOnlineSession -UserName "username@domain.com" -OverrideAdminDomain tenantname.onmicrosoft.com
        Import-PSSession $sfboSession}

    '8' {Import-Module -Name MSCommerce
         Connect-MSCommerce}

    '9' {Import-module AIPService
        Connect-AIPService}
    
    '11' {Install-Module -Name ExchangeOnlineManagement -Force -AcceptLicense}

    '12' {Install-Module -Name MSOnline -Force}

    '13' {Install-Module -Name AZ -Force}

    '14' {Install-Module -Name MicrosoftTeams -Force}

    '15' {Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Force}

    '16' {Install-Module -Name Microsoft.Graph.Intune -Force}

    '17' {Install-Module PowershellGet -Force}

    '18' {Install-Module -Name MSCommerce -Force}
    
    '19' {$VisualStudio2017x64URL = "https://download.visualstudio.microsoft.com/download/pr/11687625/2cd2dba5748dc95950a5c42c2d2d78e4/VC_redist.x64.exe"            
         Write-Host "Downloading VisualStudio 2017 C++ from $VisualStudio2017x64"             
                
    $DestinationFolder = "C:\Temp"            
                
    Invoke-WebRequest -Uri $VisualStudio2017x64URL -OutFile "$DestinationFolder\VC_redist.x64.exe" -ErrorAction STOP            
                
    Write-Host "Attempting to install VisualStudio 2017 C++, a reboot is required!"            
                 
    Start-Process "$DestinationFolder\VC_redist.x64.exe" -ArgumentList "/passive /norestart" -Wait            
                
    Write-Host "Attempting to install VisualStudio 2017 C++"}

    '20' {Install-module AIPService -Force}

    'q' {EXIT}
     }
pause
}
until ($input -eq 'q')
