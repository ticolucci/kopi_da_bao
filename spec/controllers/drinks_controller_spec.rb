require 'rails_helper'

RSpec.describe DrinksController, type: :controller do
  render_views

  before do
    Feature.create(name: 'Gau')
    Feature.create(name: 'Siew dai')
  end

  let(:valid_attributes) do
    { name: 'Kopi', feature_ids: Feature.all.map(&:id) }
  end

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET #index" do
    it "assigns all drinks as @drinks" do
      drink = Drink.create! valid_attributes
      get :index
      expect(assigns(:drinks)).to eq([drink])
    end
  end

  describe "GET #show" do
    it "assigns the requested drink as @drink" do
      drink = Drink.create! valid_attributes
      get :show, {id: drink.to_param}
      expect(assigns(:drink)).to eq(drink)
    end
  end

  describe "GET #new" do
    it "assigns a new drink as @drink" do
      get :new
      expect(assigns(:drink)).to be_a_new(Drink)
    end

    it "assigns the available @features" do
      get :new
      expect(assigns(:features)).to eq Feature.all
    end
  end

  describe "GET #edit" do
    it "assigns the requested drink as @drink" do
      drink = Drink.create! valid_attributes
      get :edit, {id: drink.to_param}
      expect(assigns(:drink)).to eq(drink)
    end

    it "assigns the available @features" do
      drink = Drink.create! valid_attributes
      get :edit, {id: drink.to_param}
      expect(assigns(:features)).to eq Feature.all
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Drink" do
        expect {
          post :create, {:drink => valid_attributes}
        }.to change(Drink, :count).by(1)
      end

      it "assigns a newly created drink as @drink" do
        post :create, {:drink => valid_attributes}
        expect(assigns(:drink)).to be_a(Drink)
        expect(assigns(:drink)).to be_persisted
      end

      it "redirects to the created drink" do
        post :create, {:drink => valid_attributes}
        expect(response).to redirect_to(Drink.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved drink as @drink" do
        post :create, {:drink => invalid_attributes}
        expect(assigns(:drink)).to be_a_new(Drink)
      end

      it "assigns the available @features" do
        post :create, {:drink => invalid_attributes}
        expect(assigns(:features)).to eq(Feature.all)
      end

      it "re-renders the 'new' template" do
        post :create, {:drink => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: 'Kopi La'}
      end

      it "updates the requested drink" do
        drink = Drink.create! valid_attributes
        put :update, {:id => drink.to_param, :drink => new_attributes}
        expect(drink.reload.name).to eq 'Kopi La'
      end

      it "assigns the requested drink as @drink" do
        drink = Drink.create! valid_attributes
        put :update, {:id => drink.to_param, :drink => valid_attributes}
        expect(assigns(:drink)).to eq(drink)
      end

      it "redirects to the drink" do
        drink = Drink.create! valid_attributes
        put :update, {:id => drink.to_param, :drink => valid_attributes}
        expect(response).to redirect_to(drink)
      end
    end

    context "with invalid params" do
      it "assigns the drink as @drink" do
        drink = Drink.create! valid_attributes
        put :update, {:id => drink.to_param, :drink => invalid_attributes}
        expect(assigns(:drink)).to eq(drink)
      end

      it "assigns the available @features" do
        drink = Drink.create! valid_attributes
        put :update, {:id => drink.to_param, :drink => invalid_attributes}
        expect(assigns(:features)).to eq(Feature.all)
      end

      it "re-renders the 'edit' template" do
        drink = Drink.create! valid_attributes
        put :update, {:id => drink.to_param, :drink => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested drink" do
      drink = Drink.create! valid_attributes
      expect {
        delete :destroy, {:id => drink.to_param}
      }.to change(Drink, :count).by(-1)
    end

    it "redirects to the drinks list" do
      drink = Drink.create! valid_attributes
      delete :destroy, {:id => drink.to_param}
      expect(response).to redirect_to(drinks_url)
    end
  end
end
