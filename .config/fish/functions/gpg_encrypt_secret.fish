function gpg_encrypt_secret
    if not set -q RECIPIENT
        set RECIPIENT (gpg -K --keyid-format long | string match -r '[0-9A-F]{16}' | head -n1)
    end
    if test -z "$RECIPIENT"
        echo "No GPG secret key found"
        return 1
    end

    # 2. Read secret from stdin
    read -sl SECRET

    if test -z "$SECRET"
        echo "No input provided"
        return 1
    end

    # 3. Encrypt and output single-line base64
    printf "%s" "$SECRET" \
        | gpg --armor --encrypt -r $RECIPIENT \
        | base64 | tr -d '\n'
end
