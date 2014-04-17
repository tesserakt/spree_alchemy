class CreateAlchemyEssenceSpreeTaxonomies < ActiveRecord::Migration
  def change
    create_table :alchemy_essence_spree_taxonomies do |t|
      t.references :taxonomy

      t.timestamps
    end
    add_index :alchemy_essence_spree_taxonomies, :taxonomy_id
  end
end
