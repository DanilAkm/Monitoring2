# Prometheus + Grafana

# Install and configure Prometheus and Grafana in virtual machine; Access the Prometheus and Grafana web interfaces from a local machine

- `sudo apt install prometheus`
- `sudo apt install grafana`

Запускаем prometheus со стандартным конфигом (/etc/prometheus/) \
Затем запускаем grafana командой `sudo systemctl start grafana-server`
Далее пробрасываем порт, на котором работем grafana (3000) на основную машину

![](../img/ports.png)

На локальной машине заходим по адресу localhost:3000
Открывается веб интверфейс графаны

![](../img/grafana_web.png)

кликаем на шестеренку внизу и выбираем пункт data sources \
в открывшемся меню выбираем prometheus и далее прописываем URL http://localhost:9090

Теперь мы можем создать свой дашборд с нужными метриками

![](../img/grafana_dash.png)

График после выполнения скрипта: 
![](../img/after_script.png)

График после выполнения команды `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`

![](../img/after_stress.png)