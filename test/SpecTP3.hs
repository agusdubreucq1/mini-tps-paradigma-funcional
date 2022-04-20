module SpecTP3 where

import TP3
import Cafe
import Test.Hspec

spec = do
  describe "Cafetería" $ do
    it "Si se prepara un Frapuccino con 20 gramos de granos café, el café sale con intensidad baja y frío" $ do
      prepararFrapuccino 20 `shouldBe` Cafe {intensidad = 2, temperatura = 12, ml = 190}

    it "Si se prepara un Frapuccino con 50 gramos de granos café, el café sale intenso y frío" $ do
      prepararFrapuccino 50 `shouldBe` Cafe {intensidad = 9, temperatura = 12, ml = 190}

    it "Si se prepara un café de filtro de 400 ml con 100 gramos de granos de café, el café sale con intensidad baja y caliente" $ do
      prepararCafeDeFiltro 400 100 `shouldBe` Cafe {intensidad = 1, temperatura = 60, ml = 390}

    it "Si se prepara un café de filtro de 1400 ml con 500 gramos de granos de café, el café sale intenso y caliente" $ do
      prepararCafeDeFiltro 1400 500 `shouldBe` Cafe {intensidad = 9, temperatura = 60, ml = 990}