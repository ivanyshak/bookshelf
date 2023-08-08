# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: %i[show update destroy]

      def index
        books = Book.search(params).paginate(page: params[:page], per: params[:per])
        render json: BookSerializer.new(books).serialized_json
      end

      # GET /books/1
      def show
        render json: BookSerializer.new(@book).serialized_json
      end

      # POST /books
      def create
        @book = Book.new(book_params)

        if @book.save
          render json: BookSerializer.new(@book).serialized_json, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /books/1
      def update
        @book.update(book_params)
        render json: BookSerializer.new(@book).serialized_json
      end

      # DELETE /books/1
      def destroy
        @book.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.permit(:id, :title, :description, :genre, author_ids: [])
      end
    end
  end
end
