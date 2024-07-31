@echo off
:: Restaurar la configuración de red a sus valores predeterminados
netsh interface tcp set global autotuninglevel=normal
netsh interface tcp set global rss=disabled
netsh interface tcp set global chimney=default
netsh interface tcp set global dca=disabled
netsh interface tcp set global netdma=disabled

:: Restaurar la limitación de energía para el adaptador de red
powercfg /change standby-timeout-ac 20
powercfg /change monitor-timeout-ac 10
powercfg /change disk-timeout-ac 20

:: Configurar el plan de energía equilibrado
powercfg /s SCHEME_BALANCED

:: Restaurar el rendimiento del sistema a su configuración predeterminada
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue disabledynamictick

echo Reversión completada. Reinicia el sistema para aplicar todos los cambios.
pause
