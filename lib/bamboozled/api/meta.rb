module Bamboozled
  module API
    class Meta < Base

      [:field, :table, :list, :user].each do |action|
        define_method("#{action}s") do
          request(:get, "meta/#{action}s")
        end
      end

    end
  end
end
