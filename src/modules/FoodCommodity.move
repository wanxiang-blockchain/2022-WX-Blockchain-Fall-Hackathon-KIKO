address 0x1c3Eecf3Fc603c085FeFAcC0AECf21a4 {
module FoodCommodity{
    use 0x1::Signer;
    use 0x1::STC::STC;
    use 0x1::Vector;
    use 0x1::Token;
    use 0x1::Account;

    const MANAGER_ADDRESS: address = @0x1c3Eecf3Fc603c085FeFAcC0AECf21a4;
    const FEE_ADDRESS: address = @0x1c3Eecf3Fc603c085FeFAcC0AECf21a4;

    const PERMISSION_DENIED: u64 = 100001;
    const NOTEXIST: u64 = 100002;
    const STOCKN_NOT_ENOUGH: u64 = 100003;
    const BUY_AMOUNT: u64 = 100004;
    const TOKEN_MISMATCH: u64 = 100005;

    struct Food has key, store{
        food_type:vector<u8>,
        food_type_fee: vector<u128>,
        food_type_fee_token: vector<Token::TokenCode>,
        food_type_stock: vector<u8>
    }

    struct FoodOrder<order_id: store, PayToken: store> has key, store {
        food_type: u8,
        food_fee: u128
    }

    fun set_init(sender: &signer) {
        assert(Signer::address_of(sender) == MANAGER_ADDRESS, PERMISSION_DENIED);
        if (!exists<Food>(MANAGER_ADDRESS)) {
            move_to(sender, Food {
                food_type: Vector::empty(),
                food_type_fee: Vector::empty(),
                food_type_fee_token: Vector::empty(),
                food_type_stock: Vector::empty()
            });
        };
    }

    fun set_food_fee<PayToken: store>(sender: &signer, type: u8, fee: u128, stock: u8) acquires Food{
        assert(Signer::address_of(sender) == MANAGER_ADDRESS, PERMISSION_DENIED);
        let k = 0;
        let exist = false;
        let food = borrow_global_mut<Food>(MANAGER_ADDRESS);
        let len = Vector::length(&food.food_type);
        while (k < len) {
            let food_type = Vector::borrow(&food.food_type, k);
            if (type == *food_type) {
                exist = true;
                break
            };
            k = k + 1;
        };
        if (exist) {
            Vector::swap_remove(&mut food.food_type, k);
            Vector::swap_remove(&mut food.food_type_fee, k);
            Vector::swap_remove(&mut food.food_type_fee_token, k);
            Vector::swap_remove(&mut food.food_type_stock, k);
        };
        if (0 < fee) {
            Vector::push_back(&mut food.food_type, type);
            Vector::push_back(&mut food.food_type_fee, fee);
            Vector::push_back(&mut food.food_type_fee_token, Token::token_code<PayToken>());
            Vector::push_back(&mut food.food_type_stock, stock);
        };
    }

    fun buy_food<orderId: store, PayToken: store> (sender: &signer, type: u8, amount: u8) acquires Food{
        assert(0 < amount, BUY_AMOUNT);
        let k = 0;
        let exist = false;
        let food = borrow_global_mut<Food>(MANAGER_ADDRESS);
        let len = Vector::length(&food.food_type);
        while (k < len) {
            let food_type = Vector::borrow(&food.food_type, k);
            if (type == *food_type) {
                exist = true;
                break
            };
            k = k + 1;
        };
        
        assert(exist, NOTEXIST);
        assert(Token::token_code<PayToken>() == *Vector::borrow(&mut food.food_type_fee_token, k), TOKEN_MISMATCH);
        let food_fee = *Vector::borrow(&mut food.food_type_fee, k);
        let food_stock = *Vector::borrow(&mut food.food_type_stock, k);

        assert(0 < food_stock, STOCKN_NOT_ENOUGH);
        let total_fee = food_fee * (amount as u128);
        Account::deposit(FEE_ADDRESS, Account::withdraw<STC>(sender, total_fee));

        move_to(sender, FoodOrder<orderId, PayToken> {
            food_type: type,
            food_fee: total_fee
        });
        
        reset_food<PayToken>(k, type, food_fee, food_stock - 1u8);
    }

    fun reset_food<PayToken: store>(k: u64, type: u8, fee: u128, stock: u8) acquires Food{
        let food = borrow_global_mut<Food>(MANAGER_ADDRESS);
        Vector::swap_remove(&mut food.food_type, k);
        Vector::swap_remove(&mut food.food_type_fee, k);
        Vector::swap_remove(&mut food.food_type_fee_token, k);
        Vector::swap_remove(&mut food.food_type_stock, k);
        
        Vector::push_back(&mut food.food_type, type);
        Vector::push_back(&mut food.food_type_fee, fee);
        Vector::push_back(&mut food.food_type_fee_token, Token::token_code<PayToken>());
        Vector::push_back(&mut food.food_type_stock, stock);
        
    }

    fun f_set_init(sender: signer) {
        set_init(&sender);
    }

    public(script) fun f_set_food_fee<PayToken: store>(sender: signer, type: u8, fee: u128, stock: u8) acquires Food{
        set_food_fee<PayToken>(&sender, type, fee, stock);
    }

    public(script) fun f_buy_food<orderId: store, PayToken: store> (sender: signer, type: u8, amount: u8) acquires Food{
        buy_food<orderId, PayToken>(&sender, type, amount);
    }
}
}