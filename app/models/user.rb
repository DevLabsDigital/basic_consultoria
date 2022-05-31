Role = Struct.new(:label) do   
end
Company = Struct.new(:id, :name, :parent_id, :group_type?, :razao_social) do
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum user_scope: {saga_admin: "saga_admin" , company_user: "company_user" }

  has_one :profile, dependent: :destroy

  #create profile after user creation
  after_create :create_profile

  def create_profile
    Profile.create(user_id: self.id)
  end

  def companies
    return [self.company]
  end

  def company
    return Company.new(1, "Saga", nil, false, "Empr. LTDA")
  end

  def current_role
    return Role.new("admin")
  end

  def can_update_company?
    true
  end

  def consultoria_company_id
    return 1
  end
end

