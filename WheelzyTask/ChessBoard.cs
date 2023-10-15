namespace WheelzyTask;
public static class ChessBoard
{
    public static int FindKnightPossibleMoves(int[,] mat, int currentKnightPositionX, int currentKnightPositionY)
    {

        int matXLength = mat.GetLength(0);
        int matYLength = mat.GetLength(1);

        if (matXLength != matYLength)
            return -1;

        //All Possible moves
        int[] X_Moves = [2, 1, -1, -2, -2, -1, 1, 2];
        int[] Y_Moves = [1, 2, 2, 1, -1, -2, -2, -1];

        int count = 0;


        for (int i = 0; i < 8; i++)
        {
            int x = currentKnightPositionX + X_Moves[i];
            int y = currentKnightPositionY + Y_Moves[i];


            if (x >= 0 && y >= 0 && x < matXLength && y < matYLength && mat[x, y] == 0)
                count++;
        }


        return count;
    }
}
