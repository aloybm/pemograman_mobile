<h1>Final Project: WeatherApp using Firestore Database and Authentication</h1>

<h2>App Overview</h2>
<div style="display: flex; align-items: center;">
  <div style="flex: 1;">
    <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/221328f7-9ffb-4e06-a2fb-33505adaa1fd">
  </div>
  <div style="flex: 1;">
    WeatherApp menggunakan Firestore Database dan Authentication untuk menyediakan informasi cuaca yang terpercaya dan mudah diakses.
  </div>
</div>

## Widget Variety

![Widget Variety](https://github.com/aloybm/pemograman_mobile/assets/100351038/0e9f3e88-80c6-437a-a261-e0978a480e19)

- **auth_state_widget**: widget untuk melakukan pengecekan apakah user sudah login atau belum
- **edit_weather_screen**: widget untuk mengupdate history city weather data
- **history_screen**: widget untuk menampilkan list history
- **weather_dialog**: widget untuk menampilkan detail history, tombol navigator ke edit, dan tombol delete
- **home**: widget untuk menampilkan tampilan home
- **weather**: widget untuk mencari cuaca kota
- **weather_info_card** dan **weather_info_row**: widget untuk menampilkan card data cuaca
- **folder login**: widget untuk form login
- **folder register**: widget untuk form register
- **start_screen**: widget menampilkan start screen
- **circleimg**: widget untuk membuat gambar berbentuk lingkaran


## State Management

- **State Implementation**: Aplikasi ini sudah menggunakan `StatefulWidget` dan `State classes`.
- **State Modification**: Menggunakan `setState` di setiap task seperti loading, login, register, mencari cuaca kota, dan update nama kota sehingga UI secara dinamis akan terupdate berdasarkan state changes yang dikelola oleh `setState`.
- **UI Interaction**: UI Interaction berupa `Dialog` dan `ScaffoldMessenger` pada Add data, Edit data, Delete data, Error handling, dan loading yang sudah terupdate secara dinamis.

<h2>Handle Data & Form Validation</h2>

<h3>Login Page </h3>
<table style="width: 100%; border-collapse: collapse;">
  <tr>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Success Login</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/e0958c4a-a117-439c-901f-2951bc69000a" width="215" height="480">
    </td>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Error Login</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/822d3c99-7a9c-4c3e-83c9-8a5c2ed097f8" width="215" height="480">
    </td>
  </tr>
</table>


<h3>Register Page </h3>
<table style="width: 100%; border-collapse: collapse;">
  <tr>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Success Register</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/097828ef-6851-43bc-a57f-0a97f986cf47" width="215" height="480">
    </td>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Error Register</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/29b3f383-e49e-4060-b5f6-e2cab321acfb" width="215" height="480">
    </td>
  </tr>
</table>

<h3>Home Page </h3>
<table style="width: 100%; border-collapse: collapse;">
  <tr>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Success Add Weather Data</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/d3e3785b-d2fa-473b-be61-6fefce30ef04" width="215" height="480">
    </td>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Error Add Weather Data</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/c50068ca-b196-44d7-b66d-2b7d4a8e6ce6" width="215" height="480">
    </td>
  </tr>
</table>

<h3>Edit History Page </h3>
<table style="width: 100%; border-collapse: collapse;">
  <tr>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Success Update Weather Data</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/81e0f1fe-02fd-4480-aea8-2d91b74dd8f5" width="215" height="480">
    </td>
    <td style="width: 50%; padding: 10px; border: 1px solid #ccc;">
      <h4>Error Update Weather Data</h4>
      <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/e12c3cac-03a3-40a6-bbcc-e4fa77a4f4bb" width="215" height="480">
    </td>
  </tr>
</table>

<h3>Delete History Page </h3>
<div style="display: flex; ">
    <img src="https://github.com/aloybm/pemograman_mobile/assets/100351038/7f00e81a-2f06-4214-8470-7ac22f8f952f" width="215" height="480">
</div>

## Backend

- **Create**: Menambahkan data cuaca berdasarkan nama kota.
- **Read**: Mengambil data cuaca di dalam database.
- **Update**: Mengupdate atau mengedit nama kota lalu merubah data cuaca berdasarkan nama kota yang sudah di update yang ada di database.
- **Delete**: Menghapus data cuaca di database.

<h2>CRUD Firebase</h2>
<img src="https://github.com/user-attachments/assets/a4d31ea7-31e7-4fcc-96b9-81397e996bd2">

<h2>Authentication</h2>
<img src="https://github.com/user-attachments/assets/611ec495-9386-4522-b0ac-bc0810027b81">

<h2>Demo App</h2>
https://github.com/aloybm/pemograman_mobile/assets/100351038/c5aa3a47-a837-4bda-9ad1-c8d36fde35dc





