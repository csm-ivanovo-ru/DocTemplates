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

task 'ОРД ФБУ Ивановский ЦСМ v3.ott' {
	Invoke-Build BuildTemplate -File "$SourceTemplatesPath/ОРД ФБУ Ивановский ЦСМ v3.ott/ОРД.build.ps1" @parameters;
};

openDocument 'BuildDoc-Справка.odt' `
	-LiteralPath "$SourceDocumentPath/Справка.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Справка.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Справка.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Справка.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v3.ott';

openDocument 'BuildAndOpenDoc-Справка.odt' `
	-OpenAfterBuild `
	-LiteralPath "$SourceDocumentPath/Справка.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Справка.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Справка.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Справка.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v3.ott';

task BuildDoc 'BuildDoc-Справка.odt';

task BuildAndOpenDoc 'BuildAndOpenDoc-Справка.odt';

task . BuildDoc;
