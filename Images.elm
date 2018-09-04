module Images exposing (..)


images : List String
images =
    [ "./img/bar.jpg"
    , "./img/bokeh.jpg"
    , "./img/mountains.jpg"
    , "./img/night.jpg"
    ]


getImageByIndex : Int -> Maybe String
getImageByIndex index =
    if List.length images >= index then
        List.take index i mages
            |> List.reverse
            |> List.head
    else
        Nothing
