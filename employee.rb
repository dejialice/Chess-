class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss
  
  def initialize(name, salary, title, boss = nil)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end
  
  def bonus(multiplier)
    self.salary * multiplier
  end
  
  def boss=(boss)
    @boss = boss
    if !boss.nil?
      boss.add_employee(self)
    end
  end
  
end

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss)
    @employees = []
  end
  
  def add_employee(employee)
    @employees << employee
    employee
  end 
  
  def bonus(multiplier)
  self.total_sub_salary * multiplier
  end 
  
  def total_sub_salary
    result = 0
    self.employees.each do |emp|
      if emp.is_a?(Manager)
        result += emp.salary + emp.total_sub_salary
      else
        result += emp.salary
      end
    end
    result
  end 
    
  
end