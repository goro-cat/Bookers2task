class RelationshipsController < ApplicationController
  #before_action :authenticate_user!

  def create

    user = User.find(params[:id])##
    current_user.follow(params[:id])#現在のユーザのフォーローしている人
    redirect_to request.referer
  end

  def destroy
    Relationship.find_by(follower_id: current_user.id, followed_id:params[:id]).destroy##フォローしている人のユーザが現在のユーザのときフォローされているユーザをみつけるデストロイ可
    redirect_to request.referer
  end
  
  ###relationshipで一覧画面を表示させたかったが、アクションがうまくいかないため、参考サイトのようにuserに変更###
  #def follower
  #  @users = User.all(params[:user_id])
  #end

  #def followed
  #  @users = User.all
  #end
  ###############################################################################################################
  
  #def follow
  #  current_user.follow(params[:id])
  #  redirect_to request.referer
  #end

  #def unfollow
  # current_user.unfollow(params[:id])
  # redirect_to request.referer
  #end

end
