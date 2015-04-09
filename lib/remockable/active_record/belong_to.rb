RSpec::Matchers.define(:belong_to) do
  include Remockable::ActiveRecord::Helpers

  valid_options %w(
    autosave
    class_name
    counter_cache
    dependent
    foreign_key
    foreign_type
    inverse_of
    polymorphic
    primary_key
    touch
    validate
  )

  match do |actual|
    if association = subject.class.reflect_on_association(attribute)
      macro_matches = association.macro == :belongs_to
      options_match = association.options.slice(*options.keys) == options
      macro_matches && options_match
    end
  end

  failure_message do |actual|
    "Expected #{subject.class.name} to #{description}"
  end

  failure_message_when_negated do |actual|
    "Did not expect #{subject.class.name} to #{description}"
  end

  description do
    with = " with #{options.inspect}" if options.any?
    "belong to #{attribute}#{with}"
  end
end
