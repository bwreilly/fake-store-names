import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit, onClick)
import String
import Char exposing (isDigit, isLower, isUpper)


main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { name : String
  , age : String
  , password : String
  , passwordAgain : String
  , error : String
  }


model : Model
model =
  Model "" "" "" "" ""


-- UPDATE

type Msg
    = Name String
    | Age String
    | Password String
    | PasswordAgain String
    | RunValidation Model


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Age age ->
      { model | age = age }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

    RunValidation model ->
      { model | error = (validate model) }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [
      input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "text", placeholder "Age", onInput Age ] []
    , input [ type' "password", placeholder "Password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , button [ onClick (RunValidation model) ] [ text "What the heck" ]
    , div [ style [("color", "red")] ] [ text model.error ]
    ]

validate : Model -> String
validate model =
  if model.password /= model.passwordAgain then
    "Passwords do not match"
  else if String.length model.password < 8 then
    "Password too short"
  else if not (String.any isDigit model.password) then
    "Password lacks a numeric digit"
  else if not (String.any isLower model.password) then
    "Password lacks a lower case character"
  else if not (String.any isUpper model.password) then
    "Password lacks an upper case character"
  else if not (List.all isDigit (String.toList model.age)) then
    "Age must be a number"
  else
    ""
