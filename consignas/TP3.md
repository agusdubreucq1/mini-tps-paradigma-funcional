# Consigna TP3: Composición y Aplicación Parcial

## Objetivos

- Definir funciones en términos de otras funciones, usando **composición** y **aplicación parcial**.
- Resolver problemas complejos combinando adecuadamente funciones más chicas.

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de Stack + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/264-pdep-mit-2022-tp-funcional) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Cafetería :coffee:

Tenemos un programa que cuenta con las siguientes abstracciones.

```haskell
data Cafe = Cafe {
  intensidad :: Int,
  temperatura :: Int,
  ml :: Int
} deriving (Show, Eq)


molerGranos :: Gramos -> Gramos
prepararCafe :: Agua -> Gramos -> Cafe
servirEnVaso :: Vaso -> Cafe -> Cafe
licuar :: Segundos -> Leche -> Cafe -> Cafe
agregarHielo :: Hielos -> Cafe -> Cafe
```

La implementación de esas funciones **ya está resuelta**, qué hace cada una no es relevante para el problema a resolver y **no deben modificarse**. Pero a partir de estas funciones queremos armar otras funciones que sirvan para determinar cómo saldrá la preparación del café que queremos hacer.

> :bulb: Todos los tipos que se mencionan más allá de Cafe son simplemente un alias de Int, a modo orientantivo.

Definir las siguientes funciones en el archivo `src/TP3.hs`:

 - `prepararFrapuccino :: Gramos -> Cafe` que muela los gramos de café, luego prepare el café con sólo 80 ml de agua, le agregue 6 hielos, lo licúe durante 60 segundos con 120 ml de leche y finalmente lo sirva en un vaso de 400 ml.

 - `prepararCafeDeFiltro :: Vaso -> Gramos -> Cafe` que muela los gramos de café, luego prepare el café en una cafetera con 1000 ml de agua y finalmente lo sirva en el vaso del tamaño indicado.

:warning: ¡Prestá especial atención al orden de las operaciones descritas, para asegurar que el resultado obtenido coincida con el esperado! :warning:

> Las funciones `prepararFrapuccino` y `prepararCafeDeFiltro` deben definirse combinando las funciones provistas de modo **que se aprovechen los conceptos de composición y aplicación parcial**.
>
> :bulb: Si bien no es necesario que las mismas se definan con [notación point-free](http://wiki.uqbar.org/wiki/articles/notacion-point-free.html), recomendamos su uso al definir estas funciones, para ayudarte a explotar los conceptos de aplicación parcial y composición todo lo posible.

> Al correr `stack test` vas a encontrar los resultados de las pruebas para este trabajo agrupados bajo el título **Cafetería** en el grupo de pruebas del TP3.

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir una solución intermedia y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub.