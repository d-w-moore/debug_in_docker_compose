#!/bin/bash
set -- debugindocker_irodsprov_1 debugindocker_irodscons_1
x="
/root/github/build_icommands/irods-icommands-4.2.8-1.x86_64.rpm             
/root/github/build_irods/irods-database-plugin-mysql-4.2.8-1.x86_64.rpm     
/root/github/build_irods/irods-database-plugin-oracle-4.2.8-1.x86_64.rpm    
/root/github/build_irods/irods-database-plugin-postgres-4.2.8-1.x86_64.rpm  
/root/github/build_irods/irods-devel-4.2.8-1.x86_64.rpm                     
/root/github/build_irods/irods-runtime-4.2.8-1.x86_64.rpm                   
/root/github/build_irods/irods-server-4.2.8-1.x86_64.rpm

/root/github/build_irods_netcdf/irods-netcdf-client_modules-4.2.8.0-centos-7-x86_64.rpm   
/root/github/build_irods_netcdf/irods-netcdf-icommands-4.2.8.0-centos-7-x86_64.rpm        
/root/github/build_irods_netcdf/irods-netcdf-server_modules-4.2.8.0-centos-7-x86_64.rpm   
"

#for y in $x; do docker cp $1:$y . ; done
for y in $x; do docker cp $(basename $y) $2:/tmp; done
