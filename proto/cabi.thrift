namespace java com.rbkmoney.cabi
namespace erlang cabi

include "base.thrift"

exception CurrencyRequestFail {
    1: optional string message
}

enum ExchangeAction {
    /* будет сконвертирована сумма «amount» в валюте «to» */
    buy
    /* будет сконвертирована сумма «amount» в валюте «from» */
    sell
}

struct CheckCurrencyExchangeParams {
    /* Отдаваеамая валюта (3 символа ISO 4217, раздел “Валюты”) */
    1: required string exchange_from
    /* Получаемая валюта (3 символа ISO 4217, раздел “Валюты”) */
    2: required string exchange_to
    3: required ExchangeAction action
    4: required i64 amount
}

struct CurrencyExchange {
    /* Сумма обмена */
    1: required base.Rational amount_exchanged
    /* Сумма обмена (с комиссией) */
    2: optional base.Rational crypto_amount_exchanged_with_fee
    /* Курс обмена */
    4: required base.Rational rate
    /* Отдаваеамая валюта (3 символа ISO 4217) */
    5: required string exchange_from
    /* Получаемая валюта (3 символа ISO 4217) */
    6: required string exchange_to
    7: required ExchangeAction action
    /* Сумма транзакции (точность - до двух знаков после запятой) */
    8: required i64 amount
}

service CryptoApi {
    /* Получение курса обмена валют */
    CurrencyExchange checkCurrencyExchange(1: CheckCurrencyExchangeParams currencyExchangeParams)
        throws (1: CurrencyRequestFail ex)
}
