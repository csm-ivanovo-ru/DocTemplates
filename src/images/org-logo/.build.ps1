# Copyright © 2020 Sergei S. Betke

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

. $PSScriptRoot/../../common.build.shared.ps1;
. $PSScriptRoot/../../../tools/images/images.tools.build.inc.ps1;

task clean clean-images-tools, {
};

task distclean clean, distclean-images-tools;

task maintainer-clean distclean, maintainer-clean-images-tools, {
	Remove-BuildItem $PSScriptRoot/*.png;
};

foreach ( $FileId in @( 'org-logo' ) )
{
	$SVGFileName = "$FileId.svg";
	$DestSVGFileName = "$PSScriptRoot/$SVGFileName";

	$PNGFileName = "$FileId.png";
	$DestPNGFileName = "$PSScriptRoot/$PNGFileName";

	task $PNGFileName `
		-Outputs @( $DestPNGFileName ) `
		-Inputs @( $DestSVGFileName ) `
		-Before emblems `
		-Job pre-build-images-tools, {
		$DestinationPNGFile = $Outputs[0];
		$SourceSVGFile = $Inputs[0];
		Write-Verbose "Convert `"$SourceSVGFile`" to `"$DestinationPNGFile`"";
		& $PSScriptRoot/../../../tools/images/ConvertTo-MonochromePNG.ps1 -LiteralPath $SourceSVGFile -Destination $DestinationPNGFile -Force `
			-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
			-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );
	};

};

task emblems;

task . emblems;
