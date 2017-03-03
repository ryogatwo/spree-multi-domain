Spree::Admin::ProductsController.class_eval do
  update.before :set_stores

  def update
    store_ids = params[:product][:store_ids]
    if store_ids.present?
      params[:product][:store_ids] = store_ids.split(',')
    end
    super
  end

  private

  def set_stores
    @product.store_ids = nil unless params[:product].key? :store_ids
  end
end
