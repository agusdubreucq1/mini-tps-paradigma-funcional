module SpecTP2 where

import TP2
import Test.Hspec

spec = do
  describe "Recarga promocional" $ do
    let lineaCon011 = ("011", "1234-1234")
    let lineaNo011 = ("010", "1234-1234")
    let celuOtroProveedor = Celular lineaNo011 0 "Claro"
    let celuPersonal = Celular lineaNo011 0 "Personal"
    let celuMovistar = Celular lineaNo011 0 "Movistar"

    it "Recargar un celu de Personal suma lo abonado + $100 cuando el monto abonado supera los $100" $ do
      promoRecarga 120 (celuPersonal {saldo = 5})
        `shouldBe` (celuPersonal {saldo = 225})
    it "Recargar un celu de Personal suma el doble de lo abonado cuando el monto abonado no supera los $100" $ do
      promoRecarga 20 (celuPersonal {saldo = 5})
        `shouldBe` (celuPersonal {saldo = 45})
    it "Recargar un celu de Movistar con código de área 011 le suma el triple de lo abonado al saldo" $ do
      promoRecarga 15
        (celuMovistar {linea = lineaCon011,
          saldo = 10}) `shouldBe`
        (celuMovistar {linea = lineaCon011,
          saldo = 55})
    it "Recargar un celu de Movistar con código de área distinto de 011 le suma lo abonado al saldo" $ do
      promoRecarga 15
        (celuMovistar {linea = lineaNo011,
          saldo = 10}) `shouldBe`
        (celuMovistar {linea = lineaNo011,
          saldo = 25})

    it "Recargar un celu de otro proveedor con código de área 011 le suma lo abonado al saldo" $ do
      promoRecarga 40
        (celuOtroProveedor {linea = lineaCon011,
          saldo = 20}) `shouldBe`
        (celuOtroProveedor {linea = lineaCon011,
          saldo = 60})

    it "Recargar un celu de otro proveedor con código de área distinto de 011 le suma lo abonado al saldo" $ do
      promoRecarga 20
        (celuOtroProveedor {linea = lineaNo011,
          saldo = 20}) `shouldBe`
        (celuOtroProveedor {linea = lineaNo011,
          saldo = 40})
