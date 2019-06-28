Configuration Docker
{
    param([bool] $Install = $true)

    Import-DscResource -ModuleName 'cChoco'

    [string] $ensure = 'Present'
    if($Install -ne $true)
    {
        $ensure = 'Absent'
    }

    cChocoPackageInstaller InstallDocker
    {
       Name = "docker-desktop"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }
}
