# shellcheck shell=bash
# Functions

mkcd() {
  mkdir -p -- "$1" && cd -- "$1" || return
}

git_ssh_key() {
  local comment="${1:-}"
  local name="${2:-git}"
  local key_path="$HOME/.ssh/id_ed25519_$name"

  if [[ "$comment" == "-h" || "$comment" == "--help" ]]; then
    echo "Usage: git_ssh_key [email] [name]"
    echo "Example: git_ssh_key you@example.com home"
    return
  fi

  if [[ -z "$comment" ]]; then
    comment="$(git config --global user.email 2>/dev/null || true)"
  fi

  if [[ -z "$comment" ]]; then
    echo "Usage: git_ssh_key [email] [name]"
    echo "No email was provided and git config --global user.email is empty."
    return 2
  fi

  if [[ ! "$name" =~ ^[A-Za-z0-9._-]+$ ]]; then
    echo "Key name may only contain letters, numbers, dots, underscores, and dashes."
    return 2
  fi

  if ! command -v ssh-keygen >/dev/null 2>&1; then
    echo "ssh-keygen is not installed."
    return 1
  fi

  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"

  if [[ -e "$key_path" || -e "$key_path.pub" ]]; then
    echo "Key already exists: $key_path"
    echo "Choose another name, for example: git_ssh_key $comment work"
    return 1
  fi

  ssh-keygen -t ed25519 -C "$comment" -f "$key_path"
  chmod 600 "$key_path"
  chmod 644 "$key_path.pub"

  if [[ -n "${SSH_AUTH_SOCK:-}" ]] && command -v ssh-add >/dev/null 2>&1; then
    ssh-add "$key_path"
  fi

  echo
  echo "Public key:"
  cat "$key_path.pub"
  echo
  echo "Private key: $key_path"
}

check_site_cert() {
  local url="$1"
  local ca_bundle="$2"

  local host port cert tmp_chain
  host="$(echo "$url" | sed -E 's#^https?://([^/:]+).*#\1#')"
  port="$(echo "$url" | sed -nE 's#^https?://[^/:]+:([0-9]+).*#\1#p')"
  port="${port:-443}"

  cert="$(mktemp)"
  tmp_chain="$(mktemp)"

  echo "== Target =="
  echo "URL:  $url"
  echo "Host: $host"
  echo "Port: $port"
  echo

  echo "== Getting live certificate from server =="
  openssl s_client \
    -connect "$host:$port" \
    -servername "$host" \
    -showcerts </dev/null 2>/dev/null \
    > "$tmp_chain"

  awk '
    /BEGIN CERTIFICATE/ {i++}
    i == 1 {print}
    /END CERTIFICATE/ && i == 1 {exit}
  ' "$tmp_chain" > "$cert"

  if [ ! -s "$cert" ]; then
    echo "ERROR: could not extract server certificate"
    rm -f "$cert" "$tmp_chain"
    return 1
  fi

  echo "== Certificate subject / issuer / dates =="
  openssl x509 -in "$cert" -noout -subject -issuer -dates
  echo

  echo "== Subject Alternative Names =="
  openssl x509 -in "$cert" -text -noout | grep -A2 "Subject Alternative Name" || echo "No SAN found"
  echo

  echo "== SHA256 fingerprint =="
  openssl x509 -in "$cert" -noout -fingerprint -sha256
  echo

  echo "== Verify against CA bundle =="
  openssl verify -CAfile "$ca_bundle" "$cert"
  echo

  echo "== Hostname check =="
  openssl verify -CAfile "$ca_bundle" -verify_hostname "$host" "$cert"
  echo

  echo "== Server sent chain =="
  grep -c "BEGIN CERTIFICATE" "$tmp_chain" | awk '{print "Certificates sent by server:", $1}'
  echo

  rm -f "$cert" "$tmp_chain"
}


split_certs() {
    local bundle="$1"
    local outdir="$2"

    mkdir -p "$outdir"

    awk -v outdir="$outdir" '
    /-----BEGIN CERTIFICATE-----/ {
        n++
        file=sprintf("%s/cert%d.crt", outdir, n)
    }

    n > 0 {
        print > file
    }

    /-----END CERTIFICATE-----/ {
        close(file)
    }

    END {
      printf "Extracted " n " certificates into " outdir
    }
    ' "$bundle"
}
