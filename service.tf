resource "kubernetes_service" "elb" {
  metadata {
    name = "${var.env}-${var.service_name}"
    namespace = "${var.env}-${var.namespace}"
  }
  spec {
    selector = {
      app = "MyApp"
    }
    session_affinity = "ClientIP"
    port {
      port = var.port1
      target_port = var.target_port
    }

    type = var.type_service
  }
}

resource "kubernetes_pod" "elb" {
  metadata {
    name = var.service_name
    labels = {
      app = "MyApp"
    }
  }

  spec {
    container {
      image = var.image
      name  = var.container_name
    }
  }
}