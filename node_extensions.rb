# This module contains our custom syntax node classes. Each
# class represents a distinct type of entity. Each clas
# also has a distinct to_array method which allows the 
# final AST to be converted easily into a structured array
# representatiion

module Sexp
  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value.to_i
    end
  end
  
  class StringLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      return eval self.text_value
    end
  end
  
  class FloatLiteral < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value.to_f
    end
  end
  
  class Identifier < Treetop::Runtime::SyntaxNode
    def to_array
      return self.text_value.to_sym
    end
  end
  
  class Expression < Treetop::Runtime::SyntaxNode
    def to_array
      return self.elements[0].to_array
    end
  end
  
  class Body < Treetop::Runtime::SyntaxNode
    def to_array
      return self.elements.map {|x| x.to_array}
    end
  end
end