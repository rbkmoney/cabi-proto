
namespace java com.rbkmoney.cabi
namespace erlang cabi

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
    1: required string exchangeFrom
    /* Получаемая валюта (3 символа ISO 4217, раздел “Валюты”) */
    2: required string exchangeTo
    3: required ExchangeAction action
    4: required i64 amount
}

struct CurrencyExchange {
    /* Сумма обмена */
    1: required string amountExchanged
    /* Сумма обмена (с комиссией) */
    2: required string cryptoAmountExchangedWithFee
    /* Курс обмена */
    4: required string rate
    /* Отдаваеамая валюта (3 символа ISO 4217) */
    5: required string exchangeFrom
    /* Получаемая валюта (3 символа ISO 4217) */
    6: required string exchangeTo
    7: required ExchangeAction action
    /* Сумма транзакции */
    8: required i64 amount
}

service CryptoApi {
    /* Получение курса обмена валют */
    CurrencyExchange checkCurrencyExchange(1: CheckCurrencyExchangeParams currencyExchangeParams)
        throws (1: CurrencyRequestFail ex)
}
