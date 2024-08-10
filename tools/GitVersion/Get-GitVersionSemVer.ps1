# Copyright © 2020 Sergei S. Betke

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

[System.String] $ProjectVersion = ( . npx absolute-version --tagGlob "[0-9]*");

return $ProjectVersion;
