import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Json
import Task

main =
  App.program
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view }

-- MODEL

type alias Model =
  { name : String }

init : (Model, Cmd Msg)
init =
  (Model "", getNextName)

subscriptions :  Model -> Sub Msg
subscriptions model =
  Sub.none

-- UPDATE

type Msg
  = MorePlease
  | FetchSucceed String
  | FetchFail Http.Error

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MorePlease ->
      (model, getNextName)

    FetchSucceed newName ->
      (Model newName, Cmd.none)

    FetchFail _ ->
      (model, Cmd.none)

getNextName : Cmd Msg
getNextName =
  let
    url =
      "http://localhost:5000"
  in
    Task.perform FetchFail FetchSucceed (Http.get decodeName url)

decodeName : Json.Decoder String
decodeName =
  Json.at ["name"] Json.string


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ h2 [] [text model.name]
    , button [ onClick MorePlease ] [ text "Another!" ]
    ]
