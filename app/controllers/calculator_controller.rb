# app/controllers/calculator_controller
class CalculatorController < ApplicationController
  def interface
    render :'calculator/index'
  end
end