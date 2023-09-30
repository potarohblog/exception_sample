namespace :distribute_ticket do
  desc "全ユーザーのticket_countをrescueしながら10増加させる"
  task rescue: :environment do
    User.find_each do |user|
      begin
        user.increment!(:ticket_count, 10)
      rescue => e
        Rails.logger.debug e.message
      end
    end
  end
end