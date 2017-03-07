require 'printer'

describe Printer do
  describe "#statement" do
    it 'prints transactions' do
      transactions_list = [[Time.now,"","",0],
                           [Time.now,"deposit","1500","1500"]]

      header =  "date".center(12) + " || " +
                "credit".center(8) + " || " +
                "debit".center(8) + " || " +
                "balance".center(8) + "\n"

      line1 = "#{transactions_list[1][0].strftime("%d/%m/%Y")}".center(12) + " || " +
      "#{transactions_list[1][2] if transactions_list[1][1]=='deposit'}".rjust(8) + " || " +
      "#{transactions_list[1][2] if transactions_list[1][1]=='withdrawal'}".rjust(8) + " || " +
      "#{transactions_list[1][3]}".rjust(8) + "\n"

      line2 = "#{transactions_list[0][0].strftime("%d/%m/%Y")}".center(12) + " || " +
              "#{transactions_list[0][2] if transactions_list[0][1]=='deposit'}".rjust(8) + " || " +
              "#{transactions_list[0][2] if transactions_list[0][1]=='withdrawal'}".rjust(8) + " || " +
              "#{transactions_list[0][3]}".rjust(8) + "\n"

      expect { Printer.statement(transactions_list) }.to output(header + line1 + line2).to_stdout
    end
  end
end
