class ImageTagController < ApplicationController
  def image_tag
    input = {
      image: params.fetch("image_url").strip
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    client = Algorithmia.client('sim4JnnnVrZ6uwTGT4iOTQ99ePD1')
    algo = client.algo('deeplearning/IllustrationTagger/0.4.0')
    result = algo.pipe(input).result


    @original_image_url = params.fetch("image_url").strip
    @tag_hashes = result.fetch("general")

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("image_tag_templates/image_tag.html.erb")
  end

  def image_tag_form
    render("image_tag_templates/image_tag_form.html.erb")
  end
end
