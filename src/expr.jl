# This file contains default definitions for SyntaxInterface methods on Julia
# Builtin Expr type.

istree(x::QuoteNode) = false
istree(x::Symbol) = false
istree(x::Expr) = true

operation(e::Expr) = e.head
arguments(e::Expr) = e.args

function similarterm(x::Type{<:Expr}, head::Symbol, args)
    Expr(head, args...)
end