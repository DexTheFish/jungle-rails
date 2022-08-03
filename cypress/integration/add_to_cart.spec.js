describe('cart', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("should increment the cart tally when an item is added to the cart", () => {
    // click on some "Add to cart" button
    cy.get("button").contains("Add").first().click({force: true})
    // verify the cart tally increased from 0 to 1
    cy.contains('.nav-link', 'My Cart (1)').should("be.visible")
  });

})