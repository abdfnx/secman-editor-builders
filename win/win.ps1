$release_url = "https://api.github.com/repos/scmn-dev/editor/releases"
$tag = (Invoke-WebRequest -Uri $release_url -UseBasicParsing | ConvertFrom-Json)[0].tag_name

$loc = "$HOME\.secman\editor.exe"

if (Test-Path -path $loc) {
    Remove-Item $loc -Recurse -Force
}

Invoke-WebRequest https://github.com/scmn-dev/editor/releases/download/$tag/editor.exe -outfile editor.exe

Move-Item -Path editor.exe -Destination $HOME\.secman

if (Test-Path -path $loc) {
    Write-Host "Secman Editor Installed"
} else {
    Write-Host "Secman Editor Installation Failed"
}
