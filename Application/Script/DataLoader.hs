#!/usr/bin/env run-script
module Application.Script.DataLoader where

import Application.Script.Prelude      hiding (decode, pack, (.:))
import qualified Data.ByteString.Lazy  as     BL
import Data.Csv
import Data.Text                              (pack)
import qualified Data.Vector           as     V
import Control.Monad                          (mzero)

parseProduct :: NamedRecord -> Parser Product
parseProduct r = do
  title <- r .: "title"
  price <- r .: "price"
  category <- r .: "category"

  newRecord @Product
    |> set #title title
    |> set #price price
    |> set #category category
    |> pure

run :: Script
run = do
    csvData <- BL.readFile "data/Boiler-en-kookkraan_Boiler.csv"
    case decodeByNameWithP parseProduct defaultDecodeOptions csvData of
        Left err -> putStrLn $ pack err
        Right (_, v) -> V.forM_ v $ \ p ->
--          let insertedProduct = (p |> createRecord)
          putStrLn $ (get #title p) ++ ", " ++ show (get #price p) ++ " euro"
