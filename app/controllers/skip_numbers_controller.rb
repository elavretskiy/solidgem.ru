class SkipNumbersController < ApplicationController
  respond_to :js

  def find_numbers
    string = params[:string]
    string.delete!(' ')

    @array = string.split(',')
    @array.map! { |a| a.to_i }
    @size = @array.size

    @skip_numbers = []
    @skip_numbers << find(0, @size, 0)
    if @skip_numbers[0] + 1 == @array[@skip_numbers[0] - 1] && @skip_numbers[0] != 0
      if @size - @skip_numbers[0] >= 1
        @skip_numbers << find(@skip_numbers[0], @size - @skip_numbers[0], 1)
      end
    else
      @skip_numbers << @skip_numbers[0] + 1 if @skip_numbers[0] != 0
    end
  end

  private

  def find(first, size, step)
    @number = first + size

    if @array[@number - 1] == @number + step
      new_size = @size - size

      if @array[@number] == @number + 1 + step
        find(first + size + step, new_size / 2, step)
      else
        @number < @size ? @array[@number - 1] + 1 : 0
      end
    else
      size >= 1 ? find(first, size / 2, step) : 1
    end
  end
end
