#!/bin/bash

# Проверка аргументов
if [ "$#" -lt 2 ]; then
  echo "Usage: $0 host port [timeout]"
  exit 1
fi

HOST=$1
PORT=$2
TIMEOUT=${3:-30}  # Тайм-аут по умолчанию 30 секунд

echo "Waiting for $HOST:$PORT to become available..."

# Запускаем ожидание
for ((i=1; i<=TIMEOUT; i++)); do
  nc -z "$HOST" "$PORT" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "$HOST:$PORT is available!"
    exit 0
  fi
  sleep 1
done

echo "Timeout reached: $HOST:$PORT is still not available."
exit 1