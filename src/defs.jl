# Engine Geometry struct

struct Engine <: Any
    rSD::Float64        # =S/D
    rLR::Float64        # =L/R
    rv::Float64         # =Vmax/Vmin
    z::Int64            # #cyl.
    Vd::Unitful.Volume  # Swiped volume
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
        return new(rsd, rlr, rv, zz, uconvert(u"m^3", vd))
    end
end

