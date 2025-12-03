function kbash
kubectl wait --for=condition=Ready pod/$argv
kubectl exec -it $argv -- bash
end
