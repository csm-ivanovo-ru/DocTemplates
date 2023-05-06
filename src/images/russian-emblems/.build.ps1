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
	Remove-BuildItem $PSScriptRoot/*.zip;
};

task distclean clean, distclean-images-tools;

task maintainer-clean distclean, maintainer-clean-images-tools, {
	Remove-BuildItem $PSScriptRoot/*.svg, $PSScriptRoot/*.png;
};


foreach ( $FileId in 'emblem_black_bordered', 'emblem_black' )
{
	$SVGFileName = "$FileId/$FileId.svg";
	$DestSVGFileName = "$PSScriptRoot/$FileId.svg";

	task $SVGFileName `
		-Data @{ FileId = $FileId; SVGFileName = $SVGFileName; DestSVGFileName = $DestSVGFileName; } `
		-Outputs @( $DestSVGFileName ) `
		-If { -not ( Test-Path -Path $DestSVGFileName ) } `
		-Job {

		$DestSVGFileName = $Task.Data.DestSVGFileName;
		$ZipFileName = "$( $Task.Data.FileId ).zip";
		$SVGFileName = $Task.Data.SVGFileName;

		$TempZIPFileName = Join-Path `
			-Path ( [System.IO.Path]::GetTempPath() ) `
			-ChildPath ( [System.IO.Path]::GetRandomFileName() );
		$TempZIPFileName = $TempZIPFileName + '.zip';

		Invoke-WebRequest -Uri "http://flag.kremlin.ru/static/pdf/$ZipFileName" -OutFile $TempZIPFileName `
			-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
			-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );

		try
		{
			$TempUnpackedFolder = Join-Path `
				-Path ( [System.IO.Path]::GetTempPath() ) `
				-ChildPath ( [System.IO.Path]::GetRandomFileName() );

			Expand-Archive -Path $TempZIPFileName -DestinationPath $TempUnpackedFolder `
				-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
				-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );

			try
			{
				Copy-Item -LiteralPath "$TempUnpackedFolder/$SVGFileName" -Destination $DestSVGFileName -Force `
					-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
					-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );
			}
			finally
			{
				Remove-Item -Path $TempUnpackedFolder -Recurse `
					-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );
			};

		}
		finally
		{
			Remove-Item -Path $TempZIPFileName `
				-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );
		};

	};

	$PNGFileName = "$FileId.png";
	$DestPNGFileName = "$PSScriptRoot/$PNGFileName";

	task $PNGFileName `
		-Outputs @( $DestPNGFileName ) `
		-Inputs @( $DestSVGFileName ) `
		-Before emblems `
		-Job $SVGFileName, pre-build-images-tools, {
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
