module TP4 where
import ContenidoAudiovisual

tieneHashtag :: String -> Video -> Bool
tieneHashtag hashtag = elem hashtag . hashtags

minutosTotalesConHashtag :: String -> Playlist -> Int
minutosTotalesConHashtag hashtag = sum .map minutos. filter (tieneHashtag hashtag) . videos  

estanRelacionados :: Video -> Video -> Bool
estanRelacionados video1 = any (flip tieneHashtag video1) .hashtags 

recomendable :: Video -> Playlist -> Bool
--recomendable video = (>=2) . length . filter (==True) . map (estanRelacionados video) .videos 
recomendable video = alMenos2 (estanRelacionados video) . videos

alMenos2 :: (a -> Bool) -> [a] -> Bool
alMenos2 criterio = (>=2) . length . filter criterio 

agregarVideosRecomendados :: [Video] -> Playlist -> Playlist
agregarVideosRecomendados lista playlist = foldr (agregarAPlaylistSoloSi recomendable) playlist lista

--video1 = Video "si" 23 ["afa", "hola"]
--video2 = Video "no" 12 ["afax", "holax"]
--video3 = Video "no" 12 ["afa", "holax"]
--playlistPrueba = Playlist "primera" [video1, video2]
--listaVideos = [video1, video2, video3]