# frozen_string_literal: true

module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: %i[show update destroy]

      # GET /authors
      def index
        authors = Author.search(params).paginate(page: params[:page], per: params[:per])
        render json: AuthorSerializer.new(authors).serialized_json
      end

      # GET /authors/1
      def show
        render json: AuthorSerializer.new(@author).serialized_json
      end

      # POST /authors
      def create
        @author = Author.new(author_params)

        if @author.save
          render json: AuthorSerializer.new(@author).serialized_json, status: :created
        else
          render json: @author.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /authors/1
      def update
        @author.update(author_params)
        render json: AuthorSerializer.new(@author).serialized_json
      end

      # DELETE /authors/1
      def destroy
        @author.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_author
        @author = Author.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def author_params
        params.permit(:id, :first_name, :last_name, :bio, :date_of_birth)
      end
    end
  end
end
