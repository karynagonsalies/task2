import UIKit

//Zadanie nr 2 - Konta bankowe
//1. Stwórz metodę, która przyjmuje numer konta jako string i zwraca obiekt typu BankAccount, który zawiera: numer konta, identyfikator banku, nazwę banku,
//2. jeśli numer konta nie wskazuje na żaden bank zwróć nil,
//3. dodatkowo metoda powinna sprawdzać czy liczba cyfr w numerze konta jest prawidłowa,
//4. wszystkie informacje odnośnie procesu identyfikacji banku znajdziesz pod adresem: https://
//www.najlepszekonto.pl/identyfikacja-banku-po-numerze-konta

let dictionaryBank = [
    "1010":    "Narodowy Bank Polski",
    "1020":    "PKO BP",
    "1030":    "Bank Handlowy (Citi Handlowy)",
    "1050":    "ING",
    "1060":    "BPH",
    "1090":    "BZ WBK",
    "1130":    "BGK",
    "1140":    "mBank, Orange Finanse",
    "1160":    "Bank Millennium",
    "1240":    "Pekao",
    "1280":    "HSBC",
    "1320":    "Bank Pocztowy",
    "1470":    "Eurobank",
    "1540":    "BOŚ",
    "1580":    "Mercedes-Benz Bank Polska",
    "1610":    "SGB - Bank",
    "1670":    "RBS Bank (Polska)",
    "1680":    "Plus Bank",
    "1750":    "Raiffeisen Bank",
    "1840":    "Societe Generale",
    "1870":    "Nest Bank",
    "1910":    "Deutsche Bank Polska",
    "1930":    "Bank Polskiej Spółdzielczości",
    "1940":    "Credit Agricole Bank Polska",
    "1950":    "Idea Bank",
    "2030":    "BGŻ BNP Paribas",
    "2070":    "FCE Bank Polska",
    "2120":    "Santander Consumer Bank",
    "2130":    "Volkswagen Bank",
    "2140":    "Fiat Bank Polska",
    "2160":    "Toyota Bank",
    "2190":    "DnB Nord",
    "2480":    "Getin Noble Bank",
    "2490":    "Alior Bank, T-Mobile Usługi Bankowe"]

class BankAccount{
    var number: String
    var idBank: String
    var nameBank: String
    
    init(number: String, idBank: String, nameBank: String) {
        self.number = number
        self.idBank = idBank
        self.nameBank = nameBank
    }
}

func devide(account: String, number: Int) -> String {
    let startIndex = account.index(account.startIndex, offsetBy: number)
    let endIndex = account.index(startIndex, offsetBy: 4)
    let idBank = account[startIndex..<endIndex]
    
    return String(idBank)
}

func countLengthOf(account: String) -> String?{
    
    let lengthAcount = account.count
    
    if lengthAcount == 28 {
        let idBank28 = devide(account: account, number: 4)
        print("\(account) is an International Bank Account Number.")
        return String(idBank28)
        
    } else if lengthAcount == 26 {
        let idBank26 = devide(account: account, number: 2)
        print("\(account) is the Bank Account Number.")
        return String(idBank26)
        
    } else {
        
        print("Invalid Bank account. Please check your account!")
        return nil
    }
}

func findNameBank(account: String) -> BankAccount?{
    
    let idBank = countLengthOf(account: account)
    if idBank == nil{
        return nil
    }
    
    for (id, name) in dictionaryBank{
        if id == idBank {
            print("Bank Id is \(id). Name of Bank is \(name).")
            return BankAccount(number: account, idBank: id, nameBank: name)
        }
    }
    print("Sorry! The identifier of the current bank doesn't exist.")
    return nil
}

print("Example 1")
findNameBank(account: "KL86105024981234567899876543")

print("\nExample 2")
findNameBank(account: "86116024981234567899876543")

print("\nExample 3")
findNameBank(account: "K861050gjjhkhljklkl24981234567899876543")

print("\nExample 4")
findNameBank(account: "UK86000024981234567899876543")
