require 'test_helper'

class TeachingMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teaching_material = teaching_materials(:one)
  end

  test "should get index" do
    get teaching_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_teaching_material_url
    assert_response :success
  end

  test "should create teaching_material" do
    assert_difference('TeachingMaterial.count') do
      post teaching_materials_url, params: { teaching_material: { name: @teaching_material.name, url: @teaching_material.url } }
    end

    assert_redirected_to teaching_material_url(TeachingMaterial.last)
  end

  test "should show teaching_material" do
    get teaching_material_url(@teaching_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_teaching_material_url(@teaching_material)
    assert_response :success
  end

  test "should update teaching_material" do
    patch teaching_material_url(@teaching_material), params: { teaching_material: { name: @teaching_material.name, url: @teaching_material.url } }
    assert_redirected_to teaching_material_url(@teaching_material)
  end

  test "should destroy teaching_material" do
    assert_difference('TeachingMaterial.count', -1) do
      delete teaching_material_url(@teaching_material)
    end

    assert_redirected_to teaching_materials_url
  end
end
