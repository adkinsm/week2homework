##
# class to manage list of contacts
#
class Contacts

  ##
  # create a Contacts object from string of pipe delimited ("|") fields, one record per line
  # e.g. "Brandon Faloona|Seattle|WA|bfaloona@uw.edu\nBarack Obama|Washington|DC|president@wh.gov"
  #
  def initialize data
    @raw_entries = data.split("\n")
    @contacts = @raw_entries.collect do |line|
      fields = line.split("|")
      {full_name: fields[0], city: fields[1], state: fields[2], email: fields[3]}
    end
  end

  def raw_entries
    @raw_entries
  end

  ##
  # return a comma separated list of formatted email addresses
  #
  def email_list
    @raw_entries.collect do |line|
      name, city, state, email = line.split("|")
      format_email_address name, email.chomp
    end.join(", ")
  end

  ##
  # returns "Display Name" <email@address> given name and email
  #
  def format_email_address name, email
    %{\"#{name}\" <#{email}>}
  end

  #########

  def num_entries
    @contacts.count
  end

  def fields   #line 36
    [:full_name, :city, :state, :email]
  end

  def contact index  #line 40
    #
    @contacts[index.to_i]
  end


  def format_contact(contact)  #line 44
    %{"#{contact[:full_name]} of #{contact[:city]} #{contact[:state]}" <#{contact[:email]}>}
  end

  def all  #line 51
    @contacts
  end

  def formatted_list  #line 58
    @contacts.map {|contact| format_contact(contact) }.join ("\n")
  end

  def full_names
    @contacts.map {|contact| contact[:full_name]}
  end

  def cities
    @contacts.map {|contact| contact[:city]}.uniq
  end

  def append_contact contact
    contact.merge(:full_name =>'', :city =>'', :state => '', :email => '')
  end

  def delete_contact index
    @contacts.delete_at(index)#(:full_name => "Brandon Faloona", :city => "Seattle", :state => "WA", :email => "bfaloona@uw.edu")
  end

def search field
    #@contacts.select! {|contact| contact[:city => 'Washington']}
    @contacts.sort_by {|contact| contact[:full_name]}
  end
  
end
