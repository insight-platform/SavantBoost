from abc import ABC, abstractmethod
from pysavantboost import Image


class CustomPreprocessing(ABC):

    @abstractmethod
    def preprocessing(Image) -> Image:
        pass
