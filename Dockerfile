FROM intersystemsdc/irishealth-community:2024.1-zpm

# create /app
USER root
RUN mkdir /app && chown $ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP /app

USER ${ISC_PACKAGE_MGRUSER}

COPY --chown=$ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP irissession.sh /
RUN chmod +x /irissession.sh

COPY --chown=$ISC_PACKAGE_MGRUSER:$ISC_PACKAGE_IRISGROUP src /app/install

SHELL ["/irissession.sh"]

RUN \
  zn "USER" \
  # install webterminal
  zpm "install webterminal" \
  # load source code 
  do $system.OBJ.LoadDir("/app/install", "ck", .errorlog, 1, .loaded) \
  set sc = 1
  
# bringing the standard shell back
SHELL ["/bin/bash", "-c"]
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]