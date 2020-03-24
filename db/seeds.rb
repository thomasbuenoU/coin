spinner = TTY::Spinner.new("[:spinner] Registering coins")
spinner.auto_spin

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
            }
]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end

spinner.success("Registred success")