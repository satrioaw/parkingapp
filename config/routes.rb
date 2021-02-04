Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'parking/register'
	  post 'parking/checkout'      
	  post 'parking/sumbytype'      
	  post 'parking/sumbycolour'      
    end
  end
end