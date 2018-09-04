module Main exposing (..)

import Basics
import Html exposing (div, h1, h2, p, program, span, text)
import Html.Attributes exposing (class, style)
import Images exposing (getImageByIndex, images)
import Random
import Task exposing (perform, succeed)


main =
    program
        { init = init
        , subscriptions = subscriptions
        , view = view
        , update = update
        }


type alias Model =
    { background : String
    }


type Msg
    = RandomizeStart
    | GenerateBackground Int


init : ( Model, Cmd Msg )
init =
    ( Model "", perform (\_ -> RandomizeStart) (succeed ()) )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RandomizeStart ->
            let
                range =
                    Random.int 1 (List.length images)
            in
            ( model, Random.generate GenerateBackground range )

        GenerateBackground index ->
            let
                background =
                    getBackgroundImage index
            in
            ( { model | background = background }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


renderMainHeader : String -> Html.Html msg
renderMainHeader content =
    h1 [] [ text content ]


getBackgroundImage index =
    let
        image =
            getImageByIndex index
    in
    case image of
        Nothing ->
            ""

        Just url ->
            url


view : Model -> Html.Html Msg
view model =
    div
        [ class "splash"
        , style [ ( "backgroundImage", "url(" ++ model.background ++ ")" ) ]
        ]
        [ renderMainHeader "NEXT EXTREME EVENTS"
        , div [ class "wrapper" ]
            [ div [ class "container" ]
                [ div [ class "card" ]
                    [ h2 []
                        [ text "Extreme Chat Paintball"
                        , span [ class "date" ] [ text " Date and time TBD" ]
                        ]
                    , p [ class "address" ] [ text "last this year" ]
                    ]
                ]
            ]
        ]
