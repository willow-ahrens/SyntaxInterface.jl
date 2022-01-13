# SyntaxInterface

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://peterahrens.github.io/SyntaxInterface.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://peterahrens.github.io/SyntaxInterface.jl/dev)
[![Build Status](https://github.com/peterahrens/SyntaxInterface.jl/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/peterahrens/SyntaxInterface.jl/actions/workflows/ci.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/peterahrens/SyntaxInterface.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/peterahrens/SyntaxInterface.jl)

This package contains simple definitions for common functions that are useful for symbolic expression manipulation. This package is a simplified fork of [TermInterface.jl](https://github.com/JuliaSymbolics/TermInterface.jl)

## Docs
You should define the following methods for an expression tree type `T` to
implement SyntaxInterface.jl

#### `istree(x::T)`

Check if `x` represents an expression tree. If returns true,
it will be assumed that `operation(::T)` and `arguments(::T)`
methods are defined.


#### `operation(x::T)`

Returns the head (a function object) performed by an expression
tree. Called only if `istree(::T)` is true. 

#### `arguments(x::T)`

Returns the arguments (a `Vector`) for an expression tree.
Called only if `istree(x)` is `true`. 

In addition, the methods for `Base.hash` and `Base.isequal` should also be implemented by the types for the purposes of substitution and equality matching respectively.

#### `similarterm(x::T, f, args)`

Construct a new term with the operation `f` and arguments `args`, the term should be similar to `x` in type. If not specified, the result is computed as `f(args...)`. This method helps avoid splatting. To define this method for your term type, define `similarterm(::Type{T}, ...)`.