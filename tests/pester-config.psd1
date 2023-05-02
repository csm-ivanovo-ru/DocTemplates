# You can see the predefined Pester settings here:
# https://pester.dev/docs/commands/Invoke-Pester
@{
	Run = @{
		Exit = $true;
	};
	Debug = @{
		ShowFullErrors = $false;
	};
	Output = @{
		Verbosity = 'Detailed';
		CIFormat = 'GitHubActions';
	};
	TestResult = @{
		OutputFormat = 'JUnitXml';
		OutputPath = 'tests/results.xml';
		Enabled = $true;
	};
}
