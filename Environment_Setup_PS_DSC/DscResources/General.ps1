Configuration GeneralTools
{
    param([bool] $Install = $true)

    Import-DscResource -ModuleName 'cChoco'

    [string] $ensure = 'Present'
    if($Install -ne $true)
    {
        $ensure = 'Absent'
    }

    cChocoPackageInstaller installChrome
    {
       Name = "googlechrome"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installGit
    {
       Name = "git"
       Params = "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installDitto
    {
       Name = "ditto"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installGitExtensions
    {
       Name = "gitextensions"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installNotepadPlusPlus
    {
       Name = "notepadplusplus"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installManagementStudio
    {
       Name = "sql-server-management-studio"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installKDiff
    {
       Name = "kdiff3"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installRemoteNG
    {
       Name = "mremoteng"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }

    cChocoPackageInstaller installkeePass
    {
       Name = "keepass"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }
	
	cChocoPackageInstaller installVSCode
    {
       Name = "vscode"
       DependsOn = "[cChocoInstaller]installChoco"
       Ensure = $ensure
    }
}