describe('product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Can navigate to a product's page from the homepage", () => {
    // click on the first product
    cy.get("article").first().click()
    // verify its details are rendered
    cy.get(".product-detail").should("be.visible");
  });


})