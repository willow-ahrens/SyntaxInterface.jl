using SyntaxInterface
using Test

@testset "Expr" begin 
    ex = :(f(a,b))
    @test operation(ex) == :f
    @test arguments(ex) == [:a, :b]
    @test ex == similarterm(ex, :f, [:a, :b])

    ex = :(arr[i, j])
    @test operation(ex) == getindex
    @test arguments(ex) == [:arr, :i, :j]
    @test ex == similarterm(ex, :ref, [:arr, :i, :j])
end