import 'package:flutter/material.dart';
import 'package:ppkd_b7/tugas/tugas_12/database/db_helper.dart';
import 'package:ppkd_b7/tugas/tugas_12/models/data_user_model.dart';

class DataUserTugas12 extends StatefulWidget {
  const DataUserTugas12({super.key});

  @override
  State<DataUserTugas12> createState() => _DataUserTugas12State();
}

class _DataUserTugas12State extends State<DataUserTugas12> {
  void _refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pengguna'),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showBottomSheet(context, null);
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<UserModelSQL>>(
              future: DBHelper().getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('Tidak ada data pengguna.'),
                  );
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 12),
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            user.nama.isNotEmpty ? user.nama[0].toUpperCase() : 'U',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          user.nama,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 4),
                            Text('Email: ${user.email}'),
                            Text('No HP: ${user.nomorHp}'),
                            Text('Kota: ${user.asalKota}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _showBottomSheet(context, user);
                              },
                              icon: Icon(Icons.edit, color: Colors.orange),
                            ),
                            IconButton(
                              onPressed: () {
                                _showDeleteDialog(context, user);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UserModelSQL? user) {
    final namaController = TextEditingController(text: user?.nama ?? "");
    final emailController = TextEditingController(text: user?.email ?? "");
    final noHpController = TextEditingController(text: user?.nomorHp ?? "");
    final passwordController = TextEditingController(text: user?.password ?? "");
    final asalKotaController = TextEditingController(text: user?.asalKota ?? "");

    final _formKey = GlobalKey<FormState>();
    final isEditing = user != null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEditing ? 'Edit Pengguna' : 'Tambah Pengguna',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    if (value.trim().length < 3) {
                      return 'Nama minimal 3 karakter';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                TextFormField(
                  controller: noHpController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor HP',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nomor HP tidak boleh kosong';
                    }
                    if (value.length < 10) {
                      return 'Nomor HP minimal 10 digit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                
                TextFormField(
                  controller: asalKotaController,
                  decoration: InputDecoration(
                    labelText: 'Asal Kota',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Asal kota tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEditing ? Colors.orange : Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  icon: Icon(isEditing ? Icons.edit : Icons.add, color: Colors.white),
                  label: Text(
                    isEditing ? 'Update' : 'Tambah',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final userData = UserModelSQL(
                        id: user?.id,
                        nama: namaController.text.trim(),
                        email: emailController.text.trim(),
                        nomorHp: noHpController.text.trim(),
                        password: passwordController.text,
                        asalKota: asalKotaController.text.trim(),
                      );

                      bool success;
                      if (isEditing) {
                        success = await DBHelper().updateUser(userData);
                      } else {
                        success = await DBHelper().registerUser(userData);
                      }

                      if (success && context.mounted) {
                        Navigator.pop(context);
                        _refreshList();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isEditing ? 'Data berhasil diperbarui' : 'Data berhasil ditambahkan',
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terjadi kesalahan saat menyimpan data'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, UserModelSQL user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hapus Pengguna'),
        content: Text('Apakah Anda yakin ingin menghapus ${user.nama}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await DBHelper().deleteUser(user.id!);
              Navigator.pop(context);
              _refreshList();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Data berhasil dihapus'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}