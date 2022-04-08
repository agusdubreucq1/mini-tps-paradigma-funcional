# Consigna TP1: Intro a Funcional

## Objetivos

- Definir funciones en Haskell, trabajando con tipos básicos.
- Abstraer y evitar repetición de lógica. ¡Vale definir todas las funciones que quieras más allá de las que se piden!
- Trabajar adecuadamente con expresiones booleanas, pattern matching y guardas, eligiendo las herramientas más adecuadas para los distintos problemas.
- Desarrollar de forma iterativa usando tests automáticos.

Recordá que si lo necesitás podés ayudarte con la [guía de lenguajes](https://docs.google.com/document/d/e/2PACX-1vTlLkakSbp6ubcIq00PU4-Z96tg8CUSc8bO793_uftmiGjfkSn7Ug-F_y0-ieIWG6aWfuoHLJrRL8Fd/pub).

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de Stack + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/264-pdep-mit-2022-tp-funcional) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Estaciones del año  :sunny: :fallen_leaf: :snowflake: :blossom:

Queremos armar un programa que nos ayude a determinar qué estación del año se corresponde con cada mes.

A cada mes lo representaremos con un número entre el 1 (enero) y el 12 (diciembre). Cualquier otro número no se consideraría como un mes para nuestro programa.

A su vez sabemos que cada 3 meses hay cambios de estación, y en esos meses se da una mezcla de estaciones, como podría ser el caso de marzo, que cuando arranca es verano, pero cuando termina es otoño.

A continuación se detallan las funciones mínimas a desarrollar para resolver este problema.

### Saber si un número es un mes

Definir la función `esMes :: Int -> Bool` que dado un número retorne `True` sólo si el valor recibido se encuentra entre 1 y 12.

A continuación se muestran algunos ejemplos de uso:

```haskell
> esMes 8
True
> esMes 18
False
```

> Al correr `stack test` vas a encontrar los resultados de las pruebas para esta función agrupados bajo el título **Es mes** en el grupo de pruebas del TP1.

### Saber si en un mes hay cambio de estación

Definir la función `hayCambioDeEstacion :: Int -> Bool` que dado un número retorne `True` sólo para los **meses que sean múltiplos de 3**.

A continuación se muestran algunos ejemplos de uso:

```haskell
> hayCambioDeEstacion 8
False
> hayCambioDeEstacion 9
True
> hayCambioDeEstacion 15
False
```

> Al correr `stack test` vas a encontrar los resultados de las pruebas para esta función agrupados bajo el título **Cambios de estación** en el grupo de pruebas del TP1.

### Determinar la estación de un mes

Nuestro objetivo es conocer cuál es la estación para cada mes considerando que:
- Sabemos que en enero (1) es `"verano"`, que en abril (4) es `"otonio"`, que en julio (7) es `"invierno"` y en octubre (10) es `"primavera"`.
- Para los **meses en los cuales hay cambio de estación** la respuesta debería combinar la **estación del mes anterior** con la **estación del mes siguiente**, separadas por `"/"`. Por ejemplo, para marzo (3) la respuesta debería ser `"verano/otonio"`
- Para cualquier otro mes, debería responder **lo mismo que para el mes anterior**, como podría ser el caso de febrero (2), que también debería ser `"verano"`.

Se pide definir la función `estacion :: Int -> String`, considerando que **el dominio debería estar acotado a los número sque sean meses**, con lo cual usar esta función con un número que no es un mes debería fallar.

> :bulb: **Importante!** asegurate de ***generalizar*** la lógica, no definir para los 12 meses, uno por uno, cuál debería ser la respuesta.

A continuación se muestran algunos ejemplos de uso con las respuestas esperadas:

```haskell
> estacion 8
"invierno"
> estacion 10
"primavera"
> estacion 9
"invierno/primavera"
```


> **Ayuda:** para concatenar strings en Haskell se puede usar la función `(++)`, como se muestra en este ejemplo:
> ```haskell
> > "para" ++ "digmas"
> "paradigmas"
> ```

> Al correr `stack test` vas a encontrar los resultados de las pruebas para esta función agrupados bajo el título **Estaciones** en el grupo de pruebas del TP1.

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir una solución intermedia y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub (el badge que muestra el estado de tus TPs se actualizará automáticamente cuando se ejecuten).