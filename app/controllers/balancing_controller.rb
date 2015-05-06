class BalancingController < ApplicationController
  respond_to :js

  def balance
    @string = params[:string]
    @array = @string.split ''
    @array.delete_if { |a| a != ')' && a != '(' }

    @balance = if @array.size % 2 != 0
                 false
               else
                 @balance = 0

                 @array.each do |a|
                   if @balance >= 0
                     a == '(' ? @balance += 1 : @balance -= 1
                   else
                     break
                   end
                 end

                 @balance == 0 ? true : false
               end
  end
end
