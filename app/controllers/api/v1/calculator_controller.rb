class Api::V1::CalculatorController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @calculators = Calculator.all
    render json: @calculators
  end

  def create
    @exist_cal = Calculator.find_by(calculator_params)

    if @exist_cal
      # render json: {error: 'Calculation data already exists.'}
      @exist_cal.count += 1
      @exist_cal.save
      render json:{status: "exist", data: @exist_cal}
    else
      @calculator = Calculator.new(calculator_params)
      if params[:operator] == "+"
        @calculator.result = params[:int_a] + params[:int_b]
      elsif params[:operator] == "-"
        @calculator.result = params[:int_a] - params[:int_b]
      elsif params[:operator] == "x"
        @calculator.result = params[:int_a] * params[:int_b]
      elsif params[:operator] == "/"
        @calculator.result = params[:int_a].to_f / params[:int_b]
      end
      @calculator.count = 1

      if @calculator.save
        render json: {status: "saved", data: @calculator}
      else
        # render error: {error: 'Unable to create Calculation data.'}, status: 400
        render json: {error: 'Unable to create Calculation data.'}
      end
    end

  end

  def show
    @calculator = Calculator.find_by(calculator_params)
    render json: @calculator
  end

  private

  def calculator_params
    params.permit(:int_a, :int_b, :operator)
  end
end
