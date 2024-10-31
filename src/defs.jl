# Engine Geometry struct

struct Engine <: Any
    rSD::Float64                    # =S/D
    rLR::Float64                    # =L/R
    rv::Float64                     # =Vmax/Vmin
    z::Int64                        # #cyl.
    Vd::Unitful.Volume{Float64}     # Swiped volume
    # Internal Constructor
    Engine(rsd::AbstractFloat,
           rlr::AbstractFloat,
           rv::AbstractFloat,
           zz::Integer,
           vd::Unitful.Volume) = begin
        @assert rsd > 0.0
        @assert rlr > 0.0
        @assert rv  > 0.0
        @assert zz  >=  1
        @assert vd  > 0.0 * u"m^3"
        return new(rsd, rlr, rv, zz,
                   Float64(uconvert(u"m^3", vd).val) * u"m^3")
    end
end

export Engine

Vdu(y::Engine) = y.Vd / y.z

D(y::Engine) = cbrt((4Vdu(y))/(π*y.rSD))

S(y::Engine) = D(y) * y.rSD

R(y::Engine) = S(y) / 2

L(y::Engine) = y.rLR * R(y)

V0(y::Engine) = Vdu(y) / (y.rv - 1.0)

Vmax(y::Engine) = V0(y) + Vdu(y)

export Vdu, D, S, R, L, V0, Vmax

function x(y::Engine, α::Float64)
    L(y) * (1.0 - √(1.0 - (sin(α)/y.rLR)^2)) + R(y) * (1.0 - cos(α))
end

function V(y::Engine, α::Float64)
    V0(y) + (π/4) * x(y, α) * D(y)
end

export x, V

