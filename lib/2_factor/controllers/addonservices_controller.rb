# This file was automatically generated for 2Factor by APIMATIC BETA v2.0 on 02/18/2016

module M2Factor
  class ADDONSERVICESController

    # Check Balance For Addon Services
    # @param [String] api_key Required parameter: 2Factor account API Key
    # @param [String] service_name Required parameter: Name of the addon service
    # @return CheckBalanceAddonServicesModel response from the API call
    def get_check_balance_addon_services api_key, service_name
      # the base uri for api requests
      query_builder = Configuration.BASE_URI.dup

      # prepare query string for API call
      query_builder << "/V1/{api_key}/ADDON_SERVICES/BAL/{service_name}"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "api_key" => api_key,
        "service_name" => service_name,
      }

      # validate and preprocess url
      query_url = APIHelper.clean_url query_builder

      # prepare headers
      headers = {
        "user-agent" => "2Factor",
        "accept" => "application/json"
      }

      # invoke the API call request to fetch the response
      response = Unirest.get query_url, headers:headers

      #Error handling using HTTP status codes
      if !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end

      response.body
    end

    # Pull Delivery Report - Transactional SMS
    # @param [String] api_key Required parameter: API Obtained From 2Factor.in
    # @param [String] session_id Required parameter: Session Id Returned By Send SMS Step
    # @return mixed response from the API call
    def get_pull_delivery_report api_key, session_id
      # the base uri for api requests
      query_builder = Configuration.BASE_URI.dup

      # prepare query string for API call
      query_builder << "/V1/{api_key}/ADDON_SERVICES/RPT/TSMS/{session_id}"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "api_key" => api_key,
        "session_id" => session_id,
      }

      # validate and preprocess url
      query_url = APIHelper.clean_url query_builder

      # prepare headers
      headers = {
        "user-agent" => "2Factor",
        "accept" => "application/json"
      }

      # invoke the API call request to fetch the response
      response = Unirest.get query_url, headers:headers

      #Error handling using HTTP status codes
      if !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end

      response.body
    end

    # Send Single / Bulk Transactional Messages / Schedule SMS
    # @param [String] api_key Required parameter: API Obtained From 2Factor.in
    # @param [String] from Required parameter: 6 Character Alphabet Sender Id
    # @param [String] msg Required parameter: SMS Body To Be Sent
    # @param [String] to Required parameter: Comma Separated list Of Phone Numbers
    # @param [String] send_at Optional parameter: This Parameter Is Used For Scheduling SMS - Optional parameter
    # @param [Hash] field_parameters Additional optional form parameters are supported by this endpoint
    # @return SendTransactionalSmsModel response from the API call
    def create_send_transactional_sms api_key, from, msg, to, send_at: "2019-01-01 00:00:01", field_parameters: nil
      # the base uri for api requests
      query_builder = Configuration.BASE_URI.dup

      # prepare query string for API call
      query_builder << "/V1/{api_key}/ADDON_SERVICES/SEND/TSMS"

      # process optional query parameters
      query_builder = APIHelper.append_url_with_template_parameters query_builder, {
        "api_key" => api_key,
      }

      # validate and preprocess url
      query_url = APIHelper.clean_url query_builder

      # prepare headers
      headers = {
        "user-agent" => "2Factor",
        "accept" => "application/json"
      }

      # prepare parameters
      parameters = {
        "From" => from,
        "Msg" => msg,
        "To" => to,
        "SendAt" => if send_at.nil? then "2019-01-01 00:00:01" else send_at end
      }

      # invoke the API call request to fetch the response
      response = Unirest.post query_url, headers:headers, parameters:parameters

      #Error handling using HTTP status codes
      if !(response.code.between?(200,206)) # [200,206] = HTTP OK
        raise APIException.new "HTTP Response Not OK", response.code, response.raw_body
      end

      response.body
    end

  end
end