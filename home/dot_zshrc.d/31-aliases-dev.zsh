# Dev folder selection. Will use $DEV_FOLDER as the base if it is set in the environment.
DEV=${DEV_FOLDER:-"$HOME/Development"}
dev() {
    # Work Projects
    if [[ "$1" == bu* ]]; then
        cd $DEV/Phobio/buzzsaw/
    elif [[ "$1" == ter* ]]; then
        cd $DEV/Phobio/terraform-google-buzzsaw/
    elif [[ "$1" == cha* ]]; then
        cd $DEV/Phobio/charts/
    elif [[ "$1" == sky* ]]; then
        cd $DEV/Phobio/skyscraper/

    # Personal Projects
    elif [[ "$1" == ho* ]]; then
        cd $DEV/Other/homeserver
    elif [[ "$1" == pkg* ]]; then
        cd $DEV/Other/pkgbuilds

    # General Folders
    elif [[ "$1" == p* ]]; then
        cd $DEV/Phobio/
    elif [[ "$1" == "o" ]]; then
        cd $DEV/Other/
    elif [[ "$1" == g* ]]; then
        cd $DEV/GamersOutreach/
    else
        cd $DEV
    fi
}

# VSCode. Open provided directory or current directory if none provided.
code() {
    if [[ -z "$1" ]]; then
        command code .
    else
        command code $1
    fi
}
alias c="code"

# Kubernetes
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias kexec-prod="kubectx gke_buzzsaw-prod_us-east4_prod-cluster; kubectl exec -it deployments/buzzsaw-gunicorn --"
alias kshell-prod="kexec-prod python manage.py shell"
alias kexec-staging="kubectx gke_buzzsaw-staging_us-east4_staging-cluster; kubectl exec -it deployments/buzzsaw-staging-gunicorn --"
alias kshell-staging="kexec-staging python manage.py shell"
alias kplay-prod="kubectx gke_buzzsaw-prod_us-east4_prod-cluster; kubectl exec -it buzzsaw-playground-0 -- /bin/bash"
