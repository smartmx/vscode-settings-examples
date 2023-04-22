
if ($null -eq $env:CMAKE_PATH) {
    $env:CMAKE_PATH="$PSScriptRoot"
    "CMAKE_PATH not set. Setting to $PSScriptRoot"
}

if ($null -eq $env:MINGW_PATH) {
    $env:MINGW_PATH="$PSScriptRoot"
    "MINGW_PATH not set. Setting to $PSScriptRoot"
}

$env:PATH="$env:CMAKE_PATH;$env:MINGW_PATH;$env:PATH"
