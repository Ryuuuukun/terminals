#define TINYBVH_IMPLEMENTATION

#include <SDL3/SDL.h>
#include <iostream>

int main(int argc, char* argv[]) {
    // Инициализация SDL3 (возвращает true при успехе)
    if (!SDL_Init(SDL_INIT_VIDEO)) {
        std::cerr << "Error init SDL: " << SDL_GetError() << std::endl;
        return 1;
    }

    // Получаем и выводим версию SDL3
    int version = SDL_GetVersion();
    std::cout << "Success! Version SDL: "
              << SDL_VERSIONNUM_MAJOR(version) << "."
              << SDL_VERSIONNUM_MINOR(version) << "."
              << SDL_VERSIONNUM_MICRO(version) << std::endl;

    // Пробуем создать окно (800x600)
    SDL_Window* window = SDL_CreateWindow("Тест SDL3", 800, 600, 0);
    if (!window) {
        std::cerr << "Error create window: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return 1;
    }

    std::cout << "Window create! Оно закроется через 3 секунды..." << std::endl;

    // Ждем 3000 миллисекунд (3 секунды), чтобы вы успели увидеть окно
    SDL_Delay(3000);

    // Очистка ресурсов
    SDL_DestroyWindow(window);
    SDL_Quit();

    std::cout << "Программа успешно завершена." << std::endl;
    return 0;
}