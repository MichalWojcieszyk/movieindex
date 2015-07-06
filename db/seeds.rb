# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

#michal = User.find_by_email("mwojcieszyk@gmail.com")
#michal.admin = true
#michal.save!

formats = %w(Beta VHS IMAX HD SuperHD 4K DVD BlueRay)
images = %w(amelia.jpg umathurman.jpg)

Movie.destroy_all

100.times do 
	movie = Movie.create(:name => "#{Company.bs}",
	 					:director => "#{Name.name}", 
	 					:description => Lorem.paragraphs.join("<br/>").html_safe,
	 					:year => rand(1940..2015), 
	 					:length => rand(20..240), 
	 					:format => formats[ rand(formats.length)],
	 					:image => "movies/" + images[ rand(images.length)],
	 					:thumbnail => "movies/" + images[rand(images.length)]
	 					)
	movie.save
	if(! movie.nil?)
		(rand(0..10)).times do 
			movie.comments.create(  :author => "#{Name.name}", 
							:title => "#{Company.bs}",
							:content => Lorem.sentences(3).join("<br/>").html_safe,
							:rating => rand(1..5)
							)
		end
	end
puts movie.inspect
end
#

1.times do
	category = Category.create(:name => "#{Commerce.department}"
							  )
	category.save
	5.times do		 
		category.products.create(:title => "#{Commerce.product_name}",
						         :description => Lorem.sentences(3).join("<br/>").html_safe,
						   		 :price => rand(1..50000)
						   		)
	    #category.products.save
		5.times do
			product.reviews.create(:content => Lorem.sentences(1).html_safe,
									          :rating => rand(1..5)
									 		 )
		end
	end

end