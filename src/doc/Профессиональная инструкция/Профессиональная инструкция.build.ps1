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

. $PSScriptRoot/../Documents.build.shared.ps1

task clean {
	Remove-BuildItem $DestinationDocumentPath, $PreprocessedDocumentPath;
};

task 'ОРД ФБУ Ивановский ЦСМ v2.ott' {
	Invoke-Build BuildTemplate -File "$SourceTemplatesPath/ОРД ФБУ Ивановский ЦСМ v2.ott/ОРД.build.ps1" @parameters;
};

openDocument 'BuildDoc-Профессиональная инструкция.odt' `
	-LiteralPath "$SourceDocumentPath/Профессиональная инструкция.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Профессиональная инструкция.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Профессиональная инструкция.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Профессиональная инструкция.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v2.ott';

openDocument 'BuildAndOpenDoc-Профессиональная инструкция.odt' `
	-OpenAfterBuild `
	-LiteralPath "$SourceDocumentPath/Профессиональная инструкция.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Профессиональная инструкция.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Профессиональная инструкция.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Профессиональная инструкция.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v2.ott';

task BuildDoc 'BuildDoc-Профессиональная инструкция.odt';

task BuildAndOpenDoc 'BuildAndOpenDoc-Профессиональная инструкция.odt';

task . BuildDoc;
