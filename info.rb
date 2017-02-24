class Person 
  require 'date'
attr_accessor :dob, :first_name, :surname, :fullname, :phone_numbers, :relationship
attr_reader :emails, :phone_numbers
  
  def initialize (first_name ="Joe", surname ="Bloggs", dob = "01-01-1990")
    @dob = Date.parse(dob)
    @first_name = first_name.capitalize
    @surname = surname.capitalize
    @fullname = @first_name + ' ' + @surname
    @emails = []  
    @phone_numbers = []
  end
  def fullnum
    
  end
  def add_email(email)
    @emails.push(email)
  end

  def add_phone_num(phone_number)
    @phone_numbers.push(phone_number)
  end
  
  def remove_email(email)
    index = @emails.index(email)
    @emails.slice!(index)
  end

  def to_st
      "#{@fullname} was born on #{@dob.strftime('%Y-%m-%d')}. Their email addresses are: #{@emails.to_s}.Their phone numbers are #{@phone_numbers.to_s}"
  end

  def print_details 

    emailsStr = ""
    @emails.each do |email|
      emailsStr += "- #{email} \n" 
    end

    phonesStr = ""
    @phone_numbers.each do |phones|
      phonesStr += "- #{phones} \n" 
    end

    puts "#{@fullname}" 
    puts "\n"
    puts "-"
    puts "\n"
    puts  "Date of Birth: #{@dob.strftime('%-d %B %Y')}"
    puts "\n"
    puts  "Email Addresses:\n#{emailsStr}"
    puts  "Phone Numbers:\n#{phonesStr}" 
  end
end

class FamilyMember < Person
  attr_accessor :relationship
  
  def initialiaze(first_name, surname, dob = nil, relationship = nil)
    @relationship = relationship
    super(first_name, surname, dob)
  end

  def add_email(email)
    puts"#{email}"
    super(email)
  end

def add_phone(phone)
    puts"#{phone}"
    super(phone_number)
  end
end

class AddressBook < Person
  attr_accessor :entries, :yaml
  require 'yaml'
  def initialize 
    @entries = []
  end

  def add_p(person)
    if person.is_a?Person
      @entries.push(person)
    else
      raise "You must provide a valid Person object"
    end
  end

   def add_email(email)
    puts"#{email}"
    super(email)
  end

def add_phone(phone)
    puts"#{phone}"
    super(phone_number)
  end


  def list
    puts"Address Book"
    puts"------------"
    @entries.each_with_index do |person,i|puts "Entry #{i+1}: #{person.fullname}" 
    end
    return nil
  end


  def load_yaml(file_name)
    yaml = YAML.load_file file_name
    array = yaml["people"]
    array.each do |yperson|
      
      if yperson ["relationship"]
      person = FamilyMember.new yperson["fname"], yperson["surname"], yperson["dob"], yperson["relationship"]
      else
      person = Person.new yperson["fname"], yperson["surname"], yperson["dob"]  
      end

      yperson["emails"].each do |email|
      person.add_email email
      end

      yperson["phones"].each do |phones|
      person.add_phone_num   phones 
      end
      @entries << person
      end 
      return self
    end
  end   
 








