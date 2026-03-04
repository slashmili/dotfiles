function gpg_decrypt_secret
    read -lz BLOB

    if test -z "$BLOB"
        echo "No input provided"
        return 1
    end

    printf "%s" "$BLOB" \
        | base64 -d \
        | gpg --decrypt --quiet
end
