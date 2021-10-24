﻿# Copyright © 2020 Sergei S. Betke

#Requires -Version 5.0
#Requires -Modules InvokeBuild

param(
	[Parameter( Position = 0 )]
	[System.String[]]
	$Tasks
)

Set-StrictMode -Version Latest;
$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop;

$parameters = $PSBoundParameters;

if ( [System.IO.Path]::GetFileName( $MyInvocation.ScriptName ) -ne 'Invoke-Build.ps1' )
{
	Invoke-Build -Task $Tasks -File $MyInvocation.MyCommand.Path @parameters;
	return;
};

. $PSScriptRoot/../common.build.shared.ps1

New-BuildSubTask -Tasks Clean, BuildLib, BuildLibContainer -Path $SourceLibrariesPath;

task Clean {
	Remove-BuildItem $DestinationLibrariesPath, $DestinationLibContainersPath;
};

task BuildLibs BuildLib;
task BuildLibContainers BuildLibContainer;
task . BuildLibs, BuildLibContainers;