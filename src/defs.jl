# Engine Geometry struct

struct Engine <: Any
    rSD::Float64        # =S/D
    rLR::Float64        # =L/R
    rv::Float64         # =Vmax/Vmin
    z::Int64            # #cyl.
    Vd::Unitful.Volume  # Swiped volume
end

