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

. $PSScriptRoot/../Documents.build.shared.ps1

task clean {
	Remove-BuildItem $DestinationDocumentPath, $PreprocessedDocumentPath;
};

task 'ОРД ФБУ Ивановский ЦСМ v3.ott' {
	Invoke-Build BuildTemplate -File "$SourceTemplatesPath/ОРД ФБУ Ивановский ЦСМ v3.ott/ОРД.build.ps1" @parameters;
};

openDocument 'BuildDoc-Методика поверки.odt' `
	-LiteralPath "$SourceDocumentPath/Методика поверки.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Методика поверки.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Методика поверки.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Методика поверки.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v3.ott';

openDocument 'BuildAndOpenDoc-Методика поверки.odt' `
	-OpenAfterBuild `
	-LiteralPath "$SourceDocumentPath/Методика поверки.odt" `
	-PreprocessedPath "$PreprocessedDocumentPath/Методика поверки.odt" `
	-LibrariesPath $DestinationLibrariesPath `
	-TemplatesPath $PreprocessedTemplatesPath `
	-Version $Version `
	-Inputs @( Get-ChildItem -Path "$SourceDocumentPath/Методика поверки.odt" -File -Recurse -Exclude $MarkerFileName ) `
	-Outputs @( "$DestinationDocumentPath/Методика поверки.odt", "$DestinationDocumentPath/$MarkerFileName" ) `
	-Jobs 'ОРД ФБУ Ивановский ЦСМ v3.ott';

task BuildDoc 'BuildDoc-Методика поверки.odt';

task BuildAndOpenDoc 'BuildAndOpenDoc-Методика поверки.odt';

task . BuildDoc;
