PowerShell ドラッグアンドドロップ サンプル
========================================

このリポジトリには、バッチファイル（`.bat`）を使用してPowerShellスクリプトでドラッグアンドドロップ機能を実現するサンプル実装が含まれています。      
PowerShellはネイティブではドラッグアンドドロップによる実行をサポートしていないため、この回避策を使ってユーザーはファイルをバッチファイルにドラッグアンドドロップでき、そのファイルパスがPowerShellスクリプトに引数として渡されます。


コンポーネント
----------------------------------------

- `DragAndDrop.bat`: ドラッグアンドドロップされたファイルのすべてのパスを収集し、PowerShellスクリプトに引数として渡すバッチファイル。
- `PrintPath.ps1`: ファイルパスを引数として受け取り、それらを表示するPowerShellスクリプト。


使い方
----------------------------------------

1. 一つ以上のファイルを`DragAndDrop.bat`にドラッグアンドドロップします。
2. バッチファイルがファイルパスを収集し、`PrintPath.ps1`に渡します。
3. `PrintPath.ps1`はこれらのパスを受け取り、コンソールに表示します。


コードの説明
----------------------------------------

### `DragAndDrop.bat`

```bat
@echo off
REM このバッチファイルは、ドラッグアンドドロップされたすべてのファイルパスを収集し、PowerShellスクリプトに渡します。

SET BasePath=%~dp0
SET PowerShellScriptPath=%BasePath%PrintPath.ps1
SET Args=

:loop
IF "%~1"=="" GOTO runScript
SET Args=%Args% "%~1"
SHIFT
GOTO loop

:runScript
PowerShell -File "%PowerShellScriptPath%" %Args%

PAUSE
```

このスクリプトは環境を設定し、ファイルパスを収集し、これらのパスを引数としてPowerShellスクリプトを呼び出します。

### `PrintPath.ps1`

```ps1
# このPowerShellスクリプトは、引数としてファイルパスを受け取り、それらを表示します。

foreach ($path in $Args) {
    Write-Output "ファイルパス: $path"
}
```

このスクリプトは提供された引数（ファイルパス）を繰り返し処理し、各パスを出力します。