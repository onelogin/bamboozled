module Bamboozled
  module API
    class Meta < Base

      [:field, :list, :user].each do |action|
        define_method("#{action}s") do
          request(:get, "meta/#{action}s")
        end
      end

      def tables
        request(:get, 'meta/tables')[:tables][:table]
      end
    end
  end
end
