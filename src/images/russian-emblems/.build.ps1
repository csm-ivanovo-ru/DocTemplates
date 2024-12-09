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

. $PSScriptRoot/../../common.build.shared.ps1

task clean {
	Remove-BuildItem $PSScriptRoot/*.zip;
};

task distclean clean;

task maintainer-clean distclean, {
	Remove-BuildItem $PSScriptRoot/*.svg, $PSScriptRoot/*.png;
};

[System.String] $ImagesToolsPackagesConfig = Join-Path -Path $ImagesToolsPath -ChildPath 'packages.config';
[System.String[]] $OutputLibFiles = @(
	Select-Xml -LiteralPath $ImagesToolsPackagesConfig `
		-XPath 'packages/package' `
	| Select-Object -ExpandProperty Node `
	| ForEach-Object {
		"$ImagesToolsPath/packages/$( $_.id ).$( $_.version )/lib/$( $_.targetFramework )/$( $_.id ).dll"
	}
);

task Images-tools `
	-Inputs @( $ImagesToolsPackagesConfig ) `
	-Outputs $OutputLibFiles `
	-Jobs nuget, {

	. $NuGetPath restore $ImagesToolsPackagesConfig -PackagesDirectory "$ImagesToolsPath/packages";

	foreach ( $packageFile in $Outputs )
	{
		if ( -not ( Test-Path -Path $packageFile ) )
		{
			Write-Error "Не удалось установить требуемый файл '$packageFile'.";
		};
		& $UpdateFileLastWriteTimePath -LiteralPath $packageFile;
	};

};

foreach ( $FileId in 'emblem_black_bordered', 'emblem_black' )
{
	$SVGFileName = "$FileId.svg";
	$DestSVGFileName = "$PSScriptRoot/$SVGFileName";

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
		-Job $SVGFileName, Images-tools, {
		$DestinationPNGFile = $Outputs[0];
		$SourceSVGFile = $Inputs[0];
		Write-Verbose "Convert `"$SourceSVGFile`" to `"$DestinationPNGFile`"";
		& $ConvertToPNGPath -LiteralPath $SourceSVGFile -Destination $DestinationPNGFile -Force `
			-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
			-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );
	};

};

task emblems;

task . emblems;