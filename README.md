﻿# Prometheus data exporter (PDE)

Встраиваемая конфигурация на платформе "1С:Предприятия" для сбора и передачи метрик в систему мониторинга "Prometheus"

## Описание

Статья на [Инфостарт](https://infostart.ru/public/811821/)

## Настройка

Добавление цели для Prometheus. Пути указаны для ОС Debian.

### При наличии авторизации на стороне 1С

```bash
cat >> /etc/prometheus/prometheus.yml <<EOF

  - job_name: '%JOB_NAME%'
    scrape_interval: 30s
    metrics_path: '/%PUB_NAME%/hs/prometheus/polling'
    static_configs:
    - targets: ['%HOSTNAME%:%PORT%']
    basic_auth:
      username: '%USER_NAME%'
      password: '%USER_PASSWORD%'
  
EOF
```

### При отсутствии авторизации на стороне 1С

```bash
cat >> /etc/prometheus/prometheus.yml <<EOF

  - job_name: '%JOB_NAME%'
    scrape_interval: 30s
    metrics_path: '/%PUB_NAME%/hs/prometheus/polling'
    static_configs:
    - targets: ['%HOSTNAME%:%PORT%']
  
EOF
```  

%JOB_NAME% - имя цели как оно будет представлено в Prometheus  
%PUB_NAME% - имя публикации 1С  
%HOSTNAME% - IP адрес или имя хоста, на котором выполнена публикация на стороне 1С  
%PORT% - Порт, на котором выполнена публикация на стороне 1С  
%USER_NAME% - Имя пользователя 1С с наличием роли "Получение метрик"  
%USER_PWD% - Пароль пользователя 1С  

## Примечания

Prometheus привередлив к пробелам в файле настроек т.к. это YAML.
