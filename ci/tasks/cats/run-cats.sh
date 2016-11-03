#!/bin/bash
set -e

# Prep om tool
sudo cp tool-om/om-linux /usr/local/bin
sudo chmod 755 /usr/local/bin/om-linux

### Function(s) ###

function fn_compile_cats {

  # Set Golang Path
  export PATH=$PATH:/usr/local/go/bin

  # Go Get CATs repo
  root_path=$(pwd)
  export GOPATH="${root_path}/goroot"
  mkdir -p goroot/src
  cd ${GOPATH}/src/github.com/cloudfoundry/cf-acceptance-tests
  ./bin/update_submodules

  # Setup CATs Config
  # MG Note : need to write code to grab creds from OpsMan
  cat > integration_config.json <<EOF
{
  "api": "api.sys.gcp.customer0.net",
  "apps_domain": "cfapps.gcp.customer0.net",
  "admin_user": "admin",
  "admin_password": "vOvW7S-SHuq7dXpL4Dffr16_atMOIchG",
  "skip_ssl_validation": true,
  "use_http": true,
  "include_apps": true,
  "include_backend_compatibility": true,
  "include_detect": true,
  "include_docker": true,
  "include_internet_dependent": true,
  "include_privileged_container_support": true,
  "include_route_services": true,
  "include_routing": true,
  "include_zipkin": true,
  "include_security_groups": true,
  "include_services": true,
  "include_ssh": true,
  "include_sso": true,
  "include_tasks": true,
  "include_v3": true
}
EOF
  export CONFIG=$PWD/integration_config.json
}

### Main Logic ###

 # Prep CATs
 fn_compile_cats

 # Run CATs
 #./bin/test

exit 1