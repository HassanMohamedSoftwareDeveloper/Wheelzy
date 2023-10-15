using Newtonsoft.Json;
using System.Net.Http.Json;

namespace WheelzyTask;
public static class ThirdPartyCaller
{
    #region Methods :
    public static async Task CallThirdPartAPIAsync()
    {
        int guessedNumber = Random.Shared.Next(1000, 9999);

        var listOfCalls = Enumerable.Range(0, 10)
            .Select(x => CallAPIAsync());

        var resultArray = await Task.WhenAll(listOfCalls);
        if (resultArray.Contains(guessedNumber))
        {
            Console.WriteLine("You won");
        }
        else
        {
            Console.WriteLine("You lose");
        }
    }
    #endregion

    #region Helpers :
    private static async Task<int> CallAPIAsync()
    {
        try
        {
            using HttpClient client = new()
            {
                BaseAddress = new Uri("https://notrealapi.com/")
            };
            var response = await client.PostAsJsonAsync("lottery/play", new { CustomerNumber = 100 });
            if (response == null) return default;
            response.EnsureSuccessStatusCode();
            var content = await response.Content.ReadAsStringAsync();
            if (string.IsNullOrWhiteSpace(content)) return default;
            int number = JsonConvert.DeserializeObject<int>(content);
            return number;
        }
        catch (Exception)
        {
            return default;
        }
    }
    #endregion
}
