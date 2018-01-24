/**
 * Created by Mtime on 2018/1/2.
 */

var url = "http://node3:8000/limit";

$(function () {
    $("#limitConn").click(function (e) {
        testLimit();
    })
})

function testLimit() {
    var size = $("#connSize").val();
    for(var i =0;i<size;i++){
        $.ajax({
            url:url,
            dataType:"text",
            type:"GET",
            success:function (data) {
                console.log("访问成功！"+new Date())
                console.log(data)

            },
            error:function (error) {
                console.log("访问失败！"+new Date())
                console.log(error)
            }
        });
    }
   

};


