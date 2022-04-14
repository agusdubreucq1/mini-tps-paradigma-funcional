module TP2 where

------------------------------------------
-- Modelo inicial
------------------------------------------

data Celular = Celular {
  linea :: (String, String),
  saldo :: Int,
  proveedor :: String
} deriving (Show, Eq)

------------------------------------------

promoRecarga :: Int -> Celular -> Celular
promoRecarga monto celu
  | esMovistar celu && cod011 celu = crearCeluMovistar011 monto celu
  | esPersonal celu = crearCeluPersonal monto celu
  | otherwise = crearCeluNormal monto celu

esMovistar::Celular->Bool
esMovistar celu = (proveedor celu) == "movistar"

esPersonal::Celular->Bool
esPersonal celu = (proveedor celu) == "personal"

cod011::Celular->Bool
cod011 celu = fst (linea celu) == "011"

crearCeluPersonal::Int->Celular->Celular
crearCeluPersonal monto (Celular linea saldo proveedor) = Celular linea (aumentarConPlus saldo monto) proveedor

crearCeluMovistar011::Int->Celular->Celular
crearCeluMovistar011 monto (Celular linea saldo proveedor) = Celular linea (aumentarTriple saldo monto) proveedor

crearCeluNormal::Int->Celular->Celular
crearCeluNormal monto (Celular linea saldo proveedor) = Celular linea (saldo + monto) proveedor

aumentarTriple::Int->Int->Int
aumentarTriple saldoActual monto= saldoActual + monto*3

aumentarConPlus::Int->Int->Int
aumentarConPlus saldoActual monto = saldoActual + monto + (minimo monto 100)

minimo::Int->Int->Int
minimo a b
  |a>b = b
  |otherwise = a


