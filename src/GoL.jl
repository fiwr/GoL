# https://jakevdp.github.io/blog/2013/08/07/conways-game-of-life/
module GoL

export Gol
export random_init!, life_step_1!

mutable struct Gol
    grid::BitMatrix
    gridnext::BitMatrix
    function Gol(grid)
        new(grid, copy(grid))
    end
end
Base.size(g::Gol) = Base.size(g.grid)

function random_init!(gol::Gol)
    gol.grid = rand(Bool, size(gol))
end

function life_step_1!(gol::Gol)
    xmax, ymax = size(gol)
    for x=1:xmax, y=1:ymax
        CIs = CartesianIndices((
            max(1,x-1):min(xmax,x+1), 
            max(1,y-1):min(ymax,y+1)
        ))
        nbrs_count = 0
        for ci in CIs
            if ci.I != (x, y)
                nbrs_count += gol.grid[ci] == true
            end
        end
        gol.gridnext[x,y] = (
            (nbrs_count == 3) || 
            (gol.grid[x,y] && nbrs_count == 2)
        )
    end
    gol.grid, gol.gridnext = gol.gridnext, gol.grid
end

end # module GoL
