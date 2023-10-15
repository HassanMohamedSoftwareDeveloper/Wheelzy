using System.Collections;

namespace WheezlyTask.UnitTests;
internal class TestDataGenerator : IEnumerable<object[]>
{
    private readonly List<object[]> _data = new()
    {
        new object[] {new [,] { { 1, 0, 1 }, { 0, 1, 1 }, { 1, 1, 0 }, { 0, 1, 1 } }, 2,2, -1},
        new object[] {new [,] { { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 } }, 2,2, 0},
        new object[] {new [,] { { 1, 0, 1, 0 }, { 0, 1, 1, 1 }, { 1, 1, 0, 1 }, { 0, 1, 1, 1 } }, 2,2, 4},
        new object[] {new [,] {
                        { 1, 0, 1, 1, 1, 1, 1,1  },
                        { 1, 1, 1, 1, 1, 1, 1, 1 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 1, 1, 1, 1, 1, 1, 1, 1 },
                        { 1, 1, 1, 1, 1, 1, 1, 1 }
                       }, 1,0, 2},

        new object[] {new [,] {
                        { 1, 0, 1, 1, 1, 1, 1,1  },
                        { 1, 1, 1, 1, 1, 1, 1, 1 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 0, 0, 0, 0, 0, 0, 0, 0 },
                        { 1, 1, 1, 1, 1, 1, 1, 1 },
                        { 1, 1, 1, 1, 1, 1, 1, 1 }
                       }, 1,0, 3},
    };

    public IEnumerator<object[]> GetEnumerator() => _data.GetEnumerator();
    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
}
