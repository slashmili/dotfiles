# Use GPG Agent as SSH Agent
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

# Fix Commit Signing
set -gx GPG_TTY (tty)
