module FractalArt.SimpleCommandParser where

import Data.Char

type Args = [String]

type Name      = String
type ShortName = Char
type Parse a   = String -> Maybe a

data Arg a = Arg  Name ShortName (Parse a) 
data Flag  = Flag Name ShortName 

def :: Maybe a -> a -> a
def (Just x) _ = x
def Nothing  d = d

search :: String -> Char -> Args -> [String]
search name sname = dropWhile (not . comp)
  where
    comp a = map toLower a == ("--" ++ map toLower name)
          || a             == ("-"  ++ [sname]) 

parseFlag :: Flag -> Args -> Bool
parseFlag (Flag name sname) args = res
  where
    res = not $ null $ search name sname args

parseArg :: Arg a -> Args -> Maybe a
parseArg (Arg name sname f) args = res >>= f
  where
    res = case search name sname args of
        (_:arg:_) -> Just arg
        _         -> Nothing

