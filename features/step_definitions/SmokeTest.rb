Given('I am on the GMO') do
    visit 'https://demo.borland.com/gmopost/'
end

When('I click the button Enter GMO OnLine button') do
    find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
end


When('I update the quantity of {string} to {string}') do |product_name, new_quantity|
    update_product_quantity(product_name, new_quantity)
end  

When('Click on the Place and orden Button') do  
    find('body > form > table > tbody > tr:nth-child(3) > td > div > center > table > tbody > tr > td > p > input[type=submit]:nth-child(2)').click
end

Then('the TotalAmount should be {string}') do |expected_total|
    # Encuentra la última fila de la tabla
    actual_total = find('body > form > table > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:last-child > td:nth-child(2)').text
        # Compara el valor total actual con el esperado
    if actual_total == expected_total
        puts "El valor del total es correcto: #{actual_total}"
    else
        puts "El valor del total es incorrecto. Se esperaba #{expected_total} pero se encontró #{actual_total}"
    end
end

def update_product_quantity(product_name, new_quantity)
    counter = 2
    while counter < 7
        row_selector = "body > form > table > tbody > tr:nth-child(#{counter}) > td > div > center > table > tbody > tr"
        row = find(:css, row_selector, text: product_name)
        if row.visible?
            last_column_cell = row.find('td:last-child input[type="text"]')
            last_column_cell.click
            last_column_cell.set(new_quantity)
            break
        end
        counter += 1
    end
end