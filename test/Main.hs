{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text, splitOn, append, toUpper, toLower)
import Canopy


--run = runSession defaultSession capabilities $ do
--    url "http://stackoverflow.com"
--    e1 <- find "#nav-questions"
--    click e1


main :: IO()
main = do
    start firefox $ do
        url "http://lefthandedgoat.github.io/canopy/testpages/"
        click "#button"
        "#button_clicked" `equals` "button clicked"
        "#button_clicked" === "button clicked"
        "#ajax" === "ajax loaded"

        url "http://www.reddit.com/"
        on "http://www.reddit.com/"
        reload
        on "http://www.reddit.com/"


--run :: Test.WebDriver.wd -> ()
--run browser =
