using FluentAssertions;
using WheelzyTask;

namespace WheezlyTask.UnitTests;

public class ChessBoardTests
{
    //[Fact]
    //public void FindKnightPossibleMoves_Should_be_Minus_one_When_XLengthNotEqual_YLength()
    //{
    //    int[,] mat = { { 1, 0, 1 }, { 0, 1, 1 }, { 1, 1, 0 }, { 0, 1, 1 } };
    //    var passibleMoves = ChessBoard.FindKnightPossibleMoves(mat, 2, 2);
    //    passibleMoves.Should().Be(-1);
    //}
    //[Fact]
    //public void FindKnightPossibleMoves_Should_be_Zero_When_XLengthNotEqual_YLength()
    //{

    //    int[,] mat = { { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 } };
    //    var passibleMoves = ChessBoard.FindKnightPossibleMoves(mat, 2, 2);
    //    passibleMoves.Should().Be(0);
    //}
    //[Fact]
    //public void FindKnightPossibleMoves_Should_be_Four_When_XLengthNotEqual_YLength()
    //{
    //    int[,] mat = { { 1, 0, 1, 0 }, { 0, 1, 1, 1 }, { 1, 1, 0, 1 }, { 0, 1, 1, 1 } };
    //    var passibleMoves = ChessBoard.FindKnightPossibleMoves(mat, 2, 2);
    //    passibleMoves.Should().Be(4);
    //}
    //[Fact]
    //public void FindKnightPossibleMoves_Should_be_Two_When_XLengthNotEqual_YLength()
    //{
    //    int[,] mat = {
    //                    { 1, 0, 1, 1, 1, 1, 1,1  },
    //                    { 1, 1, 1, 1, 1, 1, 1, 1 },
    //                    { 0, 0, 0, 0, 0, 0, 0, 0 },
    //                    { 0, 0, 0, 0, 0, 0, 0, 0 },
    //                    { 0, 0, 0, 0, 0, 0, 0, 0 },
    //                    { 0, 0, 0, 0, 0, 0, 0, 0 },
    //                    { 1, 1, 1, 1, 1, 1, 1, 1 },
    //                    { 1, 1, 1, 1, 1, 1, 1, 1 }
    //                   };
    //    var passibleMoves = ChessBoard.FindKnightPossibleMoves(mat, 1, 0);
    //    passibleMoves.Should().Be(2);
    //}

    [Theory]
    [ClassData(typeof(TestDataGenerator))]
    public void FindKnightPossibleMoves_Tests(int[,] mat, int XPosition, int YPosition, int count)
    {
        var passibleMoves = ChessBoard.FindKnightPossibleMoves(mat, XPosition, YPosition);
        passibleMoves.Should().Be(count);
    }
}