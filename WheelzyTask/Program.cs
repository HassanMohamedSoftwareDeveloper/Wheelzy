using WheelzyTask;

//await ThirdPartyCaller.CallThirdPartAPIAsync();

int[,] mat = { { 1, 0, 1, 0 }, { 0, 1, 1, 1 }, { 1, 1, 0, 1 }, { 0, 1, 1, 1 } };
int[,] mat1 = {
    { 1, 0, 1, 1, 1, 1, 1,1  },
    { 1, 1, 1, 1, 1, 1, 1, 1 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 1, 1, 1, 1, 1, 1 },
    { 1, 1, 1, 1, 1, 1, 1, 1 }
};


var passibleMoves = ChessBoard.FindKnightPossibleMoves(mat1, 1, 0);
Console.WriteLine($"Possible Moves : {passibleMoves}");