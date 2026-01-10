import type { UserConfig } from "@commitlint/types";
import { RuleConfigSeverity } from "@commitlint/types";

const Configuration: UserConfig = {
  extends: ["@commitlint/config-conventional"],
  parserPreset: "conventional-changelog-angular",
  formatter: "@commitlint/format",
  rules: {
    // https://commitlint.js.org/#/reference-rules
    "type-enum": [RuleConfigSeverity.Error, "always", [
      "feat",
      "update",
      "fix",
      "chore",
      "docs",
      "style",
      "refactor",
      "perf",
      "ci",
      "test",
      "revert",
      "wip",
      "init"
    ]],
    "scope-enum": [RuleConfigSeverity.Error, "always", [
      "ott",
      "odt",
      "images",
      "qrcode",
      "vcard",
      "design",
      "vscode",
      "git",
      "github",
      "github-actions",
      "deps",
      "other",
      "changelog",
      "readme"
    ]],
    "scope-empty": [RuleConfigSeverity.Warning, "never"],
    "subject-case": [RuleConfigSeverity.Error, "always", "lower-case"],
  },
};

export default Configuration;
