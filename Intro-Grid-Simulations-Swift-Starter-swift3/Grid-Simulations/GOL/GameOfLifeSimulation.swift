//
//  GameOfLifeSimulation.swift
//  Grid-Simulations
//
//  Created by Yujin Ariza on 3/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class GameOfLifeSimulation: Simulation {

    public var liveChar: Character = "👾"
    
    public override func update() {
        var newGrid: [[Character?]] = grid
        for y in 0..<grid[0].count {
            for x in 0..<grid.count {
                if grid[x][y] == liveChar && countNeighbors(grid: grid, column: x, row: y) < 2 {
                    newGrid[x][y] = nil
                }
                if grid[x][y] == liveChar && countNeighbors(grid: grid, column: x, row: y) > 3 {
                    newGrid[x][y] = nil
                }
                if grid[x][y] == liveChar && countNeighbors(grid: grid, column: x, row: y) == 2 {
                    newGrid[x][y] = liveChar
                }
                if grid[x][y] == liveChar && countNeighbors(grid: grid, column: x, row: y) == 3 {
                    newGrid[x][y] = liveChar
                }
                if grid[x][y] == nil && countNeighbors(grid: grid, column: x, row: y) == 3 {
                    newGrid[x][y] = liveChar
                }}}
        grid = newGrid
    }


    func getAlive(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        if x < 0 || x > grid.count - 1 || y < 0 || y > grid[0].count - 1 {
            return 0
        }
        else {
            if grid[x][y] == nil {
                return 0
            } else {return 1}
            
        }
    }
    
 func countNeighbors(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        
        let alive: Int = getAlive(grid: grid, column: x - 1, row: y)
        let alive2: Int = getAlive(grid: grid, column: x + 1, row: y)
        let alive3: Int = getAlive(grid: grid, column: x, row: y + 1)
        let alive4: Int = getAlive(grid: grid, column: x, row: y - 1)
        let alive5: Int = getAlive(grid: grid, column: x - 1, row: y - 1)
        let alive6: Int = getAlive(grid: grid, column: x - 1, row: y + 1)
        let alive7: Int = getAlive(grid: grid, column: x + 1, row: y + 1)
        let alive8: Int = getAlive(grid: grid, column: x + 1, row: y - 1)
        
        return alive + alive2 + alive3 + alive4 + alive5 + alive6 + alive7 + alive8
    }

}
