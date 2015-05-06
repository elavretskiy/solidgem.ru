class FactorialController < ApplicationController
  respond_to :js

  def fact
    @number = params[:number].to_i

    @fact = if @number > 0
              recursive_fact(1, 1)
            else
              'error'
            end
  end

  private

  def recursive_fact(step, fact)
    @fact = if @number == step
              step * fact
            else
              recursive_fact(step + 1, step * fact)
            end
  end
end
