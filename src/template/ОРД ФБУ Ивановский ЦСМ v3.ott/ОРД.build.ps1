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

task Build-org-site.png {
	. npx gulp build:images:URL-QRCodes;
};

task org-site.png `
	-Inputs @( "$DestinationQRCodesURIPath/org-site.png" ) `
	-Outputs @( "$SourceTemplatePath/Pictures/org-site.png" ) `
	-Jobs Build-org-site.png, {
	Copy-Item -LiteralPath $Inputs[0] -Destination $Outputs[0] -Force `
		-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true );
};

task Build-russian_emblem.png {
	. npx gulp build:images;
};

task russian_emblem.png `
	-Inputs @( "$ImagesPNGPath/russian_emblem.png" ) `
	-Outputs @( "$SourceTemplatePath/Pictures/russian_emblem.png" ) `
	-Jobs Build-russian_emblem.png, {
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
	-Jobs BuildLib-DocTemplatesLib, org-site.png, russian_emblem.png, org_logo.png;

openDocumentTemplate BuildAndOpenTemplate `
	-OpenAfterBuild `
	-LiteralPath $SourceTemplatePath `
	-PreprocessedPath $PreprocessedTemplatePath `
	-LibrariesPath $DestinationLibrariesPath `
	-Version $Version `
	-Inputs $sources `
	-Outputs @( $DestinationTemplatePath, $marker ) `
	-Jobs BuildLib-DocTemplatesLib, org-site.png, russian_emblem.png, org_logo.png;

task . BuildTemplate;
