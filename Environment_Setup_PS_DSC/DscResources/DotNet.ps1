Configuration DotNetEnv
{
    param([bool] $Install = $true)

    Import-DscResource -ModuleName 'cChoco'

    [string] $ensure = 'Present'
    if($Install -ne $true)
    {
        $ensure = 'Absent'
    }

    cChocoPackageInstaller InstallWebpicmd
    {
       Name = "webpicmd"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller InstallAzureCLI
    {
       Name = "azure-cli"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }
    
    Script 'InstallServiceFabricSdk'
    {
        GetScript = "Get-ChildItem 'C:\Program Files\Microsoft SDKs\Service Fabric'"
        SetScript = 'webpicmd.exe /Install /AcceptEula /SuppressReboot /Products:MicrosoftAzure-ServiceFabric-CoreSDK'
        TestScript = "Test-Path 'C:\Program Files\Microsoft SDKs\Service Fabric'"
        DependsOn = '[cChocoPackageInstaller]InstallWebpicmd'
    }

}
