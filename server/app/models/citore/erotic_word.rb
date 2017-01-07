# == Schema Information
#
# Table name: citore_erotic_words
#
#  id              :integer          not null, primary key
#  twitter_word_id :integer
#  origin          :string(255)      not null
#  reading         :string(255)      not null
#  appear_count    :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_citore_erotic_words_on_twitter_word_id  (twitter_word_id)
#

class Citore::EroticWord < TwitterRecord
  has_many :ngrams, as: :from, class_name: 'NgramWord'
  has_many :voices, as: :from, class_name: 'VoiceWord'

  ERO_KOTOBA_BOT = "ero_kotoba_bot"

  def self.generate!(text, twitter_word_id = nil)
    reading = ApplicationRecord.reading(text)
    erotic_word = Citore::EroticWord.find_or_initialize_by(reading: reading)
    new_record = erotic_word.new_record?
    if new_record
      erotic_word.twitter_word_id = twitter_word_id
    end
    erotic_word.origin = text
    erotic_word.appear_count = erotic_word.appear_count.to_i + 1
    erotic_word.save!
    if new_record
      words = ApplicationRecord.ngram(reading, 2).uniq
      #なぜか謎のloadが入ってしまうのでimportするのは一回だけ
      values = words.map{|word| "(" + ["NULL", "'#{erotic_word.class.base_class.name}'", erotic_word.id, "'#{word}'"].join(",") + ")" }
      sql = "INSERT INTO `#{NgramWord.table_name}` (#{NgramWord.column_names.join(',')}) VALUES " + values.join(",")
      NgramWord.connection.execute(sql)
    end
    return erotic_word
  end
end
