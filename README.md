# Spree-Alchemy Integration

Use this connector if you want to have Spree handle the frontend of your app, but also want to pepper in bits and pieces of CMS content.

### Features:

1. Relies on Spree Authentication, giving you a unified user system. Spree Admins can access Alchemy
2. You can inject dynamic content into product and taxon pages (i.e. a "story" section on a t-shirt page)
3. You can create whole pages like /about-us and have alchemy control that content

## Spree

This version runs with Spreecommerce 2.2. I want to get this gem on semantic versioning soon.

## Alchemy

This version runs with Alchemy 3.0

## Installation

Add this line to your application's Gemfile:

    gem 'alchemy_cms', git: 'git@github.com:magiclabs/alchemy_cms.git'
    gem 'spree-alchemy', git: 'git@github.com:tesserakt/spree_alchemy.git'

And then execute:

    $ bundle

Install the migrations:

    $ rake spree_alchemy:install:migrations

Migrate the database:

    $ rake db:migrate

## Routes

In your main app's routes.rb file you will need to mount Spree at the root '/'. We also like to mount Alchemy at /cms.
If you have Alchemy generate any whole pages, you will want your main app to route any unknown routes to Alchemy. For example,
if you want an About Us page, you want to capture mysite.com/about-us and have alchemy take care of this.   This "catch all" route will
need to be the last route in your routes.rb file


    mount Spree::Core::Engine, at: '/'
    mount Alchemy::Engine, at: '/cms'

    # These routes get mounted last in your app!
    get '/:lang' => 'alchemy/pages#show',
       :constraints => {:lang => /[a-z]{2}(-[a-z]{2})?/},
       :as => :show_language_root

    # The page show action has to be last route
    get '(/:lang)/*urlname(.:format)' => 'alchemy/pages#show',
        :constraints => {:lang => /[a-z]{2}(-[a-z]{2})?/},
        :as => :show_page


## Usage

To inject dynamic content into a page, you will create a page that has a Product Essence and associate that page with the product you want.
Once you have done this, you can add a decorator to the Spree Products controller that will load the page associated with the current product.

In your products controller show action decorator:

    essence =  Alchemy::EssenceSpreeProduct.where(spree_product_id: @product.id).first
    @page = essence.pages.first

And in your view override or defacement:

    <%= render_elements %>

### Create a new Element for Alchemy

  # config/alchemy/elements.yml
  - name: product
    contents:
    - name: spree_product
      type: EssenceSpreeProduct

  - name: product_category
    contents:
    - name: spree_taxon
      type: EssenceSpreeTaxon


### Ensure that a layout contains the product element type!
in config/alchemy/page_layouts.yml

    - name: product_content_page
      cells: [slider]
      elements: [video_slide, image_slide, content_block, call_to_action, product]
      autogenerate: [video_slide, content_block, content_block, content_block, call_to_action]

### Generate the views

  $ rails g alchemy:elements --skip

### TODO

1. Search for page in Alchemy Admin by products associated
2. A product can be associated with many different layout types, so only allow one product per layout type per page.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Attribution

This plugin was inspired from the alchemy-spree gem developed at Magic Labs. In fact it is a rewrite of that gem.
Their focus is to have Alchemy rule the site and inject products into it. We prefer the other way around.
Also thank you to CandleScience for allowing me to publish this.