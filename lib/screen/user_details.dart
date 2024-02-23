import 'package:flutter/material.dart';
import 'package:flutter_activity2/Models/user_model.dart';

class UserDetails extends StatelessWidget {
  final UserModel user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white) // Setting icon color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatarWithName(user.name),
              const SizedBox(height: 20),
              _buildRow(title: 'Username', value: user.username, fontSize: 15),
              const SizedBox(height: 20),
              _buildDivider(),
              const SizedBox(height: 20),
              _buildRow(title: 'Email', value: user.email, fontSize: 15),
              const SizedBox(height: 20),
              _buildDivider(),
              const SizedBox(height: 20),
              _buildAddressSubset(user.address),
              const SizedBox(height: 20),
              _buildDivider(),
              const SizedBox(height: 20),
              _buildRow(title: 'Phone', value: user.phone, fontSize: 15),
              const SizedBox(height: 20),
              _buildDivider(),
              const SizedBox(height: 20),
              _buildRow(title: 'Website', value: user.website, fontSize: 15),
              const SizedBox(height: 20),
              _buildDivider(),
              const SizedBox(height: 20),
              _buildCompanySubset(user.company),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Avatar Builder
  Widget _buildAvatarWithName(String? name) {
    return Center(
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.indigo,
            radius: 60,
            child: Icon(
              Icons.person_outline_outlined,
              color: Colors.white,
              size: 65,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name ?? '',
            // style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Row Builders
  Widget _buildRow(
      {required String title, String? value, double fontSize = 16}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        Text(
          value ?? '',
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }

  Widget _buildAddressSubset(Address? address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        if (address != null) ...[
          _buildSubSetRow(title: 'Street', value: address.street),
          _buildSubSetRow(title: 'Suite', value: address.suite),
          _buildSubSetRow(title: 'City', value: address.city),
          _buildSubSetRow(title: 'Zipcode', value: address.zipcode),
          const SizedBox(height: 10),
          _buildGeoSubset(address.geo),
        ],
      ],
    );
  }

  Widget _buildGeoSubset(Geo? geo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Geo',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 3),
        if (geo != null) ...[
          _buildSubSetRow(title: 'Latitude', value: geo.lat),
          _buildSubSetRow(title: 'Longitude', value: geo.lng),
        ],
      ],
    );
  }

  Widget _buildCompanySubset(Company? company) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Company',
          // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        if (company != null) ...[
          _buildSubSetRow(title: 'Name', value: company.name),
          _buildSubSetRow(title: 'Catch Phrase', value: company.catchPhrase),
          _buildSubSetRow(title: 'Buzz Phrase', value: company.bs),
        ],
      ],
    );
  }

  Widget _buildSubSetRow({required String title, String? value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          //  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            value ?? '',
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}

Widget _buildDivider() {
  return Container(
    height: 1,
    color: Colors.indigo[400],
  );
}
