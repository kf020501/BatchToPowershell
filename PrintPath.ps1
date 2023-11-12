# このPowerShellスクリプトは、引数としてファイルパスを受け取り、それらを表示します。

foreach ($path in $Args) {
    Write-Output "ファイルパス: $path"
}
