namespace :fetch_products do
  desc "TODO"
 task fetch_from_amazon: :environment do
	api_client = ProxyCrawl::ScraperAPI.new(token: 'gtXvsQAFqWMRM6uYfWsyZg')
 	serp_urls = Url.where(is_processed: false)
	serp_urls.each do |serp_url|
		puts "'''''''''''''''''"
	 	total_pages = 1
		next_page = 0
		current_page = 1
		page_param = ""

 		loop do #pagination loop		 		
			 begin
			 	options = {
				  user_agent: 'Mozilla/5.0 (Windows NT 6.2; rv:20.0) Gecko/20121202 Firefox/30.0',
				  format: 'json'
				}
				page_param = "&page=#{next_page}" if next_page > 0
				puts page_param

		
			 response = api_client.get("#{serp_url[:url]}#{page_param}&scraper=amazon-serp", options)

			 json_response = JSON.parse(response.body)
			 remaining_requests = json_response["remaining_requests"]
			 original_status = json_response["original_status"]
			 pc_status = json_response["pc_status"]
			 total_pages = json_response["body"]["pagination"]["totalPages"].to_i if current_page == 1
			 next_page = json_response["body"]["pagination"]["nextPage"].to_i
			 current_page = json_response["body"]["pagination"]["currentPage"].to_i
				
				

			if original_status == 200 and pc_status == 200	 
			 	products = json_response["body"]["products"]
			 	#product = JSON.parse(response.body)["body"]["products"].first
				if products.present?
				 	products.each do |product|
						puts product["name"]
						puts "************************"
						price = 0.0
						price = product["price"].gsub(/[^\d\.]/, '').to_f if product["price"].present?
						db_product = Product.find_or_initialize_by(asin:product["asin"])
						db_product.update({name:product["name"], price: price, customer_review:product["customerReview"], customer_review_count:product["customerReviewCount"], shipping_message:product["shippingMessage"], asin:product["asin"], image:product["image"], url:product["url"], is_prime:product["isPrime"], sponsored_ad:product["sponsoredAd"], coupon_info:product["couponInfo"], badges_info:product["badgesInfo"]})
						puts "Product Created?: #{db_product.save}"
						puts "Product Created?: #{db_product.errors.full_messages}"


					 end			 		
			 	end
			 end

			if current_page >= total_pages and remaining_requests > 1
				puts "total_pages: #{total_pages}"
				puts "current_page: #{current_page}"
				puts "remaining_requests: #{remaining_requests}"
				puts "next_page: #{next_page}"
				break
			end
		end

		  # puts response
		  # puts response.status_code
		  # puts response.original_status
		  # puts response.pc_status
		  # puts response.body
		rescue => exception
		  puts exception.message
		  puts exception.backtrace
		  break
		end
	end
  end
end
