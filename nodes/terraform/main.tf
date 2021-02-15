provider "yandex" {
  token     = "AgAAAAAWG_yHAATuwSUStiXpzkGmtS8G7I0kfoA"
  cloud_id  = "b1gaslm0fu2ku0g2r15p"
  folder_id = "b1gjglol49ga8tkukjdk"
  zone      = "ru-central1-a"
}
resource "yandex_compute_instance" "app" {
  name = "node-1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8friju7h1sfq7pkrsg"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e9b89d2081ld96eaa9pv"
    nat       = true
  }  
  
  metadata = {
  ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  connection {
  type = "ssh"
  host = yandex_compute_instance.app.network_interface.0.nat_ip_address
  user = "ubuntu"
  agent = false
  # путь до приватного ключа
  private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
  script = "files/deploy.sh"
  }
  
  provisioner "file" {
  source = "files/reboot.sh"
  destination = "/home/ubuntu/reboot.sh"
  }
  
}
