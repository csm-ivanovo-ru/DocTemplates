# Copyright 2020 Sergei S. Betke
@{
	nuget = @{
		DependencyType = 'FileDownload';
		Name = 'nuget.exe';
		Source = 'https://dist.nuget.org/win-x86-commandline/latest/nuget.exe';
		Target = '$DependencyPath\..\nuget\nuget.exe';
	};

	'GitVersion-nuget-packages' = @{
		DependencyType = 'Command';
		Source = '. "$DependencyPath\..\nuget\nuget.exe" restore "$DependencyPath/packages.config" -PackagesDirectory "$DependencyPath/packages" -Source "https://api.nuget.org/v3/index.json" -NonInteractive -UseLockFile;';
		DependsOn = 'nuget';
	};
}
