class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.sort.first

    @maximum = @numbers.sort.reverse.first

    @range = @maximum - @minimum

    # Median
    # ======

      def median(array)
        sorted = array.sort
        len = sorted.length
        (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
      end

    @median = median(@numbers)

    @sum = @numbers.sum
    
      def mean(array)
        array.sum / array.count
      end
      
    @mean = mean(@numbers)

    # Variance
    # ========

    def variance(x)
      m = mean(x)
      sum = 0.0
      x.each {|v| sum += (v-m)**2 }
      sum/x.size
    end

    @variance = variance(@numbers)

    

    def sigma(array)
      Math.sqrt(variance(array))
    end

    @standard_deviation = sigma(@numbers)

    # Mode
    # ====

     
    def mode(array)
    end  

    @mode = "Replace this string with your answer"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
