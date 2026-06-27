# Thin wrapper over the official ToolJet CE image.
#
# Why this exists: tooljet/tooljet-ce ships ENTRYPOINT ["./server/entrypoint.sh"]
# with an EMPTY CMD. The entrypoint runs `db:setup:prod` (migrations + create the
# secondary TOOLJET_DB) and then `exec "$@"` — with no CMD there is nothing to exec,
# so the container runs migrations and exits 0 (looks like a crash-loop / flap).
# Nexlayer's YAML has no command/args override, so we bake the server start command
# into the image as the CMD the entrypoint will exec.
FROM tooljet/tooljet-ce:latest

# Start the NestJS server after the entrypoint finishes db:setup:prod.
CMD ["npm", "run", "start:prod"]
