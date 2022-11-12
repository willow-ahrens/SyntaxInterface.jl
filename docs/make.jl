using SyntaxInterface
using Documenter

DocMeta.setdocmeta!(SyntaxInterface, :DocTestSetup, :(using SyntaxInterface); recursive=true)

makedocs(;
    modules=[SyntaxInterface],
    authors="Willow Ahrens",
    repo="https://github.com/willow-ahrens/SyntaxInterface.jl/blob/{commit}{path}#{line}",
    sitename="SyntaxInterface.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://willow-ahrens.github.io/SyntaxInterface.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/willow-ahrens/SyntaxInterface.jl",
    devbranch="main",
)
