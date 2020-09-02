$WORKING_DIR='C:\temp\CommonTools'
$Path = $env:TEMP;

If (!(test-path $WORKING_DIR))
{
    Write-Output "  Creating folder $WORKING_DIR"
    mkdir $WORKING_DIR
}

$Installer = "chrome_installer.exe";
If (!(test-path $WORKING_DIR/$Installer))
{
    Write-Output "  beginning to install chrome"
    $Installer = "chrome_installer.exe";
    Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $WORKING_DIR\$Installer; 
    Start-Process -FilePath $WORKING_DIR\$Installer -ArgumentList "/silent /install" -Verb RunAs -Wait;    
    Remove-Item $WORKING_DIR\$Installer    
}