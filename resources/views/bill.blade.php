<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill</title>
    <!-- Boxicons CSS -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="{{ url('assets/css/font_lao.css') }}">
    <!-- Core CSS -->
    <link rel="stylesheet" href="{{ url('assets/vendor/css/core.css') }}" class="template-customizer-core-css">
    <link rel="stylesheet" href="{{ url('assets/vendor/css/theme-default.css') }}" class="template-customizer-theme-css">
    <link rel="stylesheet" href="{{ url('assets/css/demo.css') }}">
    <link rel="stylesheet" href="{{ url('assets/css/font_lao.css') }}">
    
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="{{ url('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css') }}"> 
    <link rel="stylesheet" href="{{ url('assets/vendor/libs/apex-charts/apex-charts.css') }}">
    @vite('resources/css/app.css')
</head>
<body style="background-color: white;">
    <!-- Bill: {{ $bill }} <br>
    Billlist: {{ $bill_list }} -->

    <div class="container text-center" style="width: 794px;">
        <p>ສາທາລະນະລັດ ປະຊາທິປະໄຕ ປະຊາຊົນລາວ</p>
        <p>ສັນຕິພາ ເອກະລາດ ປະຊາທິປະໄຕ ເອກະພາບ ວັດທະນະຖາວອນ</p>
        

        <h2 class="mt-4">ໃບບິນຮັບເງິນ</h2>
        <div class=" d-flex justify-content-end ">
            <span>ໃບບິນເລກທີ່: {{ $bill[0]['bill_id'] }}</span>
        </div>

        <div class="text-start">
            @if($bill[0]['customer_name']=='')
                ລູກຄ້າ: ລູກຄ້າທົ່ວໄປ
            @else
                ລູກຄ້າ: {{ $bill[0]['customer_name'] }}, {{ $bill[0]['customer_tel']}}
            @endif
         
        </div>
       
        <table class="table table-bordered">
            <thead>
                <th width="80">ລ/ດ</th>
                <th class="text-start">ລາຍການ</th>
                <th width="120">ລາຄາ</th>
                <th width="90">ຈຳນວນ</th>
                <th width="160">ລວມ</th>
            </thead>
            <tbody>
                    @php($num=1)
                    @php($total=0)
                    @foreach($bill_list as $b)
                    <tr>
                        <td>{{ $num++ }}</td>
                        <td class="text-start">{{ $b['name'] }}</td>
                        <td class="text-end">{{ number_format($b['price'],0,',','.') }}</td>
                        <td class="text-end">{{ $b['qty'] }}</td>
                        <td class="text-end">{{ number_format($b['price']*$b['qty'],0,',','.') }}</td>
                        @php($total += $b['price']*$b['qty'])
                    </tr>
                    @endforeach
                <tr>
                    <td colspan='4' > ລວມທັງໝົດ </td>
                    <td class="text-end">  {{ number_format($total,0,',','.') }}</td>
                </tr>
            </tbody>
        </table>
        <div class=" d-flex justify-content-between p-4">
            <span >ພະນັກງານ</span>
            <span >ຜູ້ຈ່າຍເງິນ</span>
        </div>
    </div>


    <script src="{{ url('assets/vendor/libs/jquery/jquery.js') }}"></script>
    <script src="{{ url('assets/vendor/libs/popper/popper.js') }}"></script>
    <script src="{{ url('assets/vendor/js/bootstrap.js') }}"></script>
    <script src="{{ url('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js') }}"></script>
    <script src="{{ url('assets/vendor/js/menu.js') }}"></script>

    <script>
        window.print();
        setTimeout('window.close();', 3000);
    </script>
</body>
</html>