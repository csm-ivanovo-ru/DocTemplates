# Copyright © 2020 Sergei S. Betke

#Requires -Version 5.0
#Requires -Modules InvokeBuild

Set-StrictMode -Version Latest;

[System.String] $NuGetVersion = 'latest';

[System.String] $NuGetLocalPath = ( Join-Path -Path $PSScriptRoot -ChildPath 'nuget.exe' );
[System.String] $NuGetPath = ( Join-Path -Path $PSScriptRoot -ChildPath 'nuget.exe' );

if ( Get-Command 'nuget.exe' -ErrorAction 'SilentlyContinue' )
{
	$NuGetPath = 'nuget.exe';
}
else
{
	$NuGetPath = $NuGetLocalPath;
};


task nuget `
	-If { -not ( Get-Command $NuGetPath -ErrorAction 'SilentlyContinue' ) } `
	-Jobs {
	$NuGetURI = "https://dist.nuget.org/win-x86-commandline/$NuGetVersion/nuget.exe";
	Invoke-WebRequest $NuGetURI -OutFile $NuGetLocalPath `
		-Verbose:( $VerbosePreference -ne [System.Management.Automation.ActionPreference]::SilentlyContinue ) `
		-Debug:( $DebugPreference -ne [System.Management.Automation.ActionPreference]::SilentlyContinue );
	$NuGetPath = $NuGetLocalPath;
	. $NuGetPath sources add -Name 'nuget.org' -Source 'https://api.nuget.org/v3/index.json';
};
