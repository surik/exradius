alias Exradius.Attributes
require Exradius.Attributes

:application.load(:eradius)
path = :code.priv_dir(:eradius) |> Path.join("dictionaries")
files = File.ls!(path)

lc file inlist files do
  Attributes.mk_dict(path, file) |> Code.compile_quoted(file)
end
