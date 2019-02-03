class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url").strip
    }

    
 
client = Algorithmia.client('sim4JnnnVrZ6uwTGT4iOTQ99ePD1')
algo = client.algo('deeplearning/ColorfulImageColorization/1.1.13')
result = algo.pipe(input).result
    
    @original_image_url = params.fetch("image_url").strip
    @colorized_image_url = result.fetch("output").gsub("data://", "https://algorithmia.com/v1/data/").strip

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize_templates/colorize.html.erb")
  end

  def colorize_form
    render("colorize_templates/colorize_form.html.erb")
  end
end
