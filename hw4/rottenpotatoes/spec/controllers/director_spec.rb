require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  fixtures :movies
    
  describe "GET index" do
    it "assigns @movies" do
      get :index
      expect(assigns[:movies].count).to eq(Movie.all.count)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
    it "redirects when sort param is set to title" do
       get :index, :sort => :title
       expect(response).to redirect_to :sort => :title, :ratings => assigns[:selected_ratings]
    end
    
    it "redirects when sort param is set to release_date" do
       get :index, :sort => :release_date
       expect(response).to redirect_to :sort => :release_date, :ratings => assigns[:selected_ratings]
    end
    
    it "uses all ratings if empty hash passed in" do
       get :index, :ratings => {}
       expect(assigns[:selected_ratings].keys).to eq(Movie.all_ratings)
    end
  end
  
  describe "GET new" do
    it "renders the new movie template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  
  describe "POST create" do
    before(:each) do
      data = {title: "test", director: "test", release_date: "2000-01-01 00:00:00", description: nil}
      post :create, :movie => data
    end
    
    it "creates a new record in the database" do
      new_movie = Movie.where("title = 'test'").first
      expect(new_movie).not_to eq(nil)
    end
    
    it "redirects to the home page" do
      expect(response).to redirect_to movies_path
    end
    
    it "includes a success message" do
      expect(flash[:notice]).not_to eq(nil)
    end
  end
  
  describe "POST destroy" do
    before(:each) do
      post :destroy, :id => 1
    end
    
    it "deletes specified record from the database" do
      count = Movie.where("id = 1").count
      expect(count).to eq(0)
    end
    
    it "redirects to the home page" do
      expect(response).to redirect_to movies_path
    end
    
    it "includes a success message" do
      expect(flash[:notice]).not_to eq(nil)
    end
  end
  
  describe "POST update" do
    before(:each) do
      data = {title: "test", director: "test", release_date: "2000-01-01 00:00:00", description: nil}
      post :update, :id => 1, :movie => data
    end
    
    it "deletes specified record from the database" do
      updated = Movie.find(1)
      expect(updated.title).to eq("test")
      expect(updated.director).to eq("test")
    end
    
    it "redirects to the home page" do
      expect(response).to redirect_to movie_path(:id => 1)
    end
    
    it "includes a success message" do
      expect(flash[:notice]).not_to eq(nil)
    end
  end
  
  describe "GET edit" do
    before(:each) do
      get :edit, :id => 1
    end      
      
    it "assigns @movie" do
      expect(assigns[:movie].id).to eq(1)
    end

    it "renders the edit template for movie" do
      expect(response).to render_template("edit")
    end
  end
  
  describe "GET show" do
    before(:each) do
      get :show, :id => 1
    end      
      
    it "assigns @movie" do
      expect(assigns[:movie].id).to eq(1)
    end

    it "renders the show template for movie" do
      expect(response).to render_template("show")
    end
  end
  
  describe "GET similar happy path" do
    before(:each) do
      get :similar, :id => 1
    end      
      
    it "assigns @movies" do
      expect(assigns[:movies].count).to eq(2)
    end

    it "renders the similar template for movie" do
      expect(response).to render_template("similar")
    end
  end
    
  describe "GET similar sad path" do
    before(:each) do
      get :similar, :id => 6
    end      
      
    it "redirects to the home page" do
      expect(response).to redirect_to movies_path
    end
    
    it "includes a message" do
      expect(flash[:notice]).not_to eq(nil)
    end
  end
  
end