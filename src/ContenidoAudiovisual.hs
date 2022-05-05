module ContenidoAudiovisual where

data Video = Video {
  titulo :: String,
  minutos :: Int,
  hashtags :: [String]
} deriving (Show, Eq)

data Playlist = Playlist {
  descripcion :: String,
  videos :: [Video]
} deriving (Show, Eq)

agregarAPlaylist :: Video -> Playlist -> Playlist
agregarAPlaylist video (Playlist descripcion videos) = Playlist descripcion (video : videos)

agregarAPlaylistSoloSi :: (Video -> Playlist -> Bool) -> Video -> Playlist -> Playlist
agregarAPlaylistSoloSi criterio video playlist
  | criterio video playlist = agregarAPlaylist video playlist
  | otherwise = playlist