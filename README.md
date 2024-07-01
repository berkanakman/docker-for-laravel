# Docker for Laravel

Dosyaları projenizi oluşturmak istediğiniz klasörün içerisine indirin ve aşağıdaki gibi "docker-compose.yml" dosyasının içeriğini kendi projenize göre düzenleyin.

Volumes alanındaki [berkan] klasörünün adını projenizin ismi ile değiştirin. 

    volumes:
      - ./berkan:/var/www

Projenizi bu klasörün içerisinde oluşturacaksınız. 
Veritabanı için gereken düzenlemeleri yapın.

      MYSQL_DATABASE: berkan
      MYSQL_ROOT_USER: root
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_USER: berkan_user
      MYSQL_PASSWORD: 123456

Ports alanlarındaki değerleri de isteğinize göre düzenleyin. 

    ports:
      - "8080:80"

    ports:
      - "3390:3306"


Aşağıdaki komutu çalıştırarak ortamınızı yaratmış olursunuz.

    docker-compose up -d
