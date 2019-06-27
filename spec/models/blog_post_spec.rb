require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  it { should have_many(:comments).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:author) }
end
