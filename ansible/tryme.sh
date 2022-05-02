#!/bin/bash 
# Purpose: Build the test docker hosts and generate the inventory file. 

############################################
#               CONSTANTS
############################################
IMAGE_NAME='ubuntu_sshd'
DOCKERFILE='docker-inventory/Dockerfile'
COMPOSEFILE='docker-inventory/docker-compose.yaml'

# Colors
YEL='\033[0;33m'
GRE='\033[0;32m'
BLU='\033[0;34m'
NC='\033[0m' # No Color
############################################

# function generate-inventory() {
#     host1_ip=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tryme-1)
#     host2_ip=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tryme-2)
#     host3_ip=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tryme-3)

#     echo "[docker]" > inventory
#     echo "${host1_ip}" >> inventory
#     echo "${host2_ip}" >> inventory
#     echo "${host3_ip}" >> inventory
# }

if [ -f "${DOCKERFILE}" ]; then
    docker build -t "${IMAGE_NAME}" .
    docker-compose -f ${COMPOSEFILE} up -d
    # generate-inventory
    echo -e "\n${BLU}[INFO]${NC} ${GRE}Ready!${NC}"
    echo -e "${BLU}[INFO]${NC} To start run: ${YEL}ansible-playbook -i docker-inventory/inventory.yaml {playbook}${NC}"
    echo -e "${BLU}[INFO]${NC} When done run: ${YEL}docker-compose -f docker-inventory/docker-compose.yaml down${NC}"
else
    echo "Dockerfile missing from build directory."
fi