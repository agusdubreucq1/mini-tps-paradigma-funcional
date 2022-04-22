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
promoRecarga monto celu = modificarSaldo celu (MontoACargar celu monto)

esMovistar::Celular->Bool
esMovistar celu = (proveedor celu) == "movistar"

esPersonal::Celular->Bool
esPersonal celu = (proveedor celu) == "personal"

cod011::Celular->Bool
cod011 celu = fst (linea celu) == "011"

modificarSaldo::Celular->Int->Celular
modificarSaldo celu monto = celu{saldo=(saldo celu)+ monto}

aumentarTriple::Int->Int
aumentarTriple monto= monto*3

aumentarConPlus::Int->Int
aumentarConPlus monto = monto + (minimo monto 100)

MontoACargar::Int->Celular->Int
MontoACargar monto celu
  | esMovistar celu && cod011 celu = aumentarTriple monto
  | esPersonal celu = aumentarConPlus monto
  | otherwise = monto

