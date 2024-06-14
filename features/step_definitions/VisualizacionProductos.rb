Given('I am on the GMO Post homepage') do
    visit 'https://demo.borland.com/gmopost/'
  end

When('I click Enter GMO OnLine button') do
  find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
end

When('I click 3 Person Dome Tent product') do
  find('body > form > table > tbody > tr:nth-child(2) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(2) > a > strong').click
end

Then('I should see details of selected product') do
  expected_text = find('body > p:nth-child(4) > font > em').text
  puts "ONLY FOR TEST PURPOSES: #{expected_text}"
  expect(expected_text).to eq('Our best 3 person backpack dome tent')
end

When('I click {string} product') do |product_name|
  product_link = find('strong', text: product_name)
  product_link.click
end

Then('I should see details {string} of selected product {string}') do |product_details, css_selector|
  expected_text = find(css_selector).text
  puts "ONLY FOR TEST PURPOSES: #{expected_text}"
  expect(expected_text).to eq(product_details)
end

Then('I should see details {string} of product {string}') do |product_details, product_name|

  product_selectors = {
    "3 Person Dome Tent" => 'body > p:nth-child(4) > font > em',
    "External Frame Backpack" => 'body > p:nth-child(14) > font > em',
    "Glacier Sun Glasses" => 'body > p:nth-child(24) > font > em',
    "Padded Socks" => 'body > p:nth-child(34) > font > em',
    "Hiking Boots" => 'body > p:nth-child(44) > font > em',
    "Back Country Shorts" => 'body > p:nth-child(54) > font > em'
  }

  css_selector = product_selectors[product_name]
  
  expected_text = find(css_selector).text
  puts "ONLY FOR TEST PURPOSES: #{expected_text}"
  expect(expected_text).to eq(product_details)
end