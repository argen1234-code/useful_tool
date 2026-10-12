param([switch]$PromptForApiKey)
$ErrorActionPreference = 'Stop'
if (-not (Get-Command codex -ErrorAction SilentlyContinue)) { throw 'Missing command: codex' }
$codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }
$profile = Join-Path $codexHome 'reasonix.config.toml'
$key = [Environment]::GetEnvironmentVariable('DEEPSEEK_API_KEY','User')
if (-not $key) { $key = $env:DEEPSEEK_API_KEY }
if (-not $key -and $PromptForApiKey) {
  $secure = Read-Host 'Enter DEEPSEEK_API_KEY' -AsSecureString
  $ptr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
  try { $key = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr) } finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr) }
  if ($key) { [Environment]::SetEnvironmentVariable('DEEPSEEK_API_KEY',$key,'User'); $env:DEEPSEEK_API_KEY=$key }
}
if (-not $key) { Write-Output 'DEEPSEEK_API_KEY is missing. Re-run with -PromptForApiKey.'; exit 2 }
if (-not (Test-Path $profile)) {
  @'
model_provider = "deepseek"
model = "deepseek-flash"
model_reasoning_effort = "medium"
'@ | Set-Content -LiteralPath $profile -Encoding utf8
}
if ((Get-Content -LiteralPath $profile -Raw) -notmatch 'model\s*=\s*"deepseek-flash"') { throw "Reasonix profile is not fixed to deepseek-flash: $profile" }
codex mcp list | Out-Host
Write-Output "Reasonix environment ready. Profile: $profile; model: deepseek-flash"
