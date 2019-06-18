Group.delete_all
Group.create(number: '151701c',
             specialty: %{ПОИТ},
             specialization: %{Веб-технологии и программное обеспечение мобильных систем})

Discipline.delete_all
Discipline.create(name: 'Математика',
                  teacher: %{Петров В.А.},
                  semester: %{1, 2, 3})

User.delete_all
User.create(name: 'admin',
            password: 'admin',
            password_confirmation: 'admin')