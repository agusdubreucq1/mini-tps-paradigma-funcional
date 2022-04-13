module TP1 where

esMes :: Int -> Bool
esMes x= (x>=1) && (x<=12)

hayCambioDeEstacion :: Int -> Bool
hayCambioDeEstacion y = (mod y 3 == 0) && (esMes y)

estacion :: Int -> String
estacion 1 ="verano"
estacion 4 ="otonio"
estacion 7 ="invierno"
estacion 10 ="primavera"
estacion mes
  | (hayCambioDeEstacion mes) && (esMes mes) = estacion (mesAnterior mes) ++ "/" ++ estacion (mesSiguiente mes)
  | esMes mes= estacion (mesAnterior mes)

mesSiguiente:: Int -> Int
mesSiguiente 12 = 1
mesSiguiente mes = mes + 1

mesAnterior:: Int -> Int
mesAnterior 1 = 12
mesAnterior mes = mes - 1