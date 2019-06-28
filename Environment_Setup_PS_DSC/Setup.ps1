. .\DscResources\General.ps1
. .\DscResources\Java.ps1
. .\DscResources\Docker.ps1
. .\DscResources\Network.ps1
. .\DscResources\DotNet.ps1

Configuration Setup
{
    param( [string[]] $Nodes, [bool] $Install = $true)

    Import-DscResource -ModuleName 'cChoco'

    Node $Nodes
    {
          cChocoInstaller installChoco
          {
            InstallDir = "c:\ProgramData\chocolatey"
          }

          GeneralTools -Install $Install
          JavaEnv -Install $Install
		  Docker -Install $Install
		  Network -Install $Install
          DotNetEnv -Install $Install
    }
}

Setup -OutputPath 'C:\Users\PLMIMAR2\Documents\DSC' -Nodes 'localhost' -Install $true