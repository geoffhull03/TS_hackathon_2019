class NavHeader
	include Rails.application.routes.url_helpers
	include ActionView::Helpers

	def initialize(options = {})
		@active_tool = options[:active]
	end

	def html
		content = [
			"<div class=\"core-l-tool-header\">"
		]

		content << link_to("<span class=\"core-l-tool-header__icon\">
			      <i class=\"ci ci-arrow-left\"></i>
			    </span>".html_safe, root_path)

  	content << "<h1 class=\"core-l-tool-header__title\">
    			Origin Data Viewer
  			</h1>
  			<div class=\"core-l-tool-header__tabs\">
    			<nav class=\"core-tabs\">"
		if @active_tool == :woc
			content << [
				"<li class=\"core-tabs__tab core-tabs__tab--active\">
	        <span class=\"core-tabs__link\">
	          <a href=\"/work_order_contracts\">Work Order Contracts</a>
	        </span>
	      </li>"
			]
		else
			content << [
				"<li class=\"core-tabs__tab\">
	        <span class=\"core-tabs__link\">
	          <a href=\"/work_order_contracts\">Work Order Contracts</a>
	        </span>
	      </li>"
			]
		end

		if @active_tool == :poc
			content << [
				"<li class=\"core-tabs__tab core-tabs__tab--active\">
	        <span class=\"core-tabs__link\">
	          <a href=\"/purchase_order_contracts\">Purchase Order Contracts</a>
	        </span>
	      </li>"
			]
		else
			content << [
				"<li class=\"core-tabs__tab\">
	        <span class=\"core-tabs__link\">
	          <a href=\"/purchase_order_contracts\">Purchase Order Contracts</a>
	        </span>
	      </li>"
			]
		end
		content << [
						"</ol>
			    </nav>
			  </div>
			</div>
			<hr class=\"wrapper\" />"
		]

		content.join("").html_safe
	end
end