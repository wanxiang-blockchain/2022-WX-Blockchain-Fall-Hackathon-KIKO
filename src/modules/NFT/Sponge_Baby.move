address 0x1c3Eecf3Fc603c085FeFAcC0AECf21a4 {
module Sponge_Baby {
    use 0x1::Signer;
    use 0x1::Event;
    use 0x1::NFT;
    use 0x1::NFTGallery;

    const SELF_ADDRESS: address = @0x1c3Eecf3Fc603c085FeFAcC0AECf21a4;

    const PERMISSION_DENIED: u64 = 100001;

    // ******************** NFT ********************
    // NFT extra meta
    struct Meta has copy, store, drop {}

    // NFT body
    struct Body has copy, store, drop {}

    // NFT extra type info
    struct TypeInfo has copy, store, drop {}

    struct Capability has key {
        mint: NFT::MintCapability<Meta>
    }

    // init nft with image data
    fun init_nft(
        sender: &signer,
        metadata: NFT::Metadata
    ) {
        NFT::register<Meta, TypeInfo>(sender, TypeInfo {}, metadata);
        let mint = NFT::remove_mint_capability<Meta>(sender);
        move_to(sender, Capability { mint });
    }

    // mint nft
    fun mint_nft(
        sender: &signer,
        metadata: NFT::Metadata
    ) acquires Capability, Gallery {
        let sender_address = Signer::address_of(sender);
        let cap = borrow_global_mut<Capability>(sender_address);
        let nft = NFT::mint_with_cap<Meta, Body, TypeInfo>(
            sender_address,
            &mut cap.mint,
            metadata,
            Meta {},
            Body {}
        );
        let gallery = borrow_global_mut<Gallery>(sender_address);
        let id = NFT::get_id<Meta, Body>(&nft);
        // NFTGallery::deposit(sender, nft);
        NFTGallery::deposit_to(@0xde5771495c23E28c69f2024a2253ACB0, nft);

        Event::emit_event<NFTMintEvent<Meta, Body>>(&mut gallery.nft_mint_events,
            NFTMintEvent {
                creator: sender_address,
                id: id,
            }
        );
    }

    // ******************** NFT Gallery ********************
    // gallery
    struct Gallery has key, store {
        nft_mint_events: Event::EventHandle<NFTMintEvent<Meta, Body>>,
    }

    // nft mint event
    struct NFTMintEvent<NFTMeta: store + drop, NFTBody: store + drop> has drop, store {
        creator: address,
        id: u64,
    }

    // init gallery
    fun init_gallery(sender: &signer) {
        if (!exists<Gallery>(Signer::address_of(sender))) {
            let gallery = Gallery {
                nft_mint_events: Event::new_event_handle<NFTMintEvent<Meta, Body>>(sender)
            };
            move_to(sender, gallery);
        }
    }

    // ******************** NFT public function ********************

    // init nft and box with image
    public fun f_init_with_image(
        sender: &signer,
        name: vector<u8>,
        image: vector<u8>,
        description: vector<u8>
    ) {
        assert(SELF_ADDRESS == Signer::address_of(sender), PERMISSION_DENIED);
        let metadata = NFT::new_meta_with_image(name, image, description);
        init_nft(sender, metadata);
        init_gallery(sender);
        NFTGallery::accept<Meta, Body>(sender);
    }

    // init nft and box with image data
    public fun f_init_with_image_data(
        sender: &signer,
        name: vector<u8>,
        image_data: vector<u8>,
        description: vector<u8>
    ) {
        assert(SELF_ADDRESS == Signer::address_of(sender), PERMISSION_DENIED);
        let metadata = NFT::new_meta_with_image_data(name, image_data, description);
        init_nft(sender, metadata);
        init_gallery(sender);
        NFTGallery::accept<Meta, Body>(sender);
    }

    // mint NFT and box
    public fun f_mint_with_image(
        sender: &signer,
        name: vector<u8>,
        image: vector<u8>,
        description: vector<u8>
    ) acquires Capability, Gallery {
        assert(SELF_ADDRESS == Signer::address_of(sender), PERMISSION_DENIED);
        let metadata = NFT::new_meta_with_image(name, image, description);
        mint_nft(sender, metadata);
    }

    // mint NFT and box
    public fun f_mint_with_image_data(
        sender: &signer,
        name: vector<u8>,
        image_data: vector<u8>,
        description: vector<u8>
    ) acquires Capability, Gallery {
        assert(SELF_ADDRESS == Signer::address_of(sender), PERMISSION_DENIED);
        let metadata = NFT::new_meta_with_image_data(name, image_data, description);
        mint_nft(sender, metadata);
    }

    // ******************** NFT script function ********************

    public(script) fun init_with_image(
        sender: signer,
        name: vector<u8>,
        image: vector<u8>,
        description: vector<u8>
    ) {
        f_init_with_image(&sender, name, image, description);
    }

    public(script) fun init_with_image_data(
        sender: signer,
        name: vector<u8>,
        image_data: vector<u8>,
        description: vector<u8>
    ) {
        f_init_with_image_data(&sender, name, image_data, description);
    }

    public(script) fun mint_with_image(
        sender: signer,
        name: vector<u8>,
        image: vector<u8>,
        description: vector<u8>
    ) acquires Capability, Gallery {
        f_mint_with_image(&sender,
            name,
            image,
            description
        );
    }

    public(script) fun mint_with_image_data(
        sender: signer,
        name: vector<u8>,
        image_data: vector<u8>,
        description: vector<u8>
    ) acquires Capability, Gallery {
        f_mint_with_image_data(&sender,
            name,
            image_data,
            description
        );
    }
}
}
