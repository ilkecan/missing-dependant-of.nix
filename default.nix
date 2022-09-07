let
  inherit (builtins)
    mapAttrs
  ;

  quote = str:
    "'${str}'";
in

mapAttrs (dependency: dependants:
  let
    dependency' = quote dependency;
    dependants' = "[ ${toString (map quote dependants)} ]";
  in
  throw "must be called with either ${dependency'} or all of ${dependants'}"
)
