Vdu(y::Engine) = y.Vd / y.z

D(y::Engine) = cbrt((4Vdu(y))/(π*y.rSD))

S(y::Engine) = D(y) * y.rSD

R(y::Engine) = S(y) / 2

L(y::Engine) = y.rLR * R(y)

V0(y::Engine) = Vdu(y) / (y.rv - 1.0)

Vmax(y::Engine) = V0(y) + Vdu(y)

function x(y::Engine, α::Union{AbstractFloat,Irrational})
    α = Float64(α)
    L(y) * (1.0 - √(1.0 - (sin(α)/y.rLR)^2)) + R(y) * (1.0 - cos(α))
end

function V(y::Engine, α::Union{AbstractFloat,Irrational})
    α = Float64(α)
    V0(y) + (π/4) * x(y, α) * D(y)^2
end

function dVdα(y::Engine, α::Union{AbstractFloat,Irrational}, ϵ::Float64 = ∛eps(abs(Float64(α))))
    α = Float64(α)
    (V(y, α+ϵ) - V(y, α-ϵ)) / (2ϵ)
end

export Vdu, D, S, R, L, V0, Vmax
export x, V, dVdα

