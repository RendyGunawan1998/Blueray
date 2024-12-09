import '../../core.dart';

class MapScreen extends StatefulWidget {
  final String status;
  MapScreen({super.key, required this.status});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final ProfileController controller =
      Get.put(ProfileController(), permanent: true);
  late GoogleMapController mapController;
  LatLng _pinPosition = LatLng(-6.200000, 106.816666);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pinPosition,
          zoom: 14.0,
        ),
        onMapCreated: (controller) => mapController = controller,
        markers: {
          Marker(
            markerId: MarkerId('pin'),
            position: _pinPosition,
            draggable: true,
            onDragEnd: (newPosition) {
              setState(() {
                _pinPosition = newPosition;
              });
            },
          ),
        },
        onTap: (latLng) {
          setState(() {
            _pinPosition = latLng;
            controller.lat = _pinPosition.latitude;
            controller.lng = _pinPosition.longitude;
          });
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: buttonBlue('Set Location', () async {
            await controller.getAddressFromLatLng(
                _pinPosition.latitude, _pinPosition.longitude, widget.status);
          }),
        ),
      ),
    );
  }
}
