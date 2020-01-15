const selectTag = document.getElementById('select');

const handleSelectChange = () => {
  selectTag.addEventListener('click', (event) => {
    console.log(event.toElement.value);
    window.location.href = `/country_revenues/${event.toElement.value}`;
  });
};

export default handleSelectChange;
