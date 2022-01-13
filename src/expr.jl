# This file contains default definitions for SyntaxInterface methods on Julia
# Builtin Expr type.

struct Call
    fn
end

(cll::Call)(args...) = Expr(:call, cll.fn, args...)

struct Macro
    fn
end

(mcr::Macro)(args...) = Expr(:macrocall, ref.fn, args...)

struct Access
    arr
end

(ref::Access)(args...) = Expr(:ref, ref.arr, args...)

struct Syntax
    head
end

(syn::Syntax)(args...) = Expr(syn.head, args...)

istree(x::Expr) = true

operation(e::Expr) = expr_operation(e, Val{e.head}())
arguments(e::Expr) = expr_arguments(e, Val{e.head}())

# See https://docs.julialang.org/en/v1/devdocs/ast/
expr_operation(e::Expr, ::Val{:call}) = Call(e.args[1])
expr_operation(e::Expr, ::Val{:macrocall}) = Macro(e.args[1])
expr_operation(e::Expr, ::Val{:ref}) = Access(e.args[1])
expr_operation(e::Expr, ::Val{T}) where {T} = Syntax(T)

expr_arguments(e::Expr, ::Union{Val{:call}, Val{:macrocall}, Val{:ref}}) = e.args[2:end]
expr_arguments(e::Expr, _) = e.args

function similarterm(x::Type{<:Expr}, head::Call, args)
    Expr(:call, head.fn, args...)
end

function similarterm(x::Type{<:Expr}, head::Macro, args)
    Expr(:macrocall, head.fn, args...)
end

function similarterm(x::Type{<:Expr}, head::Access, args)
    Expr(:ref, head.arr, args...)
end

function similarterm(x::Type{<:Expr}, head::Syntax, args)
    Expr(head.head, args...)
end