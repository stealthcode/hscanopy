{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text, splitOn, append, toUpper, toLower)
import Canopy
import Test.WebDriver

--run = runSession defaultSession capabilities $ do
--    url "http://stackoverflow.com"
--    e1 <- find "#nav-questions"
--    click e1

capabilities = defaultCaps { browser = firefox }


main :: IO()
main = do
    runSession defaultSession capabilities $ do
        openPage "http://stackoverflow.com"
        e1 <- findElem $ ByCSS "#nav-questions"
        click e1

--run :: Test.WebDriver.wd -> ()
--run browser =
