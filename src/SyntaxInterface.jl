module SyntaxInterface

"""
    istree(x)

Returns `true` if `x` is a term. If true, `operation`, `arguments`
must also be defined for `x` appropriately.
"""
istree(x) = false
export istree

"""
    operation(x)

If `x` is a term as defined by `istree(x)`, `operation(x)` returns the
head of the term if `x` represents a function call, for example, the head
is the function being called.
"""
function operation end
export operation

"""
    arguments(x)

Get the arguments of `x`, must be defined if `istree(x)` is `true`.
"""
function arguments end
export arguments

"""
    arity(x)

Returns the number of arguments of `x`. Implicitly defined 
if `arguments(x)` is defined.
"""
arity(x) = length(arguments(x))
export arity

"""
    similarterm(x::T, head, args)

Returns a term that is in the same closure of nodes with type `T`, with `head`
as the head and `args` as the arguments. By default this will execute
`head(args...)`.

Do not overload directly, overload `similarterm(::Type{<:T}, ...)` instead.
"""
similarterm(x, head, args) = similarterm(typeof(x), head, args)

"""
    similarterm(::Type{T}, head, args)

Returns a term that is in the same closure of nodes with type `T`, with `head` as the
head and `args` as the arguments. By default this will execute `head(args...)`.
"""
function similarterm(::Type{T}, head, args) where {T}
    head(args...)
end
export similarterm

include("utils.jl")

include("expr.jl")

end # module

