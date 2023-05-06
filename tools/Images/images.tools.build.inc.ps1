# Copyright © 2020 Sergei S. Betke

#Requires -Version 5.0
#Requires -Modules InvokeBuild

Set-StrictMode -Version Latest;


. $PSScriptRoot/../nuget/nuget.build.inc.ps1;

[System.String] $ImagesToolsPackagesConfig = ( Join-Path -Path $PSScriptRoot -ChildPath 'packages.config' );
[System.String[]] $ImagesToolsLibFiles = @(
	Select-Xml -LiteralPath $ImagesToolsPackagesConfig `
		-XPath 'packages/package' `
	| Select-Object -ExpandProperty Node `
	| ForEach-Object {
		"$PSScriptRoot/packages/$( $_.id ).$( $_.version )/lib/$( $_.targetFramework )/$( $_.id ).dll"
	}
);

task images-tools `
	-Inputs @( $ImagesToolsPackagesConfig ) `
	-Outputs $ImagesToolsLibFiles `
	-Jobs nuget, {

	. $NuGetPath restore $ImagesToolsPackagesConfig -PackagesDirectory "$PSScriptRoot/packages";

	foreach ( $packageFile in $Outputs )
	{
		if ( -not ( Test-Path -Path $packageFile ) )
		{
			Write-Error "Не удалось установить требуемый файл '$packageFile'.";
		};
		& $PSScriptRoot/../build/Update-FileLastWriteTime.ps1 -LiteralPath $packageFile;
	};

};

task clean-images-tools {};

task distclean-images-tools clean-images-tools, {
	Remove-BuildItem $NuGetLocalPath;
};

task maintainer-clean-images-tools distclean-images-tools;

task pre-build-images-tools images-tools;
