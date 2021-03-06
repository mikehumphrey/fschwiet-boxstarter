try {

    Update-ExecutionPolicy RemoteSigned
#    Install-WindowsUpdate -AcceptEula
    Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
    Set-TaskbarSmall
    Enable-RemoteDesktop

#    cinst nuget.commandline
#    cinst fiddler
    cinst keepassx
    cinst console-devel
#    cinst sublimetext2
    cinst Atom
    cinst googlechrome
    cinst windirstat
    cinst sysinternals
#    cinst NugetPackageExplorer
#    cinst windbg
#    cinst virtualclonedrive

    #Install-ChocolateyPackage 'HW Monitor' 'exe' '/silent' 'ftp://ftp.cpuid.com/hwmonitor/hwmonitor_1.22-64bit.exe'

    cinst git
    cinst git-credential-winstore
    cinst poshgit

    cinst curl
    cinst putty
#    cinst VirtualBox
    cinst WinMerge
    cinst 7zip
    cinst sumatrapdf

    cinst IIS-WebServerRole -source windowsfeatures
    cinst IIS-HttpCompressionDynamic -source windowsfeatures
    cinst IIS-ManagementScriptingTools -source windowsfeatures
    cinst IIS-WindowsAuthentication -source windowsfeatures
    cinst IIS-BasicAuthentication -source windowsfeatures
    cinst IIS-ASPNET -source windowsfeatures
    cinst IIS-ASPNET45 -source windowsfeatures
    cinst IIS-ManagementConsole -source windowsfeatures

    #cinst aspnetmvc -version 2.0
    #cinst aspnetmvc -version 3.0

#    $atomDir = "$env:programfiles\Atom"

    Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"
    Install-ChocolateyPinnedTaskBarItem "C:\ProgramData\chocolatey\bin\atom.exe"
    Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Google\Chrome\Application\chrome.exe"

    Install-ChocolateyFileAssociation ".txt" "C:\ProgramData\chocolatey\bin\atom.exe"

    # if(!(Test-Path("$sublimeDir\data")){mkdir "$sublimeDir\data"}
    # copy-item (Join-Path (Get-PackageRoot($MyInvocation)) 'sublime\*') -Force -Recurse "$sublimeDir\data"
    # move-item "$sublimeDir\data\Pristine Packages\*" -Force "$sublimeDir\Pristine Packages"

    copy-item (Join-Path (Get-PackageRoot($MyInvocation)) 'console.xml') -Force $env:appdata\console\console.xml

    Write-ChocolateySuccess 'MEA_BoxstarterCore'

} catch {
  Write-ChocolateyFailure 'MEA_BoxstarterCore' $($_.Exception.Message)
  throw
}
