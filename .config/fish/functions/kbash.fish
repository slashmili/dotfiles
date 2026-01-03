function kbash
kubectl wait --for=condition=Ready pod/$argv
kubectl exec -it $argv -- bash
end

function __fish_kbash_targets
    kubectl get pods,deploy,sts,rs,job \
        --all-namespaces \
        --no-headers \
        -o custom-columns='KIND:.kind,NAME:.metadata.name,NAMESPACE:.metadata.namespace' 2>/dev/null \
    | awk '{ print tolower($1) "/" $2 "\t" $3 }'
end

complete -c kbash -s n -l namespace -r -a "(__fish_kubectl_get_namespaces)" -d "Namespace"
complete -c kbash -f -a "(__fish_kbash_targets)" -d "Target resource"

