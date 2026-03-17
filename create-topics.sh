#!/usr/bin/env sh
set -eu

BOOTSTRAP="${KAFKA_BOOTSTRAP_SERVERS:-localhost:9092}"

create_topic() {
  topic="$1"
  kafka-topics \
    --bootstrap-server "$BOOTSTRAP" \
    --create \
    --if-not-exists \
    --topic "$topic" \
    --partitions 3 \
    --replication-factor 1
}

create_topic "product-orders"
create_topic "product-events"
create_topic "order-events"
create_topic "order-created"

kafka-topics --bootstrap-server "$BOOTSTRAP" --list
