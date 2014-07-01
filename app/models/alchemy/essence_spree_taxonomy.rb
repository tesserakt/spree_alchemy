module Alchemy
  class EssenceSpreeTaxonomy < ActiveRecord::Base
    belongs_to :taxonomy, class_name: "Spree::Taxonomy", foreign_key: 'taxonomy_id'

    acts_as_essence(
        ingredient_column: 'taxonomy_id',
        preview_text_method: 'name'
    )

    def ingredient
      taxonomy
    end
  end
end
