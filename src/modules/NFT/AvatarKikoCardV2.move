address 0x1c3Eecf3Fc603c085FeFAcC0AECf21a4 {
module AvatarKikoCardV2 {
    
    use 0x1::Signer;
    use 0x1::Event;
    use 0x1::Block;
    use 0x1::Vector;
    use 0x1::Token;
    use 0x1::Account;
    use 0x1::NFT::{Self, NFT};
    // use 0x1::Option::{Self};
    use 0x1::NFTGallery;
    use 0x1c3Eecf3Fc603c085FeFAcC0AECf21a4::AvatarKikoCard::{Self, KikoCatMeta, KikoCatBody};

    const NFT_ADDRESS: address = @0x1c3Eecf3Fc603c085FeFAcC0AECf21a4;

    const PERMISSION_DENIED: u64 = 100001;

    public(script) fun init(_sender: signer) {
        // assert(NFT_ADDRESS == Signer::address_of(&sender), PERMISSION_DENIED);
        // init_box(&sender);
        // init_gallery(&sender);
    }

    public(script) fun init_with_image(
        sender: signer,
        _name: vector<u8>,
        _image: vector<u8>,
        _description: vector<u8>,
        _composite_fee: u128,
    ) {
        assert(NFT_ADDRESS == Signer::address_of(&sender), PERMISSION_DENIED);
        init_box(&sender);
        init_gallery(&sender);
    }

    // ******************** NFT Box ********************
    struct KikoCatBox has copy, drop, store {}

    const PRECISION: u8 = 0;

    struct KikoCatBoxCapability has key, store {
        mint: Token::MintCapability<KikoCatBox>,
        burn: Token::BurnCapability<KikoCatBox>
    }

    fun init_box(sender: &signer) {
        if (!exists<KikoCatBoxCapability>(Signer::address_of(sender))) {
            Token::register_token<KikoCatBox>(sender, PRECISION);
            let mint_cap = Token::remove_mint_capability<KikoCatBox>(sender);
            let burn_cap = Token::remove_burn_capability<KikoCatBox>(sender);
            move_to(sender, KikoCatBoxCapability { 
                mint: mint_cap,
                burn: burn_cap
            });
        };
    }

    fun mint_box(sender: &signer, amount: u128) acquires KikoCatBoxCapability {
        let cap = borrow_global<KikoCatBoxCapability>(NFT_ADDRESS);
        let token = Token::mint_with_capability<KikoCatBox>(&cap.mint, amount);
        Account::deposit_to_self(sender, token);
    }

    fun burn_box(token: Token::Token<KikoCatBox>) acquires KikoCatBoxCapability {
        let cap = borrow_global<KikoCatBoxCapability>(NFT_ADDRESS);
        Token::burn_with_capability(&cap.burn, token);
    }
        
    // ******************** NFT ********************
    struct KikoCatGallery has key, store {
        items: vector<NFT<KikoCatMeta, KikoCatBody>>,
        nft_mint_events: Event::EventHandle<NFTMintEvent<KikoCatMeta, KikoCatBody>>,
        box_open_events: Event::EventHandle<BoxOpenEvent<KikoCatMeta, KikoCatBody>>,
    }

    struct BoxOpenEvent<NFTMeta: store + drop, NFTBody: store + drop> has drop, store {
        owner: address,
        id: u64,
    }

    struct NFTMintEvent<NFTMeta: store + drop, NFTBody: store + drop> has drop, store {
        creator: address,
        id: u64,
        original: bool,
        occupation: vector<u8>,
        custom_name: vector<u8>,
        sex: u8,
        background_id: u64,
        fur_id: u64,
        clothes_id: u64,
        expression_id: u64,
        head_id: u64,
        accessories_id: u64,
        eyes_id: u64,
        hat_id: u64,
        costume_id: u64,
        makeup_id: u64,
        shoes_id: u64,
        mouth_id: u64,
        earring_id: u64,
        necklace_id: u64,
        neck_id: u64,
        hair_id: u64,
        horn_id: u64,
        hands_id: u64,
        body_id: u64,
        skin_id: u64,
        tattoo_id: u64,
        people_id: u64,
        characteristic_id: u64,
        hobby_id: u64,
        zodiac_id: u64,
        action_id: u64,
        toys_id: u64,
        fruits_id: u64,
        vegetables_id: u64,
        meat_id: u64,
        beverages_id: u64,
        food_id: u64,
        vehicle_id: u64,
        weather_id: u64,
        month_id: u64,
        sports_id: u64,
        music_id: u64,
        movies_id: u64,
        season_id: u64,
        outfit_id: u64,
        face_id: u64,
        arm_id: u64,
        leg_id: u64,
        foot_id: u64,
        weapon_id: u64,
        helmet_id: u64,
        armor_id: u64,
        mecha_id: u64,
        pants_id: u64,
        skirt_id: u64,
        left_hand_id: u64,
        right_hand_id: u64,
        pets_id: u64,
        gifts_id: u64,
        tail_id: u64,
    }

    fun init_gallery(sender: &signer) {
        if (!exists<KikoCatGallery>(Signer::address_of(sender))) {
            let gallery = KikoCatGallery {
                items: Vector::empty<NFT<KikoCatMeta, KikoCatBody>>(),
                nft_mint_events: Event::new_event_handle<NFTMintEvent<KikoCatMeta, KikoCatBody>>(sender),
                box_open_events: Event::new_event_handle<BoxOpenEvent<KikoCatMeta, KikoCatBody>>(sender)
            };
            move_to(sender, gallery);
        };
    }

    public(script) fun mint_nft(
        sender: signer,
        name: vector<u8>,
        image: vector<u8>,
        description: vector<u8>,
        occupation: vector<u8>,
        custom_name: vector<u8>,
        sex: u8,
        background_id: u64,
        fur_id: u64,
        clothes_id: u64,
        expression_id: u64,
        head_id: u64,
        accessories_id: u64,
        eyes_id: u64,
        hat_id: u64,
        costume_id: u64,
        makeup_id: u64,
        shoes_id: u64,
        mouth_id: u64,
        earring_id: u64,
        necklace_id: u64,
        neck_id: u64,
        hair_id: u64,
        horn_id: u64,
        hands_id: u64,
        body_id: u64,
        skin_id: u64,
        tattoo_id: u64,
        people_id: u64,
        characteristic_id: u64,
        hobby_id: u64,
        zodiac_id: u64,
        action_id: u64,
        toys_id: u64,
        fruits_id: u64,
        vegetables_id: u64,
        meat_id: u64,
        beverages_id: u64,
        food_id: u64,
        vehicle_id: u64,
        weather_id: u64,
        month_id: u64,
        sports_id: u64,
        music_id: u64,
        movies_id: u64,
        season_id: u64,
        outfit_id: u64,
        face_id: u64,
        arm_id: u64,
        leg_id: u64,
        foot_id: u64,
        weapon_id: u64,
        helmet_id: u64,
        armor_id: u64,
        mecha_id: u64,
        pants_id: u64,
        skirt_id: u64,
        left_hand_id: u64,
        right_hand_id: u64,
        pets_id: u64,
        gifts_id: u64,
        tail_id: u64
    ) acquires KikoCatGallery, KikoCatBoxCapability {
        let _sender = &sender;
        let sender_address = Signer::address_of(_sender);
        assert(NFT_ADDRESS == sender_address, PERMISSION_DENIED);
        
        NFTGallery::accept<KikoCatMeta, KikoCatBody>(_sender);

        let nft = AvatarKikoCard::composite_original_card_from_external(
            _sender,
            name,
            image,
            description,
            occupation,
            custom_name,
            sex,
            background_id,
            fur_id,
            clothes_id,
            expression_id,
            head_id,
            accessories_id,
            eyes_id,
            hat_id,
            costume_id,
            makeup_id,
            shoes_id,
            mouth_id,
            earring_id,
            necklace_id,
            neck_id,
            hair_id,
            horn_id,
            hands_id,
            body_id,
            skin_id,
            tattoo_id,
            people_id,
            characteristic_id,
            hobby_id,
            zodiac_id,
            action_id,
            toys_id,
            fruits_id,
            vegetables_id,
            meat_id,
            beverages_id,
            food_id,
            vehicle_id,
            weather_id,
            month_id,
            sports_id,
            music_id,
            movies_id,
            season_id,
            outfit_id,
            face_id,
            arm_id,
            leg_id,
            foot_id,
            weapon_id,
            helmet_id,
            armor_id,
            mecha_id,
            pants_id,
            skirt_id,
            left_hand_id,
            right_hand_id,
            pets_id,
            gifts_id,
            tail_id
        );
        let gallery = borrow_global_mut<KikoCatGallery>(sender_address);
        Vector::push_back(&mut gallery.items, nft);
        mint_box(_sender, 1);
    }

    public(script) fun temp(_sender: signer) {//acquires KikoCatBoxCapability, KikoCatGallery {
        // let _sender = &sender;
        // assert(@0x7441fb396C37ddAd25B42eE478A38b42 == Signer::address_of(_sender), PERMISSION_DENIED);
        // let i = 929u64;
        // while (i <= 979) {//1427
        //     let option_nft = NFTGallery::withdraw<KikoCatMeta, KikoCatBody>(&sender, i);
        //     assert(Option::is_some<NFT<KikoCatMeta, KikoCatBody>>(&option_nft), 100000001);
        //     let nft = Option::extract(&mut option_nft);
        //     let gallery = borrow_global_mut<KikoCatGallery>(NFT_ADDRESS);
        //     Vector::push_back(&mut gallery.items, nft);
        //     Option::destroy_none(option_nft);
        //     mint_box(_sender, 1);
        //     i = i + 1;
        // };
        // mint_box(_sender, 1);
    }

    public(script) fun temp2(_sender: signer, _id: u64, _count:u64) {//acquires KikoCatBoxCapability, KikoCatGallery {
        // let _sender = &sender;
        // assert(@0x7441fb396C37ddAd25B42eE478A38b42 == Signer::address_of(_sender), PERMISSION_DENIED);
        // let i = 0;
        // while (i < count) {//1427
        //     let option_nft = NFTGallery::withdraw<KikoCatMeta, KikoCatBody>(&sender, id);
        //     assert(Option::is_some<NFT<KikoCatMeta, KikoCatBody>>(&option_nft), 100000001);
        //     let nft = Option::extract(&mut option_nft);
        //     let gallery = borrow_global_mut<KikoCatGallery>(NFT_ADDRESS);
        //     Vector::push_back(&mut gallery.items, nft);
        //     Option::destroy_none(option_nft);
        //     mint_box(_sender, 1);
        //     id = id + 1;
        //     i = i + 1;
        // };
    }

    public(script) fun open_box(sender: signer) acquires KikoCatBoxCapability, KikoCatGallery {
        let box_token = Account::withdraw<KikoCatBox>(&sender, 1);
        burn_box(box_token);
        // get hash last 64 bit and mod nft_size
        let hash = Block::get_parent_hash();
        let k = 0u64;
        let i = 0;
        while (i < 8) {
            let tmp = (Vector::pop_back<u8>(&mut hash) as u128);
            k = (tmp << (i * 8) as u64) + k;
            i = i + 1;
        };
        let idx = k % count_of(NFT_ADDRESS);
        // get a nft by idx
        let sender_address = Signer::address_of(&sender);
        let gallery = borrow_global_mut<KikoCatGallery>(NFT_ADDRESS);
        let nft = Vector::remove<NFT<KikoCatMeta, KikoCatBody>>(&mut gallery.items, idx);
        let id = NFT::get_id<KikoCatMeta, KikoCatBody>(&nft);
        NFTGallery::accept<KikoCatMeta, KikoCatBody>(&sender);
        NFTGallery::deposit<KikoCatMeta, KikoCatBody>(&sender, nft);
        // emit event
        Event::emit_event<BoxOpenEvent<KikoCatMeta, KikoCatBody>>(
            &mut gallery.box_open_events,
            BoxOpenEvent<KikoCatMeta, KikoCatBody> {
                owner: sender_address,
                id: id,
            },
        );
    }

    public fun count_of(owner: address): u64 acquires KikoCatGallery {
        let gallery = borrow_global<KikoCatGallery>(owner);
        Vector::length(&gallery.items)
    }
}
}