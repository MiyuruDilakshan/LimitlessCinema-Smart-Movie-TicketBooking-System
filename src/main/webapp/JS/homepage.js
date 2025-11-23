/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const carouselItems = document.querySelectorAll('.carousel-item');
const prevButton = document.querySelector('.carousel-control.prev');
const nextButton = document.querySelector('.carousel-control.next');
const viewButton = document.getElementById('view-button');
const bookButton = document.getElementById('book-button');
let currentIndex = 0;

function updateCarousel(index) {
  // Hide all items
  carouselItems.forEach(item => item.style.transform = `translateX(-${index * 100}%)`);
  
  // Update buttons' links
  const currentItem = carouselItems[index];
  viewButton.href = currentItem.dataset.viewLink;
  bookButton.href = currentItem.dataset.bookLink;
}

prevButton.addEventListener('click', () => {
  currentIndex = (currentIndex > 0) ? currentIndex - 1 : carouselItems.length - 1;
  updateCarousel(currentIndex);
});

nextButton.addEventListener('click', () => {
  currentIndex = (currentIndex < carouselItems.length - 1) ? currentIndex + 1 : 0;
  updateCarousel(currentIndex);
});

// Initialize carousel
updateCarousel(currentIndex);











document.addEventListener('DOMContentLoaded', () => {
  const movieTrack = document.querySelector('.movie-track');
  const leftBtn = document.querySelector('.left-btn');
  const rightBtn = document.querySelector('.right-btn');

  let currentIndex = 0;
  const maxIndex = 4; // 8 images, 4 visible at a time

  rightBtn.addEventListener('click', () => {
    if (currentIndex < maxIndex) {
      currentIndex++;
      movieTrack.style.transform = `translateX(-${currentIndex * 25}%)`;
    }
  });

  leftBtn.addEventListener('click', () => {
    if (currentIndex > 0) {
      currentIndex--;
      movieTrack.style.transform = `translateX(-${currentIndex * 25}%)`;
    }
  });
});

