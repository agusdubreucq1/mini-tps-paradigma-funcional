# Consigna TP4: Orden Superior

## Objetivos

- Trabajar con tipos de datos compuestos.
- Usar orden superior, composición y aplicación parcial para resolver problemas complejos a partir de funciones más chicas.
- Evitar soluciones poco declarativas.
- Elegir las operaciones de listas más apropiadas para cada problema.

> En caso de que por problemas técnicos no puedas usar la instalación recomendada de Stack + VSCode que se explica en el TP0, armamos una [guía en Mumuki](https://mumuki.io/nym/complements/264-pdep-mit-2022-tp-funcional) para ayudarte mientras tanto.
>
> Asegurate de que tus tutores estén al tanto de tu situación para guiarte en la instalación del ambiente local para más adelante.

## Contenido Audiovisual :arrow_forward:

Tenemos un programa que cuenta con el siguiente modelo de datos:

```haskell
data Video = Video {
  titulo :: String,
  minutos :: Int,
  hashtags :: [String]
} deriving (Show, Eq)

data Playlist = Playlist {
  descripcion :: String,
  videos :: [Video]
} deriving (Show, Eq)
```

Adicionalmente disponemos de la siguiente función que permite agregar un video a una playlist si el mismo cumple con un criterio indicado:

```haskell
agregarAPlaylistSoloSi :: (Video -> Playlist -> Bool) -> Video -> Playlist -> Playlist
```

> :warning: La implementación de esta función **ya está resuelta** y **no debe modificarse**.

A partir de este modelo, queremos hacer un programa que permita analizar la información de los videos y las playlists que tenemos, y en base a dicho análisis, automatizar la actualización de playlists.

> :bulb: Recordá que podés ayudarte con la [guía de lenguajes](https://docs.google.com/document/d/e/2PACX-1vTlLkakSbp6ubcIq00PU4-Z96tg8CUSc8bO793_uftmiGjfkSn7Ug-F_y0-ieIWG6aWfuoHLJrRL8Fd/pub), que sirve como ayuda memoria de las operaciones comunes para trabajar con listas.

### Hashtags :hash:

Inicialmente queremos poder identificar relaciones entre videos, a partir de los hashtags que tienen, así como analizar el contenido de las playlists armadas. Para ello se pide definir las siguientes funciones:

- `tieneHashtag :: String -> Video -> Bool` que se cumpla para un video si el hashtag indicado se encuentra entre los propios.
- `minutosTotalesConHashtag :: String -> Playlist -> Int` que retorne la suma de minutos de aquellos videos de la playlist que tengan el hashtag indicado.
- `estanRelacionados :: Video -> Video -> Bool` que se cumpla cuando el primer video tenga alguno de los hashtags del segundo.

Por ejemplo, si se tiene una playlist `clasesPdeP` con los siguientes videos:
- `Video "Clase 1" 20 ["#intro", "#declaratividad"]`
- `Video "Clase 2" 60 ["#intro", "#funcional"]`
- `Video "Clase 3" 45 ["#funcional", "#data", "#tipos"]`

El comportamiento esperado para `minutosTotalesConHashtag` sería:

```haskell
> minutosTotalesConHashtag "#intro" clasesPdeP
80

> minutosTotalesConHashtag "#funcional" clasesPdeP
105
```

Y el comportamiento esperado para `estanRelacionados` sería:

```haskell
> estanRelacionados (Video "Clase 2" 60 ["#intro", "#funcional"]) (Video "Clase 3" 45 ["#funcional", "#data", "#tipos"])
True

> estanRelacionados (Video "Clase 1" 20 ["#intro", "#declaratividad"]) (Video "Clase 3" 45 ["#funcional", "#data", "#tipos"])
False
```
Ya que el video de la `"Clase 2"` tiene el hashtag `"#funcional"` (por lo tanto está relacionado con el de la `"Clase 3"`), mientras que el video de la `"Clase 1"` no está relacionado porque no tiene el hashtag `"#funcional"`, ni `"#data"`, ni `"#tipos"`.

> Al correr `stack test` vas a encontrar los resultados de las pruebas para las 3 funciones pedidas, agrupados bajo el título **Hashtags** en el grupo de pruebas del TP4.

### Videos recomendados :ballot_box_with_check:

Queremos aprovechar lo desarrollado previamente para automatizar la actualización de playlists con nuevos videos.

Para ello se pide resolver las siguientes funciones:

- `recomendable :: Video -> Playlist -> Bool` que se cumpla cuando el video en cuestión **esté relacionado con al menos dos** de los videos que conforman la playlist.
- `agregarVideosRecomendados :: [Video] -> Playlist -> Playlist` que agregue sucesivamente a una playlist sólo aquellos videos que sean **recomendables para la playlist que se está armando**.
  > :exclamation: Resolver este problema usando la función `foldr :: (a -> b -> b) -> b -> [a] -> b`.

  > :bulb: No te olvides que existe la función `agregarAPlaylistSoloSi`, que se provee en el código base.


Retomando el ejemplo anterior de la playlist `clasesPdeP`, se consideraría **recomendable** un video con el hashtag `"#funcional"`, por estar relacionado con los videos de `"Clase 2"` y `"Clase 3"`.

Y si se le quisieran agregar videos recomendados considerando los siguientes:
- `Video "Clase 4" 50 ["#funcional", "#composicion"]`
- `Video "Clase 5" 90 ["#practica", "#composicion"]`
- `Video "Clase 6" 120 ["#funcional", "#ordensuperior"]`

La playlist resultante debería incluir los videos iniciales, el de la `"Clase 4"` y el de la `"Clase 6"`, pero no el de la `"Clase 5"`.

> :warning: **Aclaración:** podría darse que un video que no sea recomendable para la playlist inicial, sí lo sea para la playlist que se está armando, dependiendo de los videos que se hayan agregado en el proceso. De ser así, es esperable que dicho video forme parte de la playlist final, no debería omitirse.

> Al correr `stack test` vas a encontrar los resultados de las pruebas para las 2 funciones pedidas agrupados bajo el título **Videos recomendados** en el grupo de pruebas del TP4.

## Subir tu solución

Acordate que deberían pasar todas las pruebas si cumpliste con los requerimientos pedidos, sin embargo podés subir soluciones intermedias tantas veces como quieras. Si algo no te funciona y necesitás ayuda para destrabarte, podés subir una solución intermedia y crear un issue en GitHub arrobando a tus tutores para que te guíen.

La forma de subir tus cambios es la misma que se explicó en el TP0, usando los comandos add, commit y push de git.

Luego de terminar el trabajo práctico, recordá crear un issue de entrega, arrobando a tus tutores y crear un tag para que se corran las pruebas en el servidor de GitHub.