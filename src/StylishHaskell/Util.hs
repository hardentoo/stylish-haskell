--------------------------------------------------------------------------------
module StylishHaskell.Util
    ( nameToString
    , padRight
    , everything
    ) where


--------------------------------------------------------------------------------
import           Data.Data                       (Data)
import qualified Data.Generics                   as G
import           Data.Maybe                      (maybeToList)
import           Data.Typeable                   (cast)
import qualified Language.Haskell.Exts.Annotated as H


--------------------------------------------------------------------------------
-- | TODO: put this in utilities?
nameToString :: H.Name l -> String
nameToString (H.Ident _ str)  = str
nameToString (H.Symbol _ str) = str


--------------------------------------------------------------------------------
padRight :: Int -> String -> String
padRight len str = str ++ replicate (len - length str) ' '


--------------------------------------------------------------------------------
everything :: (Data a, Data b) => a -> [b]
everything = G.everything (++) (maybeToList . cast)
