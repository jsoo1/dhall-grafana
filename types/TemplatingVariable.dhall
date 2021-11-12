let VariableType =
    < query
    | datasource
    | interval
    | custom
    | constant
    | adhoc
    | textbox >

let Option : Type -> Type = \(a : Type) -> { selected : Bool, text : a, value : a }
let Current = Option

let TemplatingVariableBase =
    { hide: Natural
    , label: Optional Text
    , description : Optional Text
    , name: Text
    , skipUrlSync: Bool
    , type : VariableType
    }

let QueryVariable =
    TemplatingVariableBase //\\
    { query: Text
    , allValue: Optional Text
    , includeAll: Bool
    , multi: Bool
    , regex: Text
    , sort: Natural
    , refresh : Natural
    , options: List (Option Text)
    , datasource: Text
    , current: Optional (Current Text)
    , useTags: Bool
    }

let IntervalVariable =
    TemplatingVariableBase //\\
    { query: Text
    , auto : Optional Bool
    , auto_count : Optional Natural
    , auto_min : Optional Text
    , options: List (Option Text)
    , current: Optional (Current Text)
    }

let DatasourceVariable =
    TemplatingVariableBase //\\
    { query : Text
    , includeAll : Bool
    , multi : Bool
    , regex: Text
    , options: List (Option Text)
    , current: Optional (Current Text)
    }

let CustomVariable =
    TemplatingVariableBase //\\
    { query: Text
    , allValue: Optional Text
    , includeAll: Bool
    , multi: Bool
    , options: List (Option Text)
    , current: Optional (Current Text)
    }

let CustomMultiVariable =
    TemplatingVariableBase //\\
    { query: Text
    , allValue: Optional Text
    , includeAll: Bool
    , multi: Bool
    , options: List (Option Text)
    , current: Current (List Text)
    }

let ConstantVariable =
    TemplatingVariableBase //\\
    { query : Text
    , options: List (Option Text)
    , current: Optional (Current Text)
    }

let TextboxVariable =
    TemplatingVariableBase //\\
    { query : Text
    , options: List (Option Text)
    , current: Optional (Current Text)
    }

let AdHocVariable =
    TemplatingVariableBase //\\
    { filters : List { key : Text, operator : Text, value : Text}
    , datasource : Text
    }

let Types =
    < QueryVariable : QueryVariable
    | IntervalVariable : IntervalVariable
    | DatasourceVariable : DatasourceVariable
    | CustomVariable : CustomVariable
    | CustomMultiVariable : CustomMultiVariable
    | ConstantVariable : ConstantVariable
    | TextboxVariable : TextboxVariable
    | AdHocVariable : AdHocVariable
    >

in

{ Types = Types
, VariableType = VariableType
, Current
, Option
, QueryVariable
, IntervalVariable
, DatasourceVariable
, CustomVariable
, ConstantVariable
, TextboxVariable
, AdHocVariable
}
