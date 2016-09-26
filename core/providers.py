from faker.providers import BaseProvider

from .generate import new_store, new_farm, new_processor

class CannabisProvider(BaseProvider):

    def store(self):
        return new_store()

    def farm(self):
        return new_farm()

    def processor(self):
        return new_processor()
