module TP1 where

esMes :: Int -> Bool
esMes x= (x>=1) && (x<=12)

hayCambioDeEstacion :: Int -> Bool
hayCambioDeEstacion y = (mod y 3 == 0) && (esMes y)

estacion :: Int -> String
estacion x
  | (x>0 && x<3) = "verano"
  | (x>3 && x<6) = "otonio"
  | (x>6 && x<9) = "invierno"
  | (x>9 && x<12) = "primavera"
estacion 3 ="verano/otonio"
estacion 6 ="otonio/invierno"
estacion 9 ="invierno/primavera"
estacion 12 ="primavera/verano"