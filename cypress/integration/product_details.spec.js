describe('product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Can navigate to a product's page from the homepage", () => {
    cy.get("article").click();
  });


})