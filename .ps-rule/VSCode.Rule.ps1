Rule 'VSCode.Config' -Type 'PSRule.Data.RepositoryInfo' {
	$Assert.FilePath($TargetObject, 'FullName', @( '.editorconfig' ));
	$Assert.FilePath($TargetObject, 'FullName', @( 'commitlint.config.js' ));
	$Assert.FilePath($TargetObject, 'FullName', @( '.vscode/extensions.json' ));
	$Assert.FilePath($TargetObject, 'FullName', @( '.vscode/settings.json' ));
	$Assert.FilePath($TargetObject, 'FullName', @( '.vscode/tasks.json' ));
}

Rule 'VSCode.Spelling.Config' -Type 'PSRule.Data.RepositoryInfo' {
	$Assert.FilePath($TargetObject, 'FullName', @( '.markdownlint.json' ));
	$Assert.FilePath($TargetObject, 'FullName', @( '.vscode/cSpell.json' ));
}
