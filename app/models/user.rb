class User < ActiveRecord::Base
  has_attached_file :avatar,
                    :storage => :s3,
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename',
                    :s3_credentials => {
                      :bucket => 'demos3paperclip',
                      :access_key_id => 'AKIAJBKNCI2BIZW4EQUQ',
                      :secret_access_key =>'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',
                      :s3_endpoint => 's3-eu-west-1.amazonaws.com'
                    },
                    :styles => { :medium => "500x500>", :thumb => "200x200>" },
                    :default_url => "images.jpeg"
                    # :url => "/attachment/:id/:style/:basename.:extension"
  validates_attachment :avatar, :presence => true,
                       :content_type => { :content_type =>  ["image/jpeg", "image/png"]},
                       :size => { :in => 0..10.kilobytes }

end
