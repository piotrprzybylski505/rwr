# Projekt WebXR

## Opis projektu

Prosty projekt wirtualnej rzeczywistości (VR) stworzony w silniku Godot 4, zoptymalizowany pod kątem działania w przeglądarce (WebXR). Projekt służy jako baza do testowania podstawowych mechanik poruszania się i interakcji bezpośrednio na stronach internetowych.

## Zagraj w przeglądarce

Gra jest hostowana na GitHub Pages i nie wymaga instalacji.
Aby zagrać:
1. Uruchom przeglądarkę w swoich goglach VR (np. Meta Quest Browser).
2. Wejdź pod adres: https://piotrprzybylski505.github.io/rwr/
3. Kliknij przycisk wejścia do trybu VR (Enter VR) na dole ekranu.

## Funkcjonalności

Projekt zawiera w pełni zaimplementowane podstawowe systemy poruszania się:
* **Płynne poruszanie się (Smooth Locomotion):** Oparte na wychyleniu lewego joysticka, umożliwiające swobodne przemieszczanie się po scenie.
* **Obrót skokowy (Snap Turn):** Obrót kamery o równe 45 stopni za pomocą prawego joysticka. Posiada wbudowaną blokadę ciągłego obrotu w celu zapobiegania chorobie lokomocyjnej (wymaga puszczenia i ponownego wychylenia gałki).
* **Teleportacja:** Wykorzystuje `RayCast3D` do wykrywania podłogi (obiektów z fizyczną kolizją). Aktywowana głównym spustem na kontrolerze.

## Sterowanie (WebXR)

| Akcja | Kontroler | Wejście (Input) |
| :--- | :--- | :--- |
| **Płynne chodzenie** | Lewy kontroler | Joystick (`primary`) |
| **Skokowy obrót widoku** | Prawy kontroler | Joystick (`primary`) - Wychylenie na boki |
| **Teleportacja** | Lewy/Prawy kontroler | Spust główny (`trigger_click`) |
