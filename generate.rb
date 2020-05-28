require 'faker'

class GenerateNames
  def init
    row_header = "first_name\tlast_name\tcompany_name\tsales\taddress_1\taddress_2\tcity\tstate\tzip\tphone\tfax\tsic_code\n"
    file = File.open('companies.txt', 'w+') do |file|
      file.write(row_header)
      for i in 0..1000 do
        makeSecondaryAddress = i % 9 == 1 ? true : false
        a = CompanyContact.create(makeSecondaryAddress)
        file.write(a.to_s)
      end
    end
  end
end

class CompanyContact
  attr_accessor :first_name, :last_name, :company_name, :address_1, :address_2, :city, :state, :zip, :phone, :fax, :sic_code

  def self.create(makeSecondaryAddress)
    a = CompanyContact.new
    a.first_name = Faker::Name.first_name
    a.last_name = Faker::Name.last_name
    a.address_1= Faker::Address.street_address
    a.address_2 = Faker::Address.secondary_address if makeSecondaryAddress
    a.city = Faker::Address.city
    a.state = Faker::Address.state_abbr
    a.zip = Faker::Address.zip_code
    a.phone = Faker::PhoneNumber.cell_phone
    a.fax = Faker::PhoneNumber.phone_number
    a.company_name = Faker::Company.name
    a.sic_code = Faker::Company.sic_code
    return a
  end

  def sales
    val = rand(10001..199000)
    val.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

  def to_s 
    "#{first_name}\t#{last_name}\t#{company_name}\t$#{sales}\t#{address_1}\t#{address_2}\t#{city}\t#{state}\t#{zip}\t#{phone}\t#{fax}\t#{sic_code}\n"
  end
end
