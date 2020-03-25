namespace :dev do
  desc "setup development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting DB...") { %x(rails db:drop) }
      show_spinner("Creating DB...") { %x(rails db:create) }
      show_spinner("Migrating DB...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "You are not in a development environment"
    end
  end

  desc "Register coin"
  task add_coins: :environment do
    show_spinner("Signing up coins...") do
      coins = [
                {
                    description: "Bitcoin",
                    acronym: "BTC",
                    url_image: "https://cdn.pixabay.com/photo/2018/02/02/13/51/bitcoin-3125488_960_720.png"
                },
                {
                    description: "Ethereum",
                    acronym: "ETH",
                    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"
                },
                {   
                    description: "Dash",
                    acronym: "Dash",
                    url_image: "https://cryptowiki.net/images/5/55/Dash.png"
                },
                {
                    description: "Iota",
                    acronym: "IOT",
                    url_image: "https://img2.gratispng.com/20180712/tkc/kisspng-iota-cryptocurrency-logo-internet-of-things-tether-aren-5b481f06b57ae1.5360095415314531907434.jpg"
                },
                {
                    description: "ZCash",
                    acronym: "ZEC",
                    url_image: "https://img2.gratispng.com/20180628/ohj/kisspng-zcash-cryptocurrency-bitcoin-market-capitalization-btc-digital-llc-5b34e3913bff74.5774957615301927852458.jpg"
                }
]

    coins.each do |coin|
    Coin.find_or_create_by!(coin)
      end
    end
  end


  desc "Register type of mining"
  task add_mining_types: :environment do
    show_spinner("Signing up types of mining...") do
      mining_types = [
        {description: "Proof of Work", acronym:"PoW"},
        {description: "Proof of Stake", acronym:"PoS"},
        {description: "Proof of Capacity", acronym:"PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end   
  end

  private
  def show_spinner(msg_start, msg_end = "Successfully!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end  
end
