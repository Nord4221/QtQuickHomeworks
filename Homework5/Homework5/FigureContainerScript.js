function FigureContainerObj(newFigureName)
{
    this.currentFigureName = newFigureName
    var FigureSize
    var housePoints = [[2,2], [3,1], [4, 2], [4,4], [2,4]]
    var hourglassPoints = [[2,2], [4, 2], [4, 3], [3, 3.5], [4,4], [4,5], [2,5], [2,4], [3,3.5], [2,3], [2,2]]
    this.getFigurePointsArr = function()
    {
        if(this.currentFigureName == "House")
        {
            FigureSize = 5
            return housePoints
        }
        else if(this.currentFigureName == "Hourglass")
        {
            FigureSize = 11
            return hourglassPoints
        }
    }
    this.getFigurePointsAmount = function() {return FigureSize}
}
