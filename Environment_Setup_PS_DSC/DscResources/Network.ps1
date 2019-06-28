Configuration Network
{
    param([bool] $Install = $true)

    Import-DscResource -ModuleName 'cChoco'

    [string] $ensure = 'Present'
    if($Install -ne $true)
    {
        $ensure = 'Absent'
    }

    cChocoPackageInstaller InstallWireShark
    {
       Name = "wireshark"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }
}
