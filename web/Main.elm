import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Random

main =
  App.program
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view }

-- MODEL

type alias Model =
  { die1 : Int
  , die2 : Int}


init : (Model, Cmd Msg)
init = (Model 1 1, Cmd.none)

subscriptions :  Model -> Sub Msg
subscriptions model =
  Sub.none

-- UPDATE

type Msg
    = Roll
    | Show (Int, Int)


twoD6 = Random.pair (Random.int 1 6) (Random.int 1 6)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate Show twoD6)

    Show (a, b) ->
      (Model a b, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [
      h1 [] [ text (toString model.die1) ]
    , h1 [] [ text (toString model.die2) ]
    , button [ onClick Roll ] [ text "Roll" ]
    ]
