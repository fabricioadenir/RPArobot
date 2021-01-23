import logging

# Configure Logging
LOG_LEVEL = "DEBUG"
FORMATTER_LOG = 'RPA-Prime-Control %(asctime)s %(levelname)s %(name)s %(message)s'
FILENAME_LOG = './LogOperations.log'

HANDLER_LOG = logging.FileHandler(FILENAME_LOG, encoding="UTF-8")
HANDLER_LOG.setFormatter(logging.Formatter(FORMATTER_LOG))


BASE_URL_CLASH_ROYALE = "https://api.clashroyale.com/v1/"

URL_GET_EXTERNAL_IP = "https://api.ipify.org/"