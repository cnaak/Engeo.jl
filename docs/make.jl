using Engeo
using Documenter

DocMeta.setdocmeta!(Engeo, :DocTestSetup, :(using Engeo); recursive=true)

makedocs(;
    modules=[Engeo],
    authors="C. Naaktgeboren <NaaktgeborenC.PhD@gmail.com> and contributors",
    sitename="Engeo.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
