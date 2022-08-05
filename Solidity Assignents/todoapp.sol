// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


struct todo{
    string tasks;
}

contract todoapp{
    mapping(uint8=>mapping(address=>todo[])) map_todo;

    todo[] Todo;

    function setTasks(string memory _tasks,uint8 _id) external{
        map_todo[_id][msg.sender].push(todo(_tasks));
    }
    function getTasks(address _address,uint8 _id,uint8 _index) external view returns(string memory){
        return map_todo[_id][_address][_index].tasks;
    }
    function editTasks(string memory _tasks,uint8 _id,address _address,uint8 _index) external{
        map_todo[_id][_address][_index].tasks=_tasks;
    }
     function DeleteAll(address _address,uint8 _id) external{
       delete map_todo[_id][_address];
    }
    function delTasks(uint8 _id,address _address,uint8 _index) external{
        delete map_todo[_id][_address][_index].tasks;
    }
}