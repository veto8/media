#!/bin/sh

ROOT=$(cd "$(dirname "$0")" && pwd)
TASKS_DIR="$ROOT/ask.d"

task_meta() {
  sed -n "s/^# $2: //p" "$1" | head -n1
}

task_id() {
  task_meta "$1" id
}

list_tasks() {
  for f in "$TASKS_DIR"/*.sh; do
    [ -f "$f" ] || continue
    printf '%s|%s|%s\n' "$(task_id "$f")" "$(task_meta "$f" desc)" "$f"
  done | sort -t'|' -k1,1n
}

show_menu() {
  printf "%s\n" '  ┌─────┬──────────────────────────────────────────────┐'
  printf '  │  ID │ %-44s │\n' "Description"
  printf "%s\n" '  ├─────┼──────────────────────────────────────────────┤'
  list_tasks | while IFS='|' read -r id desc file; do
    printf '  │ %2s  │ %-44s │\n' "$id" "$desc"
  done
  printf "%s\n" '  ├─────┼──────────────────────────────────────────────┤'
  printf '  │ %2s  │ %-44s │\n' "0" "Exit"
  printf "%s\n" '  └─────┴──────────────────────────────────────────────┘'
}

printf "\n  media — Task Runner\n\n"

while true; do
  show_menu

  printf "  Enter Task ID: "
  read task || exit 0

  if [ "$task" = "0" ]; then
    printf "  Goodbye!\n"
    exit 0
  fi

  task=${task#0}
  case "$task" in
    ''|*[!0-9]*)
      printf "  Unknown task: %s\n" "$task"
      sleep 2
      printf "\n"
      continue
      ;;
  esac

  task_file=""
  for f in "$TASKS_DIR"/*.sh; do
    [ -f "$f" ] || continue
    if [ "$(task_id "$f")" = "$task" ]; then
      task_file=$f
      break
    fi
  done

  if [ -n "$task_file" ]; then
    sh "$task_file"
    rc=$?
    [ "$rc" -eq 0 ] || printf "  Task %s exited with code %s.\n" "$task" "$rc"
  else
    printf "  Unknown task: %s\n" "$task"
  fi

  sleep 2
  printf "\n"
done
