$(function() {
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd'
    });

    const timeButtonsContainer = $('#time-buttons');
    for (let i = 0; i < 24; i++) {
        let hour = i.toString().padStart(2, '0'); // i 값을 두 자리 숫자로 변환
        timeButtonsContainer.append(`<div class="time-slot" data-value="0" data-time="${i}:00">${i}:00</div>`);
        timeButtonsContainer.append(`<div class="time-slot" data-value="0" data-time="${i}:30">${i}:30</div>`);
    }

    $('.time-slot').click(function() {
        $(this).toggleClass('selected');
    });

    // 전송 버튼 클릭 시 데이터 전송
    $('#submitBtn').click(function() {
        const selectedDate = $("#datepicker").val(); // 선택된 날짜

        // 선택된 시간 슬롯을 바탕으로 result 문자열 생성
        let result = '';
        $('.time-slot').each(function() {
            if ($(this).hasClass('selected')) {
                result += '1';
            } else {
                result += '0';
            }
        });

        // 서버로 데이터 전송
        $.ajax({
            type: 'POST',
            url: '/ex/vendor/scheduleinsert',  // 서버의 실제 엔드포인트로 변경
            data: {
                date: selectedDate,
                timeSlots: result
            },
            success: function(response) {
                alert('데이터가 성공적으로 전송되었습니다!');
                // 서버 응답에 따라 추가 처리
            },
            error: function(xhr, status, error) {
                alert('데이터 전송에 실패했습니다: ' + error);
            }
        });
    });
    

    $("#datepicker").click(function() {
    	// alert($(this).val());
    })
    //사업자 id
    //사업자 번호
    //날짜
    //시간문자열
    //초기화된 예약가능여부
});


/*
$(function() {
$("#datepicker").datepicker({
    dateFormat: 'yy-mm-dd'
});

const timeButtonsContainer = $('#time-buttons');
for (let i = 0; i < 24; i++) {
    let hour = i.toString().padStart(2, '0'); // i 값을 두 자리 숫자로 변환
    timeButtonsContainer.append(`<div class="time-slot" data-value="0" data-time="${i}:00">${i}:00</div>`);
    timeButtonsContainer.append(`<div class="time-slot" data-value="0" data-time="${i}:30">${i}:30</div>`);
}

$('.time-slot').click(function() {
    $(this).toggleClass('selected');

    let result = '';
    $('.time-slot').each(function() {
        if ($(this).hasClass('selected')) {
            result += '1';
        } else {
            result += '0';
        }
    });

    
});

$("#datepicker").click(function() {
	// alert($(this).val());
})

});

*/