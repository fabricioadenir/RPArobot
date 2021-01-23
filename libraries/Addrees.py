import Config
import requests
import logging

logger = logging.getLogger("LibraryAddrees")
logger.addHandler(Config.HANDLER_LOG)
logger.setLevel(Config.LOG_LEVEL)


class Addrees:

    def get_external_ip(self):
        try:
            logger.info(f"Buscando ip externo em {Config.URL_GET_EXTERNAL_IP}")
            external_ip = requests.request("GET", Config.URL_GET_EXTERNAL_IP).text
            logger.debug(f"Ip externo: {external_ip}")
            return external_ip
        except Exception as e:
            logger.error(f"Erro ao buscar por ip externo. Detalhes: {e}")
