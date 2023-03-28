from flask import render_template
import netifaces

from firstapp import app


@app.route('/')
def index():
    # Pobieramy listę interfejsów sieciowych
    interfaces = netifaces.interfaces()

    # Tworzymy słownik, który będzie przechowywał adresy IP dla każdego interfejsu
    ips = {}

    for interface in interfaces:
        # Pobieramy listę adresów IP dla danego interfejsu
        interface_ips = netifaces.ifaddresses(interface).get(netifaces.AF_INET)

        # Jeśli interfejs ma przypisany adres IP, dodajemy go do słownika
        if interface_ips:
            ips[interface] = interface_ips[0]['addr']

    # Pobieramy wersję aplikacji z zmiennej środowiskowej
    version = app.config.get('VERSION', '2.0')

    # Renderujemy szablon HTML z przekazanymi danymi
    return render_template('index.html', interfaces=ips, version=version)
