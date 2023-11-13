# IaC

## Wymgania:
- vagrant: https://developer.hashicorp.com/vagrant/docs/installation
- virtualbox: https://www.virtualbox.org
- 4GB pamięci operacyjnej zostały zarezerwowane dla 5 maszyn (ilość pamięci można zmienić w pliku Vagrantfile, konkretnie w linii zawierającej "vb.memory", która przyjmuje wartość wyrażoną w MB)

![image](https://github.com/bmajczak/IaC/assets/145698965/6629a318-02ab-4918-856e-b931729dec33)


## Utworzenie maszyn oraz weryfikacja:
- zmiana katalogu na ten, w którym znajduje się Vagrantfile
- wywołanie komendy "vagrant up"
  ![image](https://github.com/bmajczak/IaC/assets/145698965/c7f5d9f5-c093-467c-8fc0-550079a56045)
- opcjonalnie można sprawdzić za pomocą "vagrant global-status" czy wszystkie maszyny są uruchomione
  ![image](https://github.com/bmajczak/IaC/assets/145698965/60db569e-8ae4-4538-95ed-6ad817392b0a)
- jeśli maszyny wirtualne zostały uruchomione to pod addresem "http://web01" powinna być widoczna strona internetowa z tabelą wypełnioną danymi z bazy danych oraz przy odświeżaniu powinien zmieniać się serwer http (chwilowo nie do odróżnienia) 
![image](https://github.com/bmajczak/IaC/assets/145698965/da42903c-490e-488b-a2b0-07039a38191e)
- można również sprawdzić poszczególne strony internetowe odwiedzając "http://app01" lub "http://app02" (aktualnie są identyczne)
- logowanie do maszyny wirtualnej umożliwia komenda "vagrant ssh nazwa_maszyny"
![image](https://github.com/bmajczak/IaC/assets/145698965/b5624843-4fb6-4bf2-b78f-07d50cedeac5)
- do zatrzymania maszyn służy "vagrant halt" a do usunięcia "vagrant destroy" (można sprecyzować, którą maszyne chcemy zatrzymac lub usunąć)
