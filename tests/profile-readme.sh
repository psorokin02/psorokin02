#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "$0")/.." && pwd -P)
cd "$repo_root"

course_assets=(
  assets/courses/spring-core.svg
  assets/courses/redis-spring-boot.svg
  assets/courses/spring-boot-pro.svg
  assets/courses/hibernate.svg
  assets/courses/kafka.svg
  assets/courses/microservices.svg
)

program_assets=(
  assets/programs/java-backend.svg
  assets/programs/multithreading.svg
  assets/programs/livecoding.svg
)

for asset in "${course_assets[@]}" "${program_assets[@]}"; do
  test -s "$asset"
  xmllint --noout "$asset"
done

test "$(rg -c 'assets/courses/[^" ]+\.svg' README.md)" -eq 6
test "$(rg -c 'assets/programs/[^" ]+\.svg' README.md)" -eq 3
test "$(rg -c 'width="32%"' README.md)" -eq 3
test "$(rg -c 'Telegram-229ED9.*logo=telegram' README.md)" -eq 1

if rg -q '^### \[|Смотреть_бесплатно|Подробнее_о_программе|IoC, DI|Кеширование и практические|REST, DTO|ORM, связи|Producer, consumer|Собираем backend' README.md; then
  echo "README still contains the expanded list layout" >&2
  exit 1
fi

echo "profile README matches the compact preview layout"
