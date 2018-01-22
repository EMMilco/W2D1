class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary.to_i * multiplier
  end

end


class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, options={})
    defaults = {boss: nil, employees: []}
    options.merge(defaults)
    super
    @employees = options[:employees]
  end

  def bonus(multiplier)
    return super if employees.empty?

    employee_bonuses = employees.map { |employee| employee.salary.to_i }
    employee_bonuses.reduce(:+) * multiplier
  end

end
