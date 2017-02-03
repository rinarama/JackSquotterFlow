def self.update_or_create(attributes)
  assign_or_new(attributes).save
end
