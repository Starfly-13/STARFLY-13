if(!(Test-Path -Path "C:/byond")){
    bash tools/starfly/ci/install_byond_windows.sh
    [System.IO.Compression.ZipFile]::ExtractToDirectory("C:/byond.zip", "C:/")
    Remove-Item C:/byond.zip
}

bash tools/ci/install_node.sh
bash tools/build/build -Werror

exit $LASTEXITCODE
