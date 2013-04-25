maintainer "Besol Soluciones S.L."
maintainer_email "contacto@besol.es"
license "Apache 2.0"
description      "Installs Sumo Logic collector"
long_description "Installs Sumo Logic collector"
version          "0.0.2"

%w{ ubuntu centos debian redhat windows smartos }.each do |os|
  supports os
end

