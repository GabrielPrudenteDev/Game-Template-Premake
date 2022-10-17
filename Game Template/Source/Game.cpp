#include <raylib.h>

int main(int argc, char* argv[])
{
	InitWindow(1280, 720, "Game Template");
	SetConfigFlags(FLAG_VSYNC_HINT);
	SetTargetFPS(60);

	do {
		BeginDrawing();
		ClearBackground(DARKGRAY);

		DrawText(TextFormat("FPS: %d", GetFPS()), 50, 50, 25, YELLOW);
		DrawText("Game Template by Canal do Oliveira Dev", GetScreenWidth() / 2 - 235, GetScreenHeight() / 2, 25, YELLOW);

		EndDrawing();
	} while (!WindowShouldClose());
	
	CloseWindowRL();
	
	return 0;
}