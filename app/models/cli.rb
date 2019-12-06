#Testing if cli.rb is working as intended.
class Cli

    def self.my_manual_seed
        c={returned:false,due_date:"December 17st, 2019"}
        checkout4 = Checkout.create(c)
        checkout4.user_id = User.first.id
        checkout4.save
    end

    def self.greeting_and_getting_name
        puts "Your name?"
        name = gets.chomp
    end

    def self.main
        @@current_user_name = self.greeting_and_getting_name
        # start here! # @@current_user_object = 
    end

end
