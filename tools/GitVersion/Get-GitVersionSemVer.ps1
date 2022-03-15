# Copyright © 2022 Sergei S. Betke

#Requires -Version 5.0

<#
	.SYNOPSIS
		Search and execute GitVersion, return current project semantic version
#>
[CmdletBinding( ConfirmImpact = 'Low' )]
[OutputType([System.Void])]

Param()

Set-StrictMode -Version Latest;
$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop;

[System.String] $GitVersionPath = (
	Select-Xml -LiteralPath "$PSScriptRoot/packages.config" `
		-XPath 'packages/package[ @id = "GitVersion.CommandLine" ]' |
	Select-Object -ExpandProperty Node -First 1 |
	ForEach-Object {
		"$PSScriptRoot/packages/$( $_.id ).$( $_.version )/tools/gitversion.exe"
	} |
	Resolve-Path
).Path;

[System.String] $ProjectVersion = ( . $GitVersionPath /output json /showvariable SemVer );

return $ProjectVersion;
