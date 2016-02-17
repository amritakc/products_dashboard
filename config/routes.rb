Rails.application.routes.draw do
  get 'products' => 'products#index'

  get 'products/new' => 'products#new'

   get 'products/:id/edit' => 'products#edit'
    get 'products/:id' => 'products#show'
     get 'comments' => 'comments#index' 

  post 'products/new' => 'products#create'




 
  
  patch 'products/:id' => 'products#update'

  delete 'products/:id' => 'products#destroy'

 

  post '/new_comment/:id' => 'comments#new_comment'

end
