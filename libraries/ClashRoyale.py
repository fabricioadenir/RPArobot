import Config
import requests
from urllib.parse import quote
import csv
import logging
import json

logger = logging.getLogger("LibraryClashRoyale")
logger.addHandler(Config.HANDLER_LOG)
logger.setLevel(Config.LOG_LEVEL)


class ClashRoyale:

    def __is_tag(self, clan, partial_tag):
        logger.debug(
            f"Verificando se o clã: {clan.get('name')} exite tag: {partial_tag}.")
        tag = clan.get("tag")
        if tag.startswith(partial_tag):
            logger.debug(f"Clã possui a tag: {partial_tag}.")
            return True

    def __is_country(self, clan, country):
        logger.debug(
            f"Verificando neste clã: {clan.get('name')} é do pais: {country}.")
        lacation = clan.get("location")
        if lacation["name"] == country:
            logger.debug(f"Clã é do pais: {country}.")
            return True

    def __get_list_clan_for_name(self, token, name):
        headers = {
            'Authorization': 'Bearer ' + token
        }

        clan = Config.BASE_URL_CLASH_ROYALE + "clans?name=" + quote(name)

        logger.info(
            f"Buscando lista de clã pelo nome: {name} para filtar a tag solicitada.")

        try:
            response = requests.request("GET", clan, headers=headers)

            list_clan = response.json().get("items")

            logger.debug(
                f"Retornado a lista de Clã: {json.dumps(list_clan, indent=4)}")

            return list_clan

        except Exception as e:
            logger.error(
                f"Erro ao buscar lista de clã pelo nome: {nome}. Detalhes: {e}")

    def get_tag_clan(self, token, name, first_characters_tag, country):
        logger.info(f"Buscando tag do clãn.")

        list_clans = self.__get_list_clan_for_name(token, name)

        try:
            logger.debug(
                f"Percorendo a lista de clã retornada para localizar a tag {first_characters_tag}.")
            for clan in list_clans:
                if (self.__is_tag(clan, first_characters_tag) and
                        self.__is_country(clan, country)):

                    tag = clan.get("tag")
                    logger.info(f"Tag {tag} localizada.")

                    return tag

        except Exception as e:
            logger.error(
                f"Erro ao buscar tag do clã {name} do pais {country}. Detalhes: {e}")
            return None

    def get_members_clan(self, token, tag):
        headers = {
            'Authorization': 'Bearer ' + token
        }
        members = Config.BASE_URL_CLASH_ROYALE + f"clans/{quote(tag)}/members"
        try:
            logger.info(f"Buscarndo os membros da tag {tag}.")
            response = requests.request("GET", members, headers=headers)
            list_members = response.json().get("items")

            logger.debug(
                f"Retornado a lista de membros de {tag}: {json.dumps(list_members, indent=4)}")
            return list_members
        except Exception as e:
            logger.error(f"Erro ao buscar lista de membros. Detalhes: {e}")
            return None

    def create_file_clan_members(self, file_name, members):
        logger.info(f"Criando o arquivo '{file_name}' para salvar os membros.")
        with open(file_name, 'w', encoding='utf-8', newline='') as _file:
            writer = csv.writer(_file, delimiter=',')
            writer.writerow(["nome", "level", "troféus", "papel"])
            for member in members:
                row = [
                    member.get("name"),
                    member.get("expLevel"),
                    member.get("trophies"),
                    member.get("expLevel"),
                ]
                writer.writerow(row)
            logger.debug(f"Lista de membros salvas: {json.dumps(members, indent=4)}")
        logger.info("Lista de membros salva com sucesso.")
