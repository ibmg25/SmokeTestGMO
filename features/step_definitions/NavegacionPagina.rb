Given('I am on the Google homepage') do
    visit('/')
end
When('I search for {string}') do |value_to_search|
    fill_in('q', with: value_to_search).send_keys(:return)
end
Then('I will click the {string} link') do |search_link|
    click_link(search_link) 
end

Given('I am on GMO OnLine Catalog page') do
    visit('https://demo.borland.com/gmopost/')
end

When('Press the {string}') do |name_button|
    case name_button
    when "Enter GMO OnLine"
        find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
    when "About The GMO site"
        find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(2) > input[type=button]').click
    when "Browser Test Page"
        find('body > form > div:nth-child(3) > center > table > tbody > tr > td > input[type=button]').click
    end
end

Then('I should see title text {string} in {string}') do |title, css_selector|
    expected_text = find(css_selector).text
    expect(expected_text).to eq(title)
end