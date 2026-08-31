public class Order {
    public Id accountId;
    public Decimal amount;
    public String orderNumber;

    public Order(Id accountId, Decimal amount, String orderNumber) {
        this.accountId = accountId;
        this.amount = amount;
        this.orderNumber = orderNumber;
    }
}