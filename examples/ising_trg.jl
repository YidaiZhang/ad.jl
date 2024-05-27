using ad
using ad.TensorOperations
using ad.Plots

Dcut = 30
n = 30

ts = 2.5:-0.01:2;
β = inv.(ts);
@show "=====TRG======"
lnZ = []
for K in β
    t = 1.0/K
    #T = Ising( K )
    y = TRG(K, Dcut, n);
    #@show lnZ
    println(1/K, " ", y/2^n)
    push!(lnZ,y/2^n)
end
F = - ts.* lnZ

# taking the first derivative
dF = - diff(lnZ)./diff(β)

# plotting
plot(β[1:end-1], dF, label="energy density", xlabel="β", ylabel="energy density", title="reproduce", seriestype=:line)
scatter!(β[1:end-1], dF, label="-∂lnZ/∂β")

# save figure
savefig("energy_density.png")

# taking the second derivative
# taking the second derivative with β^2
dS = - β[1:end-2].^2 .* diff(dF)./diff(β[1:end-1])

plot(β[1:end-2], dS, label="specific heat", xlabel="β", ylabel="specific heat", title="reproduce", seriestype=:line)
scatter!(β[1:end-2], dS, label="β^2(∂^2lnZ/∂β^2)")

# save figure
savefig("specific_heat.png")