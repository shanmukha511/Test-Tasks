provider "kubernetes" {
  config_path = "~/.kube/config"
}


resource "kubernetes_deployment" "snappass-redis" {
  metadata {
    name = "snappass-redis"
    labels = {
      app = "snappass"
      name = "snappass-redis"
      tier = "backend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "snappass-redis"
      }
    }

    template {
      metadata {
        labels = {
          app = "snappass-redis"
        }
      }

      spec {
        container {
          image = "redis"
          name  = "redis"
                   port {
                        container_port = 6379
                    }


        }
      }
    }
  }
}

resource "kubernetes_service" "snappass-redis" {
  metadata {
    name = "snappass-redis"
         labels = {
      app = "snappass"
      name = "snappass-redis"
      tier = "backend"
    }
  }
  spec {
    selector = {
      app = "snappass-redis"
    }
    port {
      port      = 6379
      protocol = "TCP"
      target_port = 6379
    }
    type = "ClusterIP"
  }
}


resource "kubernetes_deployment" "snappass" {
  metadata {
    name = "snappass"
    labels = {
      app = "snappass"
      name = "snappass"
      tier = "backend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "snappass"
      }
    }

    template {
      metadata {
        labels = {
          app = "snappass"
        }
      }

      spec {
        container {
          image = "shanmukha511/splunk-hec-private:snap"
          name  = "snap"
                  env {
                        name = "REDIS_HOST"
                        value = "snappass-redis"
                    }
                   port {
                        container_port = 5000
                    }


        }
      }
    }
  }
}

resource "kubernetes_service" "snappass" {
  metadata {
    name = "snappass"
         labels = {
      app = "snappass"
      name = "snappass"
      tier = "backend"
    }
  }
  spec {
    selector = {
      app = "snappass"
    }
    port {
      port      = 5000
      protocol = "TCP"
      target_port  = 5000
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "snappass-nginx" {
  metadata {
    name = "snappass-nginx"
    labels = {
      app = "snappass"
      name = "snappass-nginx"
      tier = "frontend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "snappass-nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "snappass-nginx"
        }
      }

      spec {
        container {
          image = "shanmukha511/splunk-hec-private:nginx"
          name  = "nginx"
                   port {
                        container_port = 443
                    }


        }
      }
    }
  }
}

resource "kubernetes_service" "snappass-nginx" {
  metadata {
    name = "snappass-nginx"
         labels = {
      app = "snappass"
      name = "snappass-nginx"
      tier = "frontend"
    }
  }
  spec {
    selector = {
      app = "snappass-nginx"
    }
    port {
      port      = 443
      protocol = "TCP"
      target_port = 443
    }
    type = "LoadBalancer"
  }
}