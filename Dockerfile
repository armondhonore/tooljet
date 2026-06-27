# Thin wrapper over the official ToolJet CE image.
#
# Why this exists: tooljet/tooljet-ce ships ENTRYPOINT ["./server/entrypoint.sh"]
# with an EMPTY CMD. The entrypoint runs `db:setup:prod` (migrations + create the
# secondary TOOLJET_DB) and then `exec "$@"` — with no CMD there is nothing to exec,
# so the container runs migrations and exits 0 (looks like a crash-loop / flap).
# Nexlayer's YAML has no command/args override, so we bake the server start command
# into the image as the CMD the entrypoint will exec.
FROM tooljet/tooljet-ce:latest
# build-time env seeded from .env.example
ENV APM_VENDOR=nexlayer-placeholder
ENV CHECK_FOR_UPDATES=true
ENV COMMENT_FEATURE_ENABLE=nexlayer-placeholder
ENV DEFAULT_FROM_EMAIL=hello@tooljet.io
ENV DISABLE_APP_EMBED=nexlayer-placeholder
ENV DISABLE_SIGNUPS=nexlayer-placeholder
ENV ENABLE_CORS=nexlayer-placeholder
ENV ENABLE_MULTIPLAYER_EDITING=true
ENV ENABLE_ONBOARDING_QUESTIONS_FOR_ALL_SIGN_UPS=nexlayer-placeholder
ENV ENABLE_PRIVATE_APP_EMBED=nexlayer-placeholder
ENV GOOGLE_CLIENT_ID=nexlayer-placeholder
ENV GOOGLE_CLIENT_SECRET=nexlayer-placeholder
ENV LOCKBOX_MASTER_KEY=0000000000000000000000000000000000000000000000000000000000000000
ENV ORGANIZATION_LICENSE_API_KEY=nexlayer-placeholder
ENV ORGANIZATION_LICENSE_URL=nexlayer-placeholder
ENV ORM_LOGGING=nexlayer-placeholder
ENV PAT_EXPIRY=nexlayer-placeholder
ENV PAT_SESSION_EXPIRY=nexlayer-placeholder
ENV PGRST_DB_PRE_CONFIG=postgrest.pre_config
ENV PGRST_HOST=nexlayer-placeholder
ENV PGRST_JWT_SECRET=nexlayer-placeholder
ENV PG_DB=nexlayer-placeholder
ENV PG_HOST=nexlayer-placeholder
ENV PG_PASS=nexlayer-placeholder
ENV PG_USER=nexlayer-placeholder
ENV REDIS_DB=nexlayer-placeholder
ENV REDIS_HOST=localhost
ENV REDIS_PASSWORD=nexlayer-placeholder
ENV REDIS_PORT=6379
ENV REDIS_TLS=nexlayer-placeholder
ENV REDIS_USERNAME=nexlayer-placeholder
ENV SCIM_BASIC_AUTH_PASS=12345
ENV SCIM_BASIC_AUTH_USER=12345
ENV SCIM_ENABLED=true
ENV SCIM_HEADER_AUTH_TOKEN=my-secure-header-token
ENV SECRET_KEY_BASE=replace_with_secret_key_base
ENV SENTRY_DEBUG=nexlayer-placeholder
ENV SENTRY_DNS=nexlayer-placeholder
ENV SERVER_HOST=nexlayer-placeholder
ENV SMTP_DISABLED=nexlayer-placeholder
ENV SMTP_DOMAIN=nexlayer-placeholder
ENV SMTP_PASSWORD=nexlayer-placeholder
ENV SMTP_PORT=nexlayer-placeholder
ENV SMTP_USERNAME=nexlayer-placeholder
ENV SSO_ACCEPTED_DOMAINS=nexlayer-placeholder
ENV SSO_DISABLE_SIGNUPS=nexlayer-placeholder
ENV SSO_GIT_OAUTH2_CLIENT_ID=nexlayer-placeholder
ENV SSO_GIT_OAUTH2_CLIENT_SECRET=nexlayer-placeholder
ENV SSO_GIT_OAUTH2_HOST=nexlayer-placeholder
ENV SSO_GOOGLE_OAUTH2_CLIENT_ID=nexlayer-placeholder
ENV TOOLJET_DB=nexlayer-placeholder
ENV TOOLJET_DB_HOST=nexlayer-placeholder
ENV TOOLJET_DB_PASS=nexlayer-placeholder
ENV TOOLJET_DB_RECONFIG=true
ENV TOOLJET_DB_STATEMENT_TIMEOUT=60000
ENV TOOLJET_DB_USER=nexlayer-placeholder
ENV TOOLJET_HOST=http://localhost:8082
ENV TOOLJET_QUEUE_DASH_PASSWORD=nexlayer-placeholder
ENV TOOLJET_WORKFLOW_SANDBOX_BYPASS=nexlayer-placeholder
ENV USER_SESSION_EXPIRY=nexlayer-placeholder
ENV WORKER=nexlayer-placeholder

# Start the NestJS server after the entrypoint finishes db:setup:prod.
CMD ["npm", "run", "start:prod"]
