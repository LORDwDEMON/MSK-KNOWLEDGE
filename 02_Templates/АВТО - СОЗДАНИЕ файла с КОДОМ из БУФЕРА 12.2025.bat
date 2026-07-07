@echo off
:: ========================================================
:: Рабочий 100% BAT с логированием и буфером обмена
:: ========================================================

chcp 65001 >nul

@echo off
:: Запрашиваем имя файла
set /p filename=Введите имя файла с расширением (например script.js):
if "%filename%"=="" (
    echo Имя файла не введено!
    pause
    exit /b
)
:: Получаем содержимое буфера обмена и записываем в файл UTF-8
powershell -noprofile -command ^
    "$c = Get-Clipboard -Raw; if (-not $c) { exit 1 }; Set-Content -Path '%cd%\%filename%' -Value $c -Encoding UTF8"
if %ERRORLEVEL% equ 0 (
    echo Файл "%filename%" успешно создан.
) else (
    echo Ошибка: буфер обмена пуст или произошла ошибка.
)
pause


pause >nul
