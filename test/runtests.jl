using GoL
using Test

g0 = Bool[
    0 0 1 0 0;
    0 0 1 0 0;
    0 0 1 0 0;
    0 0 1 0 0;
    0 0 1 0 0;
]

g1 = Bool[
    0 0 0 0 0;
    0 1 1 1 0;
    0 1 1 1 0;
    0 1 1 1 0;
    0 0 0 0 0;
]

g2 = Bool[
    0 0 1 0 0;
    0 1 0 1 0;
    1 0 0 0 1;
    0 1 0 1 0;
    0 0 1 0 0;
]

@testset "CA update" begin
    gol = Gol(zeros(5,5))
    gol.grid[:, 3] .= 1
    @test gol.grid == g0
    life_step_1!(gol)
    @test gol.grid == g1
    life_step_1!(gol)
    @test gol.grid == g2
end