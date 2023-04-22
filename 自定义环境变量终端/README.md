# 自定义环境变量终端

通过工程文件夹中`.vscode`文件夹下的配置，可以实现`cmd`或者`powershell`打开时，将指定路径加入环境变量中。

## 添加方法：

下面会以增加TEST_HOME环境变量，路径为"D:\TEST_HOME"说明如何添加。

1. 先在`settings.json`中，按照如下格式添加新的环境变量：
    ```json
   "terminal.integrated.env.windows": {
        "CMAKE_PATH": "D:\\Program Files\\Cmake\\cmake-3.26.3-x64\\bin",
        "MINGW_PATH": "D:\\Program Files\\MinGW64\\bin",
        "TEST_HOME" : "D:\\TEST_HOME",
    },
    ```

2. 如果是`cmd`方式，修改`init.bat`，先增加下面这段：
    ```json
    if "%TEST_HOME%" == "" (
        set TEST_HOME=%~dp0
        echo TEST_HOME not set. Setting to %~dp0
    )
    ```
    然后修改最后的环境变量表达式：
    ```json
    set PATH=%CMAKE_PATH%;%MINGW_PATH%;%TEST_HOME%;%PATH%
    ```

3. 如果是`powershell`方式，修改`init.ps1`，先增加下面这段：
    ```json
    if ($null -eq $env:TEST_HOME) {
        $env:TEST_HOME="$PSScriptRoot"
        "TEST_HOME not set. Setting to $PSScriptRoot"
    }
    ```
    然后修改最后的环境变量表达式：
    ```json
    $env:PATH="$env:CMAKE_PATH;$env:MINGW_PATH;$env:PATH"
    ```
    