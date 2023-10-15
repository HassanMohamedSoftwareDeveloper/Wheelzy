DECLARE @FromDate DATE='2023-10-09', @ToDate DATE='2023-11-01'
SELECT
	Offer.Id AS 'Offer ID'
   ,Offer.OfferDate AS 'Offer Date'
   ,Buyer.Name AS 'Current Buyer'
   ,OfferAmount.Amount AS 'Current Amount'
   ,Status.Name AS 'Current Status'
   
FROM Offers Offer
JOIN OfferStatuses OfferStatus
ON Offer.Id = OfferStatus.OfferId AND OfferStatus.IsCurrent=1
JOIN Statuses [Status]
ON OfferStatus.StatusId=Status.Id
JOIN OfferAmounts OfferAmount
	ON Offer.Id = OfferAmount.OfferId AND OfferAmount.IsCurrent=1
	JOIN Buyers Buyer 
	ON OfferAmount.BuyerId=Buyer.Id
	WHERE Offer.OfferDate BETWEEN @FromDate AND @ToDate
