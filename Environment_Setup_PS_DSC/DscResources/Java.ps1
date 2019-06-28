Configuration JavaEnv
{
    param([bool] $Install = $true)

    Import-DscResource -ModuleName 'cChoco'

    [string] $ensure = 'Present'
    if($Install -ne $true)
    {
        $ensure = 'Absent'
    }

    cChocoPackageInstaller InstallJdk8
    {
       Name = "jdk8"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }
    
    cChocoPackageInstaller InstallMaven
    {
       Name = "maven"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }
    
    
    cChocoPackageInstaller InstallIntellijidea
    {
       Name = "intellijidea-community"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller InstallGroovy
    {
       Name = "groovy"
       DependsOn = "[cChocoInstaller]InstallChoco"
       Ensure = $ensure
    }
}
