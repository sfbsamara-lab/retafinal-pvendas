# Minifica style.css para style.min.css (simples - remove quebras e múltiplos espaços)
$in = Join-Path $PSScriptRoot "..\style.css"
$out = Join-Path $PSScriptRoot "..\style.min.css"
if(-not (Test-Path $in)) { Write-Error "style.css não encontrado"; exit 1 }
$css = Get-Content $in -Raw
# Remover comentários
$css = [regex]::Replace($css, "/\*.*?\*/", "", 'Singleline')
# Remover quebras de linha e espaços extras
$css = $css -replace "\s+"," "
# Remover espaços antes de { e ; e ,
$css = $css -replace "\s*{\s*","{" -replace "\s*;\s*",";" -replace "\s*,\s*","," -replace "\s*}\s*","}"
Set-Content -Path $out -Value $css -Encoding UTF8
Write-Host "style.min.css criado em: $out" -ForegroundColor Green
