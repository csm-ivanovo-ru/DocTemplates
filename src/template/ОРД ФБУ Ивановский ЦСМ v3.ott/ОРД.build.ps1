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

. $PSScriptRoot/../OpenDocumentTemplates.build.shared.ps1

task clean {
	Remove-BuildItem $DestinationTemplatePath, $PreprocessedTemplatePath;
};

task BuildLib-DocTemplatesLib {
	Invoke-Build BuildLib -File $SourceLibrariesPath/DocTemplatesLib/DocTemplatesLib.build.ps1 @parameters;
};

task Build-rustest.spb.ru.png {
	Invoke-Build Build-rustest.spb.ru.png -File $SourceURIsPath/QRCodes.URI.build.ps1 @parameters;
};

task rustest.spb.ru.png `
	-Inputs @( "$DestinationQRCodesURIPath/rustest.spb.ru.png" ) `
	-Outputs @( "$SourceTemplatePath/Pictures/org-qr.png" ) `
	-Jobs Build-rustest.spb.ru.png, {
	Copy-Item -LiteralPath $Inputs[0] -Destination $Outputs[0] -Force `
		-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true );
};

task Build-russian_emblem.png {
	Invoke-Build emblem_black_bordered.png -File $RussiaEmblemPath/.build.ps1 @parameters;
};

task russian_emblem.png `
	-Inputs @( "$RussiaEmblemPath/emblem_black_bordered.png" ) `
	-Outputs @( "$SourceTemplatePath/Pictures/russian_emblem.png" ) `
	-Jobs Build-russian_emblem.png, {
	Copy-Item -LiteralPath $Inputs[0] -Destination $Outputs[0] -Force `
		-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true );
};

task Build-org-logo.png {
	Invoke-Build org-logo.png -File $OrgLogoPath/.build.ps1 @parameters;
};

task org_logo.png `
	-Inputs @( "$OrgLogoPath/org-logo.png" ) `
	-Outputs @( "$SourceTemplatePath/Pictures/org-logo.png" ) `
	-Jobs Build-org-logo.png, {
	Copy-Item -LiteralPath $Inputs[0] -Destination $Outputs[0] -Force `
		-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true );
};

openDocumentTemplate BuildTemplate `
	-LiteralPath $SourceTemplatePath `
	-PreprocessedPath $PreprocessedTemplatePath `
	-LibrariesPath $DestinationLibrariesPath `
	-Version $Version `
	-Inputs $sources `
	-Outputs @( $DestinationTemplatePath, $marker ) `
	-Jobs BuildLib-DocTemplatesLib, rustest.spb.ru.png, russian_emblem.png, org_logo.png;

openDocumentTemplate BuildAndOpenTemplate `
	-OpenAfterBuild `
	-LiteralPath $SourceTemplatePath `
	-PreprocessedPath $PreprocessedTemplatePath `
	-LibrariesPath $DestinationLibrariesPath `
	-Version $Version `
	-Inputs $sources `
	-Outputs @( $DestinationTemplatePath, $marker ) `
	-Jobs BuildLib-DocTemplatesLib, rustest.spb.ru.png, russian_emblem.png, org_logo.png;

task . BuildTemplate;
