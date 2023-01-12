using GoL
using GLMakie

gol = Gol(zeros(640, 360));
gol.grid[:,30] .= 1;

fig, ax, hm = heatmap(gol.grid, colormap=:oleron, axis=(aspect=DataAspect(),));
hidedecorations!(ax);
display(fig)

stop = Observable(false);
on(events(fig).keyboardbutton) do event
    if event.action == Keyboard.press && event.key == Keyboard.escape
        stop[] = true; notify(stop)
    end
end;

stop[] = false;
while !stop[]
    life_step_1!(gol)
    hm[3][] = gol.grid
    sleep(0.05)
end

# using ProgressMeter
# gol = Gol(zeros(32, 24))
# gol.grid[:,20] .= 1
# fig, ax, hm = heatmap(gol.grid, colormap=:oleron, axis=(aspect=DataAspect(),))
# hidedecorations!(ax)
# n = 35
# p = Progress(n)
# record(fig, "outputs/GoL_32x24.gif", 1:n; framerate=2) do frame
#     life_step_1!(gol)
#     hm[3][] = gol.grid
#     next!(p)
#     sleep(0.5)
# end

