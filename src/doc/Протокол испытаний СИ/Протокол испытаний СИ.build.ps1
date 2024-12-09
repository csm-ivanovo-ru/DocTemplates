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

openDocument 'BuildDoc-Протокол испытаний СИ.odt' `
	-LiteralPath "$SourceDocumentPath/Протокол испытаний СИ.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Протокол испытаний СИ.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Протокол испытаний СИ.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Протокол испытаний СИ.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v3.ott';

openDocument 'BuildAndOpenDoc-Протокол испытаний СИ.odt' `
	-OpenAfterBuild `
	-LiteralPath "$SourceDocumentPath/Протокол испытаний СИ.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Протокол испытаний СИ.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Протокол испытаний СИ.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Протокол испытаний СИ.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v3.ott';

task BuildDoc 'BuildDoc-Протокол испытаний СИ.odt';

task BuildAndOpenDoc 'BuildAndOpenDoc-Протокол испытаний СИ.odt';

task . BuildDoc;
