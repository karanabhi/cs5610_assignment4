defmodule Calc do

  @moduledoc """
  Documentation for Calc.

  """
  

  def main() do
    name= IO.gets ">"
    eval(name)
    main()
  end

  def eval(str) do
    calculate(str)
  end

  def calculate(str) do
    elements=String.split(String.trim(str)," ")
    elements=Enum.map(elements, fn(x)-> x end)
    {num1,_}=:string.to_integer(Enum.at(elements,0))
    ops=Enum.at(elements,1)
    {num2,_}=:string.to_integer(Enum.at(elements,2))

    ans=
      cond do
        ops=="+"->add1(num1,num2)
        ops=="-"->sub1(num1,num2)
        ops=="*"->mul1(num1,num2)
        ops=="/"->div1(num1,num2)
      end
      elements=Enum.drop(elements,3)
      elements= [Integer.to_string(ans) | elements]
      len=Enum.count(elements)
      elements=Enum.join(elements," ")

      cond do
        len == 1-> IO.puts elements
        true -> eval(elements)
      end
    end

    def add1(a, b) do
      a + b
    end

    def sub1(a, b) do
      a - b
    end

    def div1(a, b) do
      a / b
    end

    def mul1(a, b) do
      a * b
    end
  end
