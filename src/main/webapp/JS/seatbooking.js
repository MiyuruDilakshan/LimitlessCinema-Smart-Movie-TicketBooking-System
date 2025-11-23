/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Get current URL
let url = window.location.href;
let url_segment = url.split('?');

// Get Play Button and Video Elements
let play_btn = document.getElementById('play');
let video = document.getElementById('video');

// Play/Pause Video Functionality
play_btn.addEventListener('click', () => {
    if (video.paused) {
        video.play();
        video.style.display = 'unset';
        play_btn.classList.remove('bi-play-fill');
        play_btn.classList.add('bi-pause');
    } else {
        video.pause();
        video.style.display = 'none';
        play_btn.classList.add('bi-play-fill');
        play_btn.classList.remove('bi-pause');
    }
});

// Loop Video When Ended
video.addEventListener('ended', () => {
    video.play();
});

// Highlight Current Date
let date = new Date();
let main_date = date.getDate();

Array.from(document.getElementsByClassName('date_point')).forEach((el) => {
    if (parseInt(el.innerText) === main_date) {
        el.classList.add('h6_active');
    }
});

// Movie Data
let pvr = [
    {
        pvr: 'PVR Vegus',
        movie: 'Jawan',
        loc: 'Dwarka Sector 14, New Delhi',
        audi: 1,
        type: 'IMAX',
        series: ['J', 'H', 'F', 'E', 'D', 'C', 'B', 'A'],
        row_section: 3,
        seat: 24,
        j: [2, 6, 24, 23, 7, 16, 17, 18, 19, 13, 12],
        h: [1, 2, 78, 20, 23, 8, 11, 18, 19, 13, 12],
        f: [5, 6, 15, 17, 18],
        e: [2, 7, 8, 17, 18],
        d: [5, 16, 15, 23, 22],
        c: [1, 2, 11, 12, 19],
        b: [8, 5],
        a: [],
        price: [800, 800, 560, 560, 560, 560, 430, 430],
        date: 23
    }
];

// Function to Add Seats to the DOM
let addSeats = (arr) => {
    arr.forEach((el) => {
        const { series, seat, price, ...rows } = el;

        // Loop through series to create rows
        series.forEach((rowKey, index) => {
            let row = document.createElement('div');
            row.className = 'row';

            let booked_seats = rows[rowKey.toLowerCase()] || [];

            // Create seats in the row
            for (let i = 0; i < seat; i++) {
                if (i === 0) {
                    let span = document.createElement('span');
                    span.innerText = rowKey;
                    row.appendChild(span);
                }

                let li = document.createElement('li');
                li.className = booked_seats.includes(i) ? 'seat booked' : 'seat';
                li.id = `${rowKey}${i}`;
                li.innerText = price[index];
                li.onclick = () => {
                    if (!li.classList.contains('booked')) {
                        li.classList.toggle('selected');
                    }
                    let selectedSeats = document.querySelectorAll('.seat.selected');
                    document.getElementById('book_ticket').style.display = selectedSeats.length > 0 ? 'unset' : 'none';
                };

                row.appendChild(li);

                if (i === seat - 1) {
                    let span = document.createElement('span');
                    span.innerText = rowKey;
                    row.appendChild(span);
                }
            }

            document.getElementById('chair').appendChild(row);
        });
    });
};

// Call the function to render seats
addSeats(pvr);
