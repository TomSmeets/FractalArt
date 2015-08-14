{-# LANGUAGE ForeignFunctionInterface #-}
module FractalArt.ForeignFunctions (setWallpaper, getScreenSize) where

import Foreign.C

foreign import ccall unsafe "set_wallpaper"     set_wallpaper'     :: CString -> IO ()
foreign import ccall unsafe "get_screen_size_x" get_screen_size_x' :: IO Int
foreign import ccall unsafe "get_screen_size_y" get_screen_size_y' :: IO Int

setWallpaper :: String -> IO ()
setWallpaper path = withCString path set_wallpaper'

getScreenSize :: IO (Int, Int)
getScreenSize = do
    x <- get_screen_size_x'
    y <- get_screen_size_y'
    return (x, y)
