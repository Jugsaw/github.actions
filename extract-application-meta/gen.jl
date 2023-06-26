using Pkg

# cd(get(ENV, "INPUT_DIR", "."))

# Pkg.activate(".")
# Pkg.instantiate()

# include(joinpath(pwd(), "app.jl")) # !!! without joinpath, `app.jl` is resolved to `/app.jl`

# using Jugsaw.Template: docker_config
# using JugsawIR: julia2ir

# dockerfile = docker_config(; juliaversion=VERSION)
# demos, types = julia2ir(app)
# demos, types = escape_string(demos), escape_string(types)

dockerfile = "A"
demos, types = "B", "C"

# outputs
DEMOS = "demos"
TYPES = "types"
DOCKERFILE = "dockerfile"

# https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#multiline-strings
using Random: randstring
open(ENV["GITHUB_OUTPUT"], "a") do io
    delimiter = randstring()
    println(
        io,
        """
        $DOCKERFILE<<$delimiter
        $dockerfile
        $delimiter
        """
    )
    println(io, "$DEMOS=$demos")
    println(io, "$TYPES=$types")
end