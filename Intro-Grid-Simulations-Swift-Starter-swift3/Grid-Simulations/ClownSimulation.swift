//
//  ClownSimulation.swift
//  Grid-Simulations
//
//  Created by Emily Chin on 6/23/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation

public class ClownSimulation: Simulation {
    var newGrid: [[Character?]] = []
    public override func setup() {
        grid = [[Character?]](repeating: [Character?](repeating: nil, count: 10), count: 10)
        for x in 0..<grid.count {
            for y in 0..<grid[0].count {
                if randomZeroToOne() < 0.4 {
                    grid[x][y] = "⛄️"
                }
            }
        }
    }
    
    public override func update() {
        clownRun()
    }
    
    func getNeighborPositions(x originX: Int, y originY: Int) -> [(x: Int, y: Int)] {
        var neighbors: [(x:Int, y:Int)] = []
        for x in originX - 1 ... originX + 1 {
            for y in originY - 1 ... originY + 1 {
                if x >= 0 && y >= 0 && x < grid.count && y < grid[0].count {
                    if !(x == originX && y == originY) {
                        neighbors.append((x,y))
                    }
                }
            }
        }
        return neighbors
    }
    
    func clownRun() {
        newGrid = grid
        for x in 0..<grid.count {
            for y in 0..<grid[0].count {
                if grid[x][y] == "⛄️" {
                    for neighborCoords in getNeighborPositions(x: x, y: y) {
                        let neighbor = grid[neighborCoords.x][neighborCoords.y]
                        if neighbor == "💄" {
                            newGrid[x][y] = "👄"
                        }
                    }
                }
                if grid[x][y] == "👄" {
                    newGrid[x][y] = nil
                }
                if grid[x][y] == nil {
                    if randomZeroToOne() < 0.05 {
                        newGrid[x][y] = "⛄️"
                    }
                    else if randomZeroToOne() < 0.05 {
                        newGrid[x][y] = "💄"
                
                    }
                }
                if grid[x][y] == "💄" {
                    newGrid[x][y] = nil
                }
            }
        }
        grid = newGrid
    }
    
}
