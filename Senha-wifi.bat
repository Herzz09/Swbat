:: Header:
:: dev Herzz09
:: data 27/05/2026
:: nome Senha-wifi.bat

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 1. Tiulo e predefinicoes especiais
@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
mode con: lines=7 cols=35
title Senha-wifi.bat

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 2. Descobrir o nome da rede - SSID
for /f "tokens=2 delims=:" %%a in (
    'netsh wlan show interface ^| findstr /C:" SSID"'
    ) do (
        set "rede=%%a"
        set "rede=!rede:~1!"
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 3. Salvar o resultado do netsh em um arquivo temporario (temp_wifi.txt) e ocultar a saida
netsh wlan show profile name="%rede%" key=clear > temp_wifi.txt 2>nul

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 4. Busca a senha 
set "senha=Nao encontrada"
for /f "tokens=2 delims=:" %%a in (
    'findstr /C:"da Chave" /C:"Key Content" temp_wifi.txt'
    ) do (
    set "senha=%%a"
    set "senha=!senha:~1!"
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 5. Exibe o resultado final
echo.
echo ===================================
echo Internet: %rede%
echo Senha:    !senha!
echo ===================================

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 6. Deleta o arquivo temporario 
del temp_wifi.txt >nul

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: 7. Pause final
echo. & pause>nul
