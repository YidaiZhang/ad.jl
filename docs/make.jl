using ad
using Documenter

DocMeta.setdocmeta!(ad, :DocTestSetup, :(using ad); recursive=true)

makedocs(;
    modules=[ad],
    authors="YidaiZhang",
    sitename="ad.jl",
    format=Documenter.HTML(;
        canonical="https://YidaiZhang.github.io/ad.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/YidaiZhang/ad.jl",
    devbranch="main",
)
