// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Manage_Cars{

    address public owner;
    uint public carCounter;

    //When deployed the contract, assign owner address
    constructor (){
        owner = msg.sender;
    }

    //Ownership control with modifier and require
    modifier onlyOwner (){
        require (owner==msg.sender, "You don't have permission");
        _;
    }

    //Car Object with struct 
    struct Car{
        uint carNum;
        string Brand;
        string Model;
        uint Year;
        uint RegisterTime;
        bool isSale;
    }

    //Mapping defined for find cars from car's Id number
    mapping (uint => Car) public Cars;

    //Car add function
    function addCar(string memory _brand, string memory _model, uint _year) external onlyOwner{

        carCounter++;
        uint carId = carCounter;
        Car memory car;
        car.carNum = carCounter;
        car.Brand = _brand;
        car.Model = _model;
        car.Year = _year;
        car.RegisterTime = block.timestamp;
        car.isSale = true;
        Cars[carId]=car;

    }
}