# encoding: utf-8
class DialectController < ApplicationController
	def new
	end

	def add
		@dialect = Dialect.new
		@dialect.dialect_word = params[:dialect][:dialect_word]

		#check duplicate 
		unless Dialect.where(:dialect_word => @dialect.dialect_word).empty?
			@info = "すでに登録されています : #{@dialect.dialect_word}"
			render :action => "new.html" 
		end

		# save dialect
		unless @dialect.save 
			@dialect.delete
			@info = "失敗しました : " + @dialect.dialect_word 
			render :action => "new.html" 
		end

		# if success to save dialect, do next.
		@mean = Mean.new
		@mean.dialect_id = @dialect.id
		@mean.mean_word = params[:mean][:mean_word]
		if @mean.save
			@info = "追加しました : #{@dialect.dialect_word} -> #{@mean.mean_word}"
		else
			@mean.delete
			@info = "失敗しました : " + @dialect.dialect_word 
		end

		render :action => "new.html" 
	end

	def detail
		unless params[:id] == nil
			@dialect = Dialect.find(params[:id]);
			if @dialect != nil
				@means = Mean.where(:dialect_id => @dialect.id)
				@examples = Example.where(:dialect_id => @dialect.id)
				@comments = Comment.where(:dialect_id => @dialect.id)
			end
		end
	end


	def add_mean
		@mean = Mean.new
		@mean.dialect_id = params[:id]
		@mean.mean_word = params[:mean][:mean_word]
		if !@mean.mean_word.empty? && @mean.save
			@info = "意味を追加しました :  #{@mean.mean_word}"
		else
			@mean.delete
			@info = "失敗しました : " + @dialect.mean_word 
		end

		redirect_to :action => "detail/#{params[:id]}/"
	end

	def add_example
		@example = Example.new
		@example.dialect_id = params[:id]
		@example.example_word = params[:example][:example_word]
		if !@example.example_word.empty? && @example.save
			@info = "例を追加しました :  #{@example.example_word}"
		else
			@example.delete
			@info = "失敗しました : " + @example.example_word 
		end
		redirect_to :action => "detail/#{params[:id]}/"
	end

	def add_comment
		@comment = Comment.new
		@comment.dialect_id = params[:id]
		@comment.comment_word = params[:comment][:comment_word]
		if !@comment.comment_word.empty? && @comment.save
			@info = "コメントを追加しました :  #{@comment.comment_word}"
		else
			@comment.delete
			@info = "失敗しました : " + @comment.comment_word 
		end
		redirect_to :action => "detail/#{params[:id]}/"
	end
end
