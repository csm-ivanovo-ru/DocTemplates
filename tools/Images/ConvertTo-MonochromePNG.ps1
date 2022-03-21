# Copyright © 2020 Sergei S. Betke

#Requires -Version 5.0

<#
	.SYNOPSIS
		Convert source image to monochrome PNG file

	.DESCRIPTION
		Convert source image to monochrome PNG file
#>
[CmdletBinding( ConfirmImpact = 'Low', SupportsShouldProcess = $true, DefaultParameterSetName = 'Path' )]
[OutputType([System.Void])]

Param(

	# Specifies a path to one or more location of source image. Wildcards are permitted.
	[Parameter(
		Mandatory = $true,
		Position = 0,
		ParameterSetName = 'Path',
		ValueFromPipeline = $true,
		ValueFromPipelineByPropertyName = $true,
		HelpMessage = 'Specifies a path to one or more location of source image. Wildcards are permitted.' )]
	[ValidateNotNullOrEmpty()]
	[SupportsWildcards()]
	[System.String[]]
	$Path,

	# Specifies a path to one location of source image.
	# Unlike the Path parameter, the value of the LiteralPath parameter is
	# used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters,
	# enclose it in single quotation marks. Single quotation marks tell Windows PowerShell not to interpret any
	# characters as escape sequences.
	[Parameter(
		Mandatory = $true,
		Position = 0,
		ParameterSetName = 'LiteralPath',
		ValueFromPipelineByPropertyName = $true,
		HelpMessage = 'Literal path to one location of source image.')]
	[Alias('PSPath')]
	[ValidateNotNullOrEmpty()]
	[System.String]
	$LiteralPath,

	# Specifies a path to destination PNG file.
	# The value of the Destination parameter is
	# used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters,
	# enclose it in single quotation marks. Single quotation marks tell Windows PowerShell not to interpret any
	# characters as escape sequences.
	[Parameter(
		Mandatory = $true,
		Position = 1,
		ValueFromPipelineByPropertyName = $true,
		HelpMessage = 'Literal path to to destination PNG file.' )]
	[System.String] $Destination,

	[Parameter( Mandatory = $False )]
	[System.Int16]
	$Width = 1,

	[Switch]
	$Force
)

begin
{
	Set-StrictMode -Version Latest;
	$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop;

	$CorePackage = ( Select-Xml -Path "$PSScriptRoot/packages.config" -XPath "packages/package[ @id = 'Magick.NET.Core' ]" ).Node;
	$Package = ( Select-Xml -LiteralPath "$PSScriptRoot/packages.config" -XPath "packages/package[ @id = 'Magick.NET-Q8-AnyCPU' ]" ).Node;

	$CorePackageLib = ( Resolve-Path -Path "$PSScriptRoot/packages/$( $CorePackage.id ).$( $CorePackage.version )/lib/$( $CorePackage.targetFramework )/$( $CorePackage.id ).dll" ).Path;
	Add-Type -Path $CorePackageLib `
		-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
		-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );
	$PackageLib = ( Resolve-Path -Path "$PSScriptRoot/packages/$( $Package.id ).$( $Package.version )/lib/$( $Package.targetFramework )/$( $Package.id ).dll" ).Path;
	Add-Type -Path $PackageLib `
		-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
		-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );

	if ( [Environment]::Is64BitProcess )
	{
		$LibEdition = 'win-x64';
	}
	else
	{
		$LibEdition = 'win-x86';
	};
	$PackageNativeLibPath = ( Resolve-Path -Path "$PSScriptRoot/packages/$( $Package.id ).$( $Package.version )/runtimes/$LibEdition/native" ).Path;
	[ImageMagick.MagickNET]::SetNativeLibraryDirectory( $PackageNativeLibPath );
	[ImageMagick.MagickNET]::Initialize();
}
process
{
	Set-StrictMode -Version Latest;
	$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop;

	if ( $PSCmdlet.ParameterSetName -eq 'Path' )
	{
		$parameters = $PSCmdlet.MyInvocation.BoundParameters;
		$null = $parameters.Remove( 'Path' );
		$Path | Resolve-Path | Select-Object -ExpandProperty Path | ForEach-Object {
			& $PSCmdlet.MyInvocation.MyCommand -LiteralPath $_ @parameters;
		};
	}
	elseif ( $PSCmdlet.ParameterSetName -eq 'LiteralPath' )
	{
		[System.String] $ResolvedDestination = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath( $Destination );
		if ( ( Test-Path -LiteralPath $ResolvedDestination ) )
		{
			if ( $Force )
			{
				Remove-Item -LiteralPath $ResolvedDestination `
					-Verbose:( $PSCmdlet.MyInvocation.BoundParameters['Verbose'] -eq $true ) `
					-Debug:( $PSCmdlet.MyInvocation.BoundParameters['Debug'] -eq $true );
			}
			else
			{
				Write-Error "The destination file `"$ResolvedDestination`" exists, but the Force parameter is omitted.";
			};
		};
		if ( $PSCmdlet.ShouldProcess( $LiteralPath, 'Convert to PNG' ) )
		{
			[ImageMagick.MagickImage] $Image = [ImageMagick.MagickImage]::new();
			try
			{
				$ImageReaderSettings = [ImageMagick.MagickReadSettings]::new();
				$ImageReaderSettings.Density = [ImageMagick.Density]::new( 600 );
				$ImageReaderSettings.Width = 600;

				Write-Verbose "Read '$LiteralPath'";
				$Image.Read( $LiteralPath, $ImageReaderSettings );

				Write-Verbose "Convert to PNG...";
				$Image.Format = [ImageMagick.MagickFormat]::Png;
				Write-Verbose "Transform image to monochrome...";
				# $Image.Transparent( [ImageMagick.MagickColor]::new( 0xFF, 0xFF, 0xFF ) );
				$Image.ColorType = [ImageMagick.ColorType]::Bilevel;
				Write-Verbose "Change image density...";
				$Image.Density = [ImageMagick.Density]::new( 600 );

				if ( $PSCmdlet.ShouldProcess( $ResolvedDestination, 'Write destination image' ) )
				{
					$Image.Write( $ResolvedDestination );
				};
			}
			finally
			{
				$Image.Dispose();
			}
		};
	};
}
