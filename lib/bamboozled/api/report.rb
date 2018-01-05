module Bamboozled
  module API
    class Report < Base

      def find(number, format = 'JSON', fd = true)
        request(:get, "reports/#{number}?format=#{format.upcase}&fd=#{fd.yesno}")
      end


      def custom(fields=['id'])
        body = build_fields_xml(fields)
        request(:post, 'reports/custom', body: body)
      end


      private

      def build_fields_xml(fields)
        body = '<report><fields>'
        fields.each  do |field|
          body << "<field id='#{field}' />"
        end

        body << '</fields></report>'
      end
    end
  end
end
