class EntityTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
  	unless ["Startup", "Investor", "Accelerator", "Co-worker", "R&D Center", "Service"].any?{ |o| value.to_s =~ /\b#{Regexp.escape(o)}\b/ }
      record.errors[attribute] << (options[:message] || "wrong type signature")
    end
  end
end
