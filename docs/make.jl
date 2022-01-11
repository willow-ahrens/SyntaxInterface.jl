using SyntaxInterface
using Documenter

DocMeta.setdocmeta!(SyntaxInterface, :DocTestSetup, :(using SyntaxInterface); recursive=true)

makedocs(;
    modules=[SyntaxInterface],
    authors="Peter Ahrens",
    repo="https://github.com/peterahrens/SyntaxInterface.jl/blob/{commit}{path}#{line}",
    sitename="SyntaxInterface.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://peterahrens.github.io/SyntaxInterface.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/peterahrens/SyntaxInterface.jl",
    devbranch="main",
)
