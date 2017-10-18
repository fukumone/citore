# == Schema Information
#
# Table name: homepage_accounts
#
#  id                 :integer          not null, primary key
#  homepage_access_id :integer          not null
#  type               :string(255)
#  uid                :string(255)      not null
#  token              :string(255)
#  token_secret       :string(255)
#  expired_at         :datetime
#  options            :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_homepage_accounts_on_uid  (uid)
#  unique_homepage_accounts_index  (homepage_access_id,type) UNIQUE
#

require 'test_helper'

class Homepage::AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
