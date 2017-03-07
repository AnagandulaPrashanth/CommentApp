class CreateCommentHierarchies < ActiveRecord::Migration
  def change
    create_table :comment_hierarchies, :id=> do |t|
       t.integer :ancentor_id, :null => false
       t.integer :descendant_id, :null => false
       t.integer :generations, :null => false       
    end
 # For "all progeny of..." and leaf selects:
 add_index :comment_hierarchies, [:ancentor_id,:descendant_id],
           :unique => true, :name => "comment_anc_desc_udx"
 # For "all ancentors of..." selects,
 add_index :comment_hierarchies, [:descendant_id],
           :name => "comment_desc_idx"          
  end
end
