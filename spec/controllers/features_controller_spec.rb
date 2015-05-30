require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do
  let(:valid_attributes) do
    { name: 'Gau' }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  describe "GET #index" do
    it "assigns all features as @features" do
      feature = Feature.create! valid_attributes
      get :index
      expect(assigns(:features)).to eq([feature])
    end
  end

  describe "GET #new" do
    it "assigns a new feature as @feature" do
      get :new
      expect(assigns(:feature)).to be_a_new(Feature)
    end
  end

  describe "GET #edit" do
    it "assigns the requested feature as @feature" do
      feature = Feature.create! valid_attributes
      get :edit, {:id => feature.to_param}
      expect(assigns(:feature)).to eq(feature)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Feature" do
        expect {
          post :create, {:feature => valid_attributes}
        }.to change(Feature, :count).by(1)
      end

      it "assigns a newly created feature as @feature" do
        post :create, {:feature => valid_attributes}
        expect(assigns(:feature)).to be_a(Feature)
        expect(assigns(:feature)).to be_persisted
      end

      it "redirects to the created features list" do
        post :create, {:feature => valid_attributes}
        expect(response).to redirect_to(features_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved feature as @feature" do
        post :create, {:feature => invalid_attributes}
        expect(assigns(:feature)).to be_a_new(Feature)
      end

      it "re-renders the 'new' template" do
        post :create, {:feature => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { name: 'Gau!' }
      end

      it "updates the requested feature" do
        feature = Feature.create! valid_attributes
        put :update, {:id => feature.to_param, :feature => new_attributes}
        expect(feature.reload.name).to eq 'Gau!'
      end

      it "assigns the requested feature as @feature" do
        feature = Feature.create! valid_attributes
        put :update, {:id => feature.to_param, :feature => valid_attributes}
        expect(assigns(:feature)).to eq(feature)
      end

      it "redirects to the features list" do
        feature = Feature.create! valid_attributes
        put :update, {:id => feature.to_param, :feature => valid_attributes}
        expect(response).to redirect_to(features_path)
      end
    end

    context "with invalid params" do
      it "assigns the feature as @feature" do
        feature = Feature.create! valid_attributes
        put :update, {:id => feature.to_param, :feature => invalid_attributes}
        expect(assigns(:feature)).to eq(feature)
      end

      it "re-renders the 'edit' template" do
        feature = Feature.create! valid_attributes
        put :update, {:id => feature.to_param, :feature => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested feature" do
      feature = Feature.create! valid_attributes
      expect {
        delete :destroy, {:id => feature.to_param}
      }.to change(Feature, :count).by(-1)
    end

    it "redirects to the features list" do
      feature = Feature.create! valid_attributes
      delete :destroy, {:id => feature.to_param}
      expect(response).to redirect_to(features_url)
    end
  end
end
