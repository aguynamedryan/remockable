describe :validate_inclusion_of do
  let(:validator_name) { :inclusion }
  let(:default_options) { { in: [true, false] } }

  it_behaves_like 'a validation matcher' do
    with_option :allow_blank, true, false
    with_option :allow_nil, true, false
    with_option :in, [true, false], %w(male female)
    with_option :message, 'is not in list!', 'invalid'

    with_conditional_option :if
    with_conditional_option :unless
  end
end
