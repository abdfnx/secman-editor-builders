$release_url = "https://api.github.com/repos/scmn-dev/win-editor/releases"
$tag = (Invoke-WebRequest -Uri $release_url -UseBasicParsing | ConvertFrom-Json)[0].tag_name

$loc = "$HOME\.secman\editor"

if (Test-Path -path $loc) {
    Remove-Item $loc -Recurse -Force
}

Write-Host "Installing secman editor" -ForegroundColor DarkCyan

Invoke-WebRequest https://github.com/scmn-dev/win-editor/releases/download/$tag/editor.exe -outfile editor.exe

Move-Item -Path editor.exe -Destination $HOME\.secman

if 