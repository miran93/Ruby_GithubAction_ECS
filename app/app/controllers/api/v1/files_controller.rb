require 'aws-sdk-s3'
module Api
    module V1
        class FilesController < ApplicationController
            def index
                s3 = Aws::S3::Client.new
                response = s3.get_object({
                    bucket: 'theorem-one-data-application',
                    key: "data.json"
                })
                render json: {status: 'SUCCESS', data: response.body.read}, status: :ok
            end
        end
    end
end