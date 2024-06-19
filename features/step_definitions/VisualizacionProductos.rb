Given('I am on the GMO Post homepage') do
  visit 'https://demo.borland.com/gmopost/'
end

When('I click Enter GMO OnLine button') do
find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
end

When('I click {string} product') do |product_name|
product_link = find('strong', text: product_name)
product_link.click
end

Then('I should see for product {string}, details: {string}, item number: {string}') do |product_name, product_details, item|

product_selectors = {
  "3 Person Dome Tent" => 'body > p:nth-child(4) > font > em',
  "External Frame Backpack" => 'body > p:nth-child(14) > font > em',
  "Glacier Sun Glasses" => 'body > p:nth-child(24) > font > em',
  "Padded Socks" => 'body > p:nth-child(34) > font > em',
  "Hiking Boots" => 'body > p:nth-child(44) > font > em',
  "Back Country Shorts" => 'body > p:nth-child(54) > font > em'
}

product_selector = product_selectors[product_name]
expected_text = find(product_selector).text
puts "ONLY FOR TEST PURPOSES: #{expected_text}"
expect(expected_text).to eq(product_details)

stock_selectors = {
  "3 Person Dome Tent" => 'body > div:nth-child(5) > table > tbody > tr:nth-child(2) > td:nth-child(2)',
  "External Frame Backpack" => 'body > div:nth-child(15) > table > tbody > tr:nth-child(2) > td:nth-child(2)',
  "Glacier Sun Glasses" => 'body > div:nth-child(25) > table > tbody > tr:nth-child(2) > td:nth-child(2)',
  "Padded Socks" => 'body > div:nth-child(35) > table > tbody > tr:nth-child(2) > td:nth-child(2)',
  "Hiking Boots" => 'body > div:nth-child(45) > table > tbody > tr:nth-child(2) > td:nth-child(2)',
  "Back Country Shorts" => 'body > div:nth-child(55) > table > tbody > tr:nth-child(2) > td:nth-child(2)'
}

stock_selector = stock_selectors[product_name]
expected_stock = find(stock_selector).text
expected_stock = expected_stock.to_i
puts "ONLY FOR TEST PURPOSES: #{expected_stock}"
expect(expected_stock).to be > 0

item_selectors = {
  "3 Person Dome Tent" => 'body > div:nth-child(5) > table > tbody > tr:nth-child(3) > td:nth-child(2)',
  "External Frame Backpack" => 'body > div:nth-child(15) > table > tbody > tr:nth-child(3) > td:nth-child(2)',
  "Glacier Sun Glasses" => 'body > div:nth-child(25) > table > tbody > tr:nth-child(3) > td:nth-child(2)',
  "Padded Socks" => 'body > div:nth-child(35) > table > tbody > tr:nth-child(3) > td:nth-child(2)',
  "Hiking Boots" => 'body > div:nth-child(45) > table > tbody > tr:nth-child(3) > td:nth-child(2)',
  "Back Country Shorts" => 'body > div:nth-child(55) > table > tbody > tr:nth-child(3) > td:nth-child(2)'
}

item_number_selector = item_selectors[product_name]
expected_item = find(item_number_selector).text
puts "ONLY FOR TEST PURPOSES: #{expected_item}"
expect(expected_item).to eq(item)
end