# Consigna TP2: Tipos de datos propios

## Objetivos

- Definir funciones en Haskell, trabajando con tipos de datos compuestos.
- Pensar cuándo conviene trabajar con pattern matching y cuándo conviene desentenderse de la forma de los datos.

Recordá que si lo necesitás podés ayudarte con la [guía de lenguajes](https://docs.google.com/document/d/e/2PACX-1vTlLkakSbp6ubcIq00PU4-Z96tg8CUSc8bO793_uftmiGjfkSn7Ug-F_y0-ieIWG6aWfuoHLJrRL8Fd/pub).

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de Stack + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/264-pdep-mit-2022-tp-funcional) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Telefonía :iphone:

Tenemos el siguiente modelo de datos para trabajar con teléfonos celulares:

```haskell
data Celular = Celular {
  linea :: (String, String),
  saldo :: Int,
  proveedor :: String
} deriving (Show, Eq)
```

Cada línea se compone por un código de área y un número de teléfono, por ejemplo: `("011", "7890-1234")`.

Necesitamos definir una función `promoRecarga :: Int -> Celular -> Celular` que, a partir del monto pagado y el celular a recargar, realice la recarga considerando que:

* Los de `"Movistar"` con código de área `"011"` aumentan el saldo en el triple del monto pagado,
* Los de `"Personal"` aumentan el saldo en el monto pagado + un plus equivalente al mínimo entre el monto pagado y 100,
* Todos los demás aumentan el saldo solamente en el monto pagado.

> Además de la función principal `promoRecarga`, se pueden desarrollar tantas funciones como creas conveniente, para abstraer y reutilizar cualquier idea de dominio que consideres relevante.
>
> :bulb: Considerá delegar a funciones más chicas aquellos problemas que requieran trabajar con detalles estructurales de los datos.

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir una solución intermedia y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub.