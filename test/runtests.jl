using SyntaxInterface
using SyntaxInterface: Call, Access
using Test

@testset "Expr" begin 
    ex = :(f(a,b))
    @test operation(ex) == Call(:f)
    @test arguments(ex) == [:a, :b]
    @test ex == similarterm(ex, Call(:f), [:a, :b])

    ex = :(arr[i, j])
    @test operation(ex) == Access(:arr)
    @test arguments(ex) == [:i, :j]
    @test ex == similarterm(ex, Access(:arr), [:i, :j])
end