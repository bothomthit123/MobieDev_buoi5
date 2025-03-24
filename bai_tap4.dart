import 'package:flutter/material.dart';

void main() {
  runApp(BaiTap4());
}

class BaiTap4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bai Tap 4 của Như Quỳnh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ Flutter của Như Quỳnh'),
      ),
      body: Container(
        color: Color(0xFFE9F2FF), // Màu nền cho toàn bộ trang
        child: Center(
          child: AspectRatio(
            aspectRatio: 9 / 16, // Tỷ lệ màn hình phổ biến cho điện thoại
            child: Image.network(
              'https://blog.solguruz.com/wp-content/uploads/2023/11/Flutter-for-Hybrid-Apps-Why-Flutter-is-the-Best-Platform-to-Make-Hybrid-Apps.png',
              fit: BoxFit.contain, // Đảm bảo ảnh nằm gọn mà không bị tràn viền
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Danh sách tài khoản mẫu
  final Map<String, String> _userDatabase = {
    "admin": "1234",
    "user1": "password1",
    "user2": "password2",
  };

  // Xử lý đăng nhập
  void _handleLogin(BuildContext context) {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (_userDatabase.containsKey(username) && _userDatabase[username] == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sai tài khoản hoặc mật khẩu!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Đăng Nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAaEAAAB5CAMAAACnbG4GAAAAt1BMVEX///91dXVfyfhwcHAxufZax/gFWp1ubm4EWZx4eHiFhYWlpaX7+/usrKzX19fy8vJoaGh+fn7Ozs719fW/v7/f39+Pj4+zs7PX8P1Rxfjj9f7n5+fR0dGqqqqWlpba2trExMTJ6/2enp7y+/++5/x40foMVJpHwPcAT5i35fyE1PpqzflgYGDQ7v0jj82vw9mdttHl7vVMgbOPxemZss+zx9whhcUMRpANQIwVer4xbqg9eK5ThrXPicpFAAALK0lEQVR4nO2de2OiuBrGi+kURRS5CK0oOHa37V6me3p2t7vn7Pn+n+tISEIgFyLERqd5/puaBPTn+/L45jI3N8O1+eXLpKMvjB5+GHEFq1Ha/MgAYgk9/GT6Nj+veIBYQjaCjImT4lhENsWZEzeCuoRsijMnQQS1CdkIMidRBLUI2QgyJzEgmpCNIGMSpjiakE1x5iSJoIaQTXHmJIsgQujhq+nb/LySRhAmZCPInHoATaxJMCx5ikOErEkwp74IgoRsijOn3giaWJNgVP0RNLERZFL9EVQRss8gY1ICZE2COSmkuGME2RRnTGoRZE2CMSlFkDUJ5mRNwoXLmoQLl5pJsICMyZqEC9fHm4R8N1dTgjr4e/SHTONdXI3UTILWCFo6QElugTr4c7f+Q6jzNq5EJkzCcuYoCTSEQP0XT+t9XIWMmARLSF1mTIIlpCxDlQRLSFUGTAKUYULlrtZ8LWwSzesmCx3XGy5jlQRCyJVrlaIOegntkVVcbYVNdrV3BI6O6w2WSoqbnKWSgAm526VUW/wl10sowt8PMaEFut5Mx/WGSiWCJuepJGBCK1+xw6ckpBRBZ5pusIQUdK8SQWcwCVCWUL/UUty5qtmWUK/MmQQoS6hPBk0ClCXUIzWTcMYJO0tILqMmAcoSkuoC1iRYQjLdqxRLJ+ed8v7OCPl+XMlXfTeol6CPaZMAdSmElsIm6oTybTIvvPCo9JBF61jtFvJtBjul832nfGvcJEBpIOQvo1ri+rS/bTfx0T+3O0QIZLjFUXnVJMBNCkyIahGxn74fFR5wQd24qrSGaRaI72SLRggWnlN3qrq0mpo3CVAaCMXpqi5/H4SdghBVyNEUQvwrKpmjsY6fD1VGh4tWolW3CVVp/zXvXiBxmoZ4SLAqmC9NMKtHcOArcQZaveiWF2ASoLQQQl/cubBT4OFQQYOsHLFcSGjrSpqsOoSitIsHXW+26ERbENavhNUIedG5CNVQJYLObRKgvgdC8Q7wAVVX9NpPOJpQ6XS7Ne02kwswCVDfAaE8lTUFTtK6k4ZQyU4vk2YXtPT3+gkF7QxXz8e2/rKn74QQCjw28HCre5UIOr9JgLp6Qjn9QbtOWhSHokhntG8AVBQ1hA5NCwIVNVJb1fNBi+fNEFLxckwTvpdLqSG8pAxi/yaOg3VUUIxAY+kIoYi8uEoP88MhPVp1ROhiTAKUGUI35bpWRr7m60bwZ0yM/kG+67O8aVGSu12QUANp1HoP+bwh5JFfRoQQviMvwa+V8/otDTUJj/cK2ih+zI0MEcIaW1MgkeCAHfMOohCHESBLuTAhpFlGu3EYmUMn7Da/dMTt9034PkW6FELD6nI+YdB2bEjrBhHOcy1CwGHLIENNwoZz/jlz3PaQ1EgIqXa4KEIZznEtv9YoxzwAXu5HEwIpWxYaWkk49lPQEHOBCYHdQqwdlYMuiVADYCfovCU0ULS0YogTQQNNwuZBBdAgc0HWnMo2D62oFHJJhBL0EiiEdewMN0E3RxECEdv854f+FMcxCeeLIMV12+AyCZHfqitxVT3A78+rDXpDCBw4j97Nz/3nXXFSnMIzaPC2lWsmVKKnEHnI8IRvF9RXaAjNuPbxsQ8Rx40pARpcIrpmQqQqIA6h47MKY6wfVYQQEMyVPErN9seaBKhrJoTvjmPJGsXo0uh+CSGX8xSCkkXRB5sEqCsmRKJDuivdx/3rX3wNIWEPSRR9sEmAumIvt8cviOsRsBkC6cJcSAhJnl0iu8CLBDWTMKbISn4PZTKVTYfLIUReOOxkSvElYFrDhCQ3K0p0Xz7cJEBdcU2BGAX5SRAObgUTASbk8qpERLxEN9gkjJymuN66XFyQD19JtZlTI8SJIhMmAep6CQWC1SNCQrC+rUiIiSLeD86vt8/nTnE310woxzb6LIQ6doEXCd9ub/sRjV9sYgmJ9EjV6Hgm4evtrQKi8VPl3wEhagJdet4AvLY6oWOieyApjv2gv93Wepa5OR1rGa6fECj2iZLqxcbqhEgUfZmwEYQByaNIx1qG6yWEvZyowCa4kxMIoSjimoTnWwVEWlYDXS8hHxMquN1Ed3IKIWi6RSahF5GmFanXS4jMK5x0FOFphKpE9yAyCX2INK2n+xhCZXgGQnj6NOxuhJDpREI3mx/FJkGKSNuCx48hhEFoJRThX6yieQSeTiXEUTeC+Ii0LXjUSUhcLiarBXQSivHsw/yEPZHjCfEAsYj0LRnWSEi8b5K00DuDhycSTklzowmxKY6DSOe2FR37WHGRORTNda7JsjathISR2VZrHdBYQvwI6iLSueheByH8F+FUGqlC6yW0dnBv2abi9WxHTW+NJCSKoBYivbsidBDq+y7nzRyNVkJk/gFITtj0DwCEB7LWZBwhcQTRiPTuitBBaImTmMdNc9Q0gZiQ2I9hQg77tGl2mIg/b7hwGKxStF1iFCE5IIzoTOdtjyEU4/1a/NXT5CPmEGom4YUXJN1L5iWf7O6asS/WIj7fba+XG0JIluIIorOdtz3qxItmlSAniLIGEAtijQkVwusnkhxKoheEfER7cmW0ZGsEob4Igogm2nfmaSGUkA+q6CLyaUDsp0zWxosX7OAlPdxlcc1ahRnnI/eTZv8XGn84ocfnfkC3t7+fOmyvtBDKyaI74LWfFvHBocXGQbN9RHQDa3Hn1jQemDPHYDRbVV1cAB8RQ/cKiF5f/jh53B7pOdenedQAkOVkqDxBJxbMRHU54tSPbNfoWR51ahMkh7oHxCDPiHkrqYfcal42YRavF6vmrkgSHfMcuu8HdHf38tvpA0ulh1BOxYkbzpNlmZfL/dwjdRnUiSVUkl3hYHZI9vtkkbodQhR+b7c/NpmHq2achH7MOeliX5b5stwvCmrPPmiqDqO8XF8UvU/v7u6m/xowskSazsZK6L311WczcxzQhEewEBHyqRU7xw7V+rZufS9vDQ1gM2qczOm8Xl+bBkeVhcb9HpJH0WsFSHsU6Tq97EAbgrbAbH2zExG6WbIduhXYjBm7Nc5efOm6sUftjRhZU5Aher1DmmpFpIuQePUaCI82SkyI2m8vIhQzY7fHiWYyRqD1O3psXU6c6N6fMKG7F52JTtsJgL4AUW3AJYTY8GNmMeLuAS+dcY6OUfj9mLWbjq5ti6LodTq9axD9OXB0jpbovZ1MCHTnGuKMOeGtenYnsKq5qwPF5RXQ/F2nIzvP1D1cqUvajzzOxatKQveEuQBt4B8+P8SPovenKY3oSV8UlV6tUJnQAvVgF3Csi7B16BEA4RxlmAx14n8uS4+OAYY9HKA1tMs6jiiddU9cAmHBVBqCFL3fveL7ZcWLoteXihAdRdqeRX6ApNwjRh14Ff91UsxW6P+aXIWHfd7tJPgexNEhdFE/UOx5TfKkAKiFS9WqKS2TAg9SLXL0Dt1zS6EC+Z2oiEX0/nRUG5Feu6BR1aFHWXUGw3590ofgB2VSdcu2XPT10FvYJCmFoIM8gk0W+2U+hkGPuonu/a+npy6jqVa7YHWi2lH0/vLyRBA1QaTTLlidKjqK3v/ChOgsd0Sk0S5YnaxNC9BLxaiFp46iS30WfQrdtwCxeCCii7ULn0IbmOje/65yHA+PtQvGdV9HED98rF24BG2e//MioWPtgnm9/VeY36xduAy9/dOLaDp9sogM6u3fPYiqMoO1CybVk+imUDbRmdTb/8SIplg2ikxK/CyaNrJRZFKiZ9GUljXdJsVFNO3IJjqTYu1Cl49NdIbVtQscQEdE2hcMW6mrZRe4fGwUGRb1LBIBsnbBrDAiMR9rFwzr7Z9pDx+LaLz+D4UsStwDLmaQAAAAAElFTkSuQmCC', // Logo Flutter
              height: 100,
            ),
            SizedBox(height: 30),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Tài khoản',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Hiển thị snackbar hoặc chuyển sang trang quên mật khẩu (nếu cần)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Chức năng quên mật khẩu chưa được hỗ trợ.')),
                  );
                },
                child: Text('Forgot password?'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleLogin(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Chi Tiết'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Chi tiết về Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 30),
            Image.network(
              'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAaEAAAB5CAMAAACnbG4GAAAAt1BMVEX///91dXVfyfhwcHAxufZax/gFWp1ubm4EWZx4eHiFhYWlpaX7+/usrKzX19fy8vJoaGh+fn7Ozs719fW/v7/f39+Pj4+zs7PX8P1Rxfjj9f7n5+fR0dGqqqqWlpba2trExMTJ6/2enp7y+/++5/x40foMVJpHwPcAT5i35fyE1PpqzflgYGDQ7v0jj82vw9mdttHl7vVMgbOPxemZss+zx9whhcUMRpANQIwVer4xbqg9eK5ThrXPicpFAAALK0lEQVR4nO2de2OiuBrGi+kURRS5CK0oOHa37V6me3p2t7vn7Pn+n+tISEIgFyLERqd5/puaBPTn+/L45jI3N8O1+eXLpKMvjB5+GHEFq1Ha/MgAYgk9/GT6Nj+veIBYQjaCjImT4lhENsWZEzeCuoRsijMnQQS1CdkIMidRBLUI2QgyJzEgmpCNIGMSpjiakE1x5iSJoIaQTXHmJIsgQujhq+nb/LySRhAmZCPInHoATaxJMCx5ikOErEkwp74IgoRsijOn3giaWJNgVP0RNLERZFL9EVQRss8gY1ICZE2COSmkuGME2RRnTGoRZE2CMSlFkDUJ5mRNwoXLmoQLl5pJsICMyZqEC9fHm4R8N1dTgjr4e/SHTONdXI3UTILWCFo6QElugTr4c7f+Q6jzNq5EJkzCcuYoCTSEQP0XT+t9XIWMmARLSF1mTIIlpCxDlQRLSFUGTAKUYULlrtZ8LWwSzesmCx3XGy5jlQRCyJVrlaIOegntkVVcbYVNdrV3BI6O6w2WSoqbnKWSgAm526VUW/wl10sowt8PMaEFut5Mx/WGSiWCJuepJGBCK1+xw6ckpBRBZ5pusIQUdK8SQWcwCVCWUL/UUty5qtmWUK/MmQQoS6hPBk0ClCXUIzWTcMYJO0tILqMmAcoSkuoC1iRYQjLdqxRLJ+ed8v7OCPl+XMlXfTeol6CPaZMAdSmElsIm6oTybTIvvPCo9JBF61jtFvJtBjul832nfGvcJEBpIOQvo1ri+rS/bTfx0T+3O0QIZLjFUXnVJMBNCkyIahGxn74fFR5wQd24qrSGaRaI72SLRggWnlN3qrq0mpo3CVAaCMXpqi5/H4SdghBVyNEUQvwrKpmjsY6fD1VGh4tWolW3CVVp/zXvXiBxmoZ4SLAqmC9NMKtHcOArcQZaveiWF2ASoLQQQl/cubBT4OFQQYOsHLFcSGjrSpqsOoSitIsHXW+26ERbENavhNUIedG5CNVQJYLObRKgvgdC8Q7wAVVX9NpPOJpQ6XS7Ne02kwswCVDfAaE8lTUFTtK6k4ZQyU4vk2YXtPT3+gkF7QxXz8e2/rKn74QQCjw28HCre5UIOr9JgLp6Qjn9QbtOWhSHokhntG8AVBQ1hA5NCwIVNVJb1fNBi+fNEFLxckwTvpdLqSG8pAxi/yaOg3VUUIxAY+kIoYi8uEoP88MhPVp1ROhiTAKUGUI35bpWRr7m60bwZ0yM/kG+67O8aVGSu12QUANp1HoP+bwh5JFfRoQQviMvwa+V8/otDTUJj/cK2ih+zI0MEcIaW1MgkeCAHfMOohCHESBLuTAhpFlGu3EYmUMn7Da/dMTt9034PkW6FELD6nI+YdB2bEjrBhHOcy1CwGHLIENNwoZz/jlz3PaQ1EgIqXa4KEIZznEtv9YoxzwAXu5HEwIpWxYaWkk49lPQEHOBCYHdQqwdlYMuiVADYCfovCU0ULS0YogTQQNNwuZBBdAgc0HWnMo2D62oFHJJhBL0EiiEdewMN0E3RxECEdv854f+FMcxCeeLIMV12+AyCZHfqitxVT3A78+rDXpDCBw4j97Nz/3nXXFSnMIzaPC2lWsmVKKnEHnI8IRvF9RXaAjNuPbxsQ8Rx40pARpcIrpmQqQqIA6h47MKY6wfVYQQEMyVPErN9seaBKhrJoTvjmPJGsXo0uh+CSGX8xSCkkXRB5sEqCsmRKJDuivdx/3rX3wNIWEPSRR9sEmAumIvt8cviOsRsBkC6cJcSAhJnl0iu8CLBDWTMKbISn4PZTKVTYfLIUReOOxkSvElYFrDhCQ3K0p0Xz7cJEBdcU2BGAX5SRAObgUTASbk8qpERLxEN9gkjJymuN66XFyQD19JtZlTI8SJIhMmAep6CQWC1SNCQrC+rUiIiSLeD86vt8/nTnE310woxzb6LIQ6doEXCd9ub/sRjV9sYgmJ9EjV6Hgm4evtrQKi8VPl3wEhagJdet4AvLY6oWOieyApjv2gv93Wepa5OR1rGa6fECj2iZLqxcbqhEgUfZmwEYQByaNIx1qG6yWEvZyowCa4kxMIoSjimoTnWwVEWlYDXS8hHxMquN1Ed3IKIWi6RSahF5GmFanXS4jMK5x0FOFphKpE9yAyCX2INK2n+xhCZXgGQnj6NOxuhJDpREI3mx/FJkGKSNuCx48hhEFoJRThX6yieQSeTiXEUTeC+Ii0LXjUSUhcLiarBXQSivHsw/yEPZHjCfEAsYj0LRnWSEi8b5K00DuDhycSTklzowmxKY6DSOe2FR37WHGRORTNda7JsjathISR2VZrHdBYQvwI6iLSueheByH8F+FUGqlC6yW0dnBv2abi9WxHTW+NJCSKoBYivbsidBDq+y7nzRyNVkJk/gFITtj0DwCEB7LWZBwhcQTRiPTuitBBaImTmMdNc9Q0gZiQ2I9hQg77tGl2mIg/b7hwGKxStF1iFCE5IIzoTOdtjyEU4/1a/NXT5CPmEGom4YUXJN1L5iWf7O6asS/WIj7fba+XG0JIluIIorOdtz3qxItmlSAniLIGEAtijQkVwusnkhxKoheEfER7cmW0ZGsEob4Igogm2nfmaSGUkA+q6CLyaUDsp0zWxosX7OAlPdxlcc1ahRnnI/eTZv8XGn84ocfnfkC3t7+fOmyvtBDKyaI74LWfFvHBocXGQbN9RHQDa3Hn1jQemDPHYDRbVV1cAB8RQ/cKiF5f/jh53B7pOdenedQAkOVkqDxBJxbMRHU54tSPbNfoWR51ahMkh7oHxCDPiHkrqYfcal42YRavF6vmrkgSHfMcuu8HdHf38tvpA0ulh1BOxYkbzpNlmZfL/dwjdRnUiSVUkl3hYHZI9vtkkbodQhR+b7c/NpmHq2achH7MOeliX5b5stwvCmrPPmiqDqO8XF8UvU/v7u6m/xowskSazsZK6L311WczcxzQhEewEBHyqRU7xw7V+rZufS9vDQ1gM2qczOm8Xl+bBkeVhcb9HpJH0WsFSHsU6Tq97EAbgrbAbH2zExG6WbIduhXYjBm7Nc5efOm6sUftjRhZU5Aher1DmmpFpIuQePUaCI82SkyI2m8vIhQzY7fHiWYyRqD1O3psXU6c6N6fMKG7F52JTtsJgL4AUW3AJYTY8GNmMeLuAS+dcY6OUfj9mLWbjq5ti6LodTq9axD9OXB0jpbovZ1MCHTnGuKMOeGtenYnsKq5qwPF5RXQ/F2nIzvP1D1cqUvajzzOxatKQveEuQBt4B8+P8SPovenKY3oSV8UlV6tUJnQAvVgF3Csi7B16BEA4RxlmAx14n8uS4+OAYY9HKA1tMs6jiiddU9cAmHBVBqCFL3fveL7ZcWLoteXihAdRdqeRX6ApNwjRh14Ff91UsxW6P+aXIWHfd7tJPgexNEhdFE/UOx5TfKkAKiFS9WqKS2TAg9SLXL0Dt1zS6EC+Z2oiEX0/nRUG5Feu6BR1aFHWXUGw3590ofgB2VSdcu2XPT10FvYJCmFoIM8gk0W+2U+hkGPuonu/a+npy6jqVa7YHWi2lH0/vLyRBA1QaTTLlidKjqK3v/ChOgsd0Sk0S5YnaxNC9BLxaiFp46iS30WfQrdtwCxeCCii7ULn0IbmOje/65yHA+PtQvGdV9HED98rF24BG2e//MioWPtgnm9/VeY36xduAy9/dOLaDp9sogM6u3fPYiqMoO1CybVk+imUDbRmdTb/8SIplg2ikxK/CyaNrJRZFKiZ9GUljXdJsVFNO3IJjqTYu1Cl49NdIbVtQscQEdE2hcMW6mrZRe4fGwUGRb1LBIBsnbBrDAiMR9rFwzr7Z9pDx+LaLz+D4UsStwDLmaQAAAAAElFTkSuQmCC', // Logo Flutter
              height: 100,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Bạn đã bấm nút!')),
                );
              },
              child: Text('Bấm vào đây'),
            ),
          ],
        ),
      ),
    );
  }
}
