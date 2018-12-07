import flatpickr from 'flatpickr';

const dateSelector = function() {
  const startDateinput = document.getElementById('booking_start_date');
  const endDateinput = document.getElementById('booking_end_date');

  if (startDateinput && endDateinput) {
    flatpickr(startDateinput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
  });
    const endDateCalendar =
      flatpickr(endDateinput, {
        dateFormat: 'd-m-Y',
      });
  }


}

export { dateSelector }
