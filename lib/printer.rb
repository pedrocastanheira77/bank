
class Printer

  def self.statement(transactions_list)
    linewidth = 36
    print "date".center(12) + " || " +
          "credit".center(8) + " || " +
          "debit".center(8) + " || " +
          "balance".center(8) + "\n"
    transactions_list.reverse.each do |transaction|
      print "#{transaction[0].strftime("%d/%m/%Y")}".center(12) + " || " +
            "#{transaction[2] if transaction[1]=='deposit'}".rjust(8) + " || " +
            "#{transaction[2] if transaction[1]=='withdrawal'}".rjust(8) + " || " +
            "#{transaction[3]}".rjust(8) + "\n"
    end
  end
end
