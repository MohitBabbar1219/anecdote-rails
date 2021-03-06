require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:commentable) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:commenter) }
  it { should validate_presence_of(:commentable_id) }
  it { should validate_presence_of(:commentable_type) }
end
