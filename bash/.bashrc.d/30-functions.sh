# Functions

mkcd() {
  mkdir -p -- "$1" && cd -- "$1"
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

    {
        print > file
    }

    /-----END CERTIFICATE-----/ {
        close(file)
    }
    ' "$bundle"

    echo "Extracted $n certificates into $outdir"
}
