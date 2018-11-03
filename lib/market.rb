class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(food)
    @vendors.find_all do |vendor|
      vendor.inventory.has_key?(food)
    end
  end

  def sorted_item_list
    new_list = @vendors.map do |vendor|
      vendor.inventory.keys
    end
    new_list.flatten.uniq.sort
  end

  def total_inventory
    new_map = @vendors.map do |vendor|
      vendor.inventory
    end
    new_hash = Hash.new(0)
    new_map.map do |stock|
      stock.each do |key, value|
        if new_hash.keys.include?(key)
          new_hash[key] += value
        else
          new_hash[key] = value
        end
      end
    end
    new_hash
  end
end
