#!/bin/bash

echo "Producer messages..."

while true;
do
  kafka-console-producer --broker-list kafka:19091 --topic product < mock/product.json;
  kafka-console-producer --broker-list kafka:19091 --topic product-price < mock/product_price.json;
  sleep 10;
done