//! new-transaction
//! account: kiko, 0x69F1E543A3BeF043B63BEd825fcd2cf6, 10000000000 0x1::STC::STC
//! sender: kiko
address kiko = {{kiko}};
script {
    use 0x69F1E543A3BeF043B63BEd825fcd2cf6::KikoCatElement07;

    fun init(sender: signer) {
        KikoCatElement07::f_init_with_image(&sender, b"kiko cat", b"www.baidu.com", b"this is a cat");
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            1, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            2, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            3, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            4, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            5, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            6, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            7, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            8, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            9, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            10, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Shoes",
            11, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            12, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            13, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            14, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Shoes",
            15, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            16, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            17, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            18, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Body",
            19, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Body",
            20, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            21, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            22, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            23, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            24, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            25, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            26, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            27, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            28, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            29, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            30, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            31, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            32, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            33, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            34, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            35, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            36, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            37, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            38, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            39, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            40, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            41, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            42, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            43, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            44, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            45, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            46, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Background",
            47, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Clothes",
            48, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Facial Expression",
            49, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Head",
            50, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Left Hand",
            51, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Right Hand",
            52, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Left Hand",
            53, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Right Hand",
            54, b"Bored", 1
        );
        KikoCatElement07::f_mint_with_image(&sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"Tail",
            55, b"Bored", 1
        );
    }
}
// check: EXECUTED

//! new-transaction
//! sender: kiko
address kiko = {{kiko}};
script {
    //    use 0x1::Debug;
    use 0x69F1E543A3BeF043B63BEd825fcd2cf6::KikoCatCard07;

    fun mint(sender: signer) {
        KikoCatCard07::init_with_image(sender, b"kiko cat", b"www.baidu.com", b"this is a cat", 1000000000);
    }
}
// check: EXECUTED

//! new-transaction
//! sender: kiko
address kiko = {{kiko}};
script {
    //    use 0x1::Debug;
    use 0x69F1E543A3BeF043B63BEd825fcd2cf6::KikoCatCard07;

    fun mint(sender: signer) {
        KikoCatCard07::composite_custom_card(sender,
            b"kiko cat", b"www.baidu.com", b"this is a cat", b"miner", b"test1", 1,
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
            21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
            41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55,
        );
    }
}
// check: EXECUTED


//! new-transaction
//! account: alice, 10000000000 0x1::STC::STC
//! sender: alice
script {
    //    use 0x1::Debug;
    use 0x1::NFTGallery;
    use 0x69F1E543A3BeF043B63BEd825fcd2cf6::KikoCatCard07;

    fun mint(sender: signer) {
        NFTGallery::accept<KikoCatCard07::KikoCatMeta, KikoCatCard07::KikoCatBody>(&sender);
    }
}
// check: EXECUTED

//! new-transaction
//! sender: kiko
address alice = {{alice}};
script {
    //    use 0x1::Debug;
    use 0x1::NFTGallery;
    use 0x69F1E543A3BeF043B63BEd825fcd2cf6::KikoCatCard07;

    fun mint(sender: signer) {
        NFTGallery::transfer<KikoCatCard07::KikoCatMeta, KikoCatCard07::KikoCatBody>(&sender, 1, @alice);
    }
}
// check: EXECUTED

//! new-transaction
//! sender: alice
script {
    //    use 0x1::Debug;
    use 0x69F1E543A3BeF043B63BEd825fcd2cf6::KikoCatCard07;

    fun mint(sender: signer) {
        KikoCatCard07::resolve_card(sender, 1);
    }
}
// check: EXECUTED
