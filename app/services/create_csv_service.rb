require 'csv'

class CreateCsvService
  def initialize(csv_file, model_name)
    @csv_file = csv_file
    @model = Object.const_get(model_name)
  end

  def execute
    row_num = 1
    ActiveRecord::Base.transaction do
      CSV.foreach(@csv_file, headers: true, encoding: 'utf-8') do |row|
        row_num += 1
        records = row.to_h
        puts records
        @model.create!(records)
      end
    rescue ActiveRecord::RecordInvalid => e
      raise ActiveRecord::Rollback, "#{row}行目でエラーが発生しました: #{e.message}"
    end
  end
end
