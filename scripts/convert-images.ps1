# Script para converter imagens em assets/ para WebP (usando ImageMagick ou cwebp)
# Uso: execute no PowerShell: ./scripts/convert-images.ps1

$assets = @("fullbody.jpg","kit.jpg","cardapio.jpg","arsenal.jpg","sos.jpg","selfie1.png","selfie2.png","selfie3.png")
$assetsPath = Join-Path $PSScriptRoot "..\assets"

function Convert-WithMagick($src, $dest){
    & magick "$src" "$dest"
}

function Convert-WithCwebp($src, $dest){
    & cwebp "$src" -o "$dest" | Out-Null
}

$hasMagick = (Get-Command magick -ErrorAction SilentlyContinue) -ne $null
$hasCwebp = (Get-Command cwebp -ErrorAction SilentlyContinue) -ne $null

if(-not $hasMagick -and -not $hasCwebp){
    Write-Host "Nenhuma ferramenta de conversão encontrada (magick ou cwebp)." -ForegroundColor Yellow
    Write-Host "Instale ImageMagick (https://imagemagick.org) ou libwebp (https://developers.google.com/speed/webp) e rode novamente." -ForegroundColor Yellow
    exit 1
}

foreach($f in $assets){
    $src = Join-Path $assetsPath $f
    if(-not (Test-Path $src)){
        Write-Host "Arquivo não encontrado: $src" -ForegroundColor DarkYellow
        continue
    }
    $base = [System.IO.Path]::GetFileNameWithoutExtension($f)
    $destWebp = Join-Path $assetsPath ("$base.webp")
    try{
        if($hasMagick){ Convert-WithMagick $src $destWebp; Write-Host "Converted $f -> $base.webp (magick)" -ForegroundColor Green }
        elseif($hasCwebp){ Convert-WithCwebp $src $destWebp; Write-Host "Converted $f -> $base.webp (cwebp)" -ForegroundColor Green }
    }catch{
        Write-Host ("Erro ao converter {0}: {1}" -f $f, $_) -ForegroundColor Red
    }
}

Write-Host "Conversão finalizada. Se quiser gerar AVIF, use ferramentas específicas (ex: avifenc)." -ForegroundColor Cyan
