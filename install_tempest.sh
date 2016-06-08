#!/bin/bash -xe
sed -i 's|#swift_operator_role = Member|swift_operator_role = SwiftOperator|g' /etc/rally/rally.conf
source /home/rally/openrc
rally-manage db recreate
rally deployment create --fromenv --name=tempest 
rally verify install --version d05a3c26cd1b492c0466737972ea05d339f224d6
rally verify genconfig
