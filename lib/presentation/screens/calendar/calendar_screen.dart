import 'package:doctor_app/core/assets/colors/app_colors.dart';
import 'package:doctor_app/presentation/widgets/custom_filter_popup.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

enum ViewType { grid, list }

enum CalendarFilter { day, month, year, addTask, addAppointment }

class _CalendarScreenState extends State<CalendarScreen> {
  ViewType currentView = ViewType.list;
  CalendarFilter selectedFilter = CalendarFilter.day;
  String selectedTab = 'Appointments';

  final List<Map<String, dynamic>> appointmentsData = [
    {
      'time': '09:00 am',
      'patientName': 'Lisa Smith',
      'status': 'Confirmed',
      'statusColor': Colors.green,
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
      'consultationNotes': '',
      'day': 'Monday',
    },
    {
      'time': '09:00 am',
      'patientName': 'Lisa Smith',
      'status': 'Cancelled',
      'statusColor': Colors.red,
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
      'consultationNotes': '',
      'day': 'Monday',
    },
    {
      'time': '09:00 am',
      'patientName': 'John Doe',
      'status': 'Confirmed',
      'statusColor': Colors.green,
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'consultationNotes': '',
      'day': 'Monday',
    },
    {
      'time': '09:00 am',
      'patientName': 'John Doe',
      'status': 'Confirmed',
      'statusColor': Colors.green,
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'consultationNotes': '',
      'day': 'Monday',
    },
    {
      'time': '09:00 am',
      'patientName': 'John Doe',
      'status': 'Cancelled',
      'statusColor': Colors.red,
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'consultationNotes': '',
      'day': 'Monday',
    },
    {
      'time': '09:00 am',
      'patientName': 'John Doe',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'consultationNotes': '',
      'day': 'Tuesday',
    },
  ];

  final List<Map<String, dynamic>> tasksData = [
    {
      'time': '09:00 am',
      'taskName': 'Morning Exercise',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'day': 'Monday',
    },
    {
      'time': '09:00 am',
      'taskName': 'Team Meeting',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'day': 'Monday',
    },
    {
      'time': '09:00 am',
      'taskName': 'Review Budget Proposal',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'day': 'Monday',
    },
    {
      'time': '08:00 am',
      'taskName': 'Reply to Emails',
      'status': 'Completed',
      'statusColor': Colors.green,
      'day': 'Monday',
    },
    {
      'time': '10:00 am',
      'taskName': 'Prepare Presentation',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'day': 'Tuesday',
    },
  ];

  List<Map<String, dynamic>> get mondayAppointments =>
      appointmentsData.where((app) => app['day'] == 'Monday').toList();

  List<Map<String, dynamic>> get tuesdayAppointments =>
      appointmentsData.where((app) => app['day'] == 'Tuesday').toList();

  List<Map<String, dynamic>> get mondayTasks =>
      tasksData.where((task) => task['day'] == 'Monday').toList();

  List<Map<String, dynamic>> get tuesdayTasks =>
      tasksData.where((task) => task['day'] == 'Tuesday').toList();

  void _onFilterChanged(CalendarFilter filter) {
    setState(() {
      selectedFilter = filter;
    });

    if (filter == CalendarFilter.addTask) {
      print('Add Task pressed');
    } else if (filter == CalendarFilter.addAppointment) {
      print('Add Appointment pressed');
    }
  }

  void _onViewToggle(ViewType view) {
    setState(() {
      currentView = view;
    });
  }

  void _onTabChanged(String tab) {
    setState(() {
      selectedTab = tab;
    });
  }

  // Search Bar Widget
  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            icon: Icon(Icons.filter_alt, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => CustomFilterPopup(),
              );
            },
          ),
        ),
      ],
    );
  }

  // Filter Buttons Widget
  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFilterButton('Day', CalendarFilter.day),
        _buildFilterButton('Month', CalendarFilter.month),
        _buildFilterButton('Year', CalendarFilter.year),
        _buildActionButton('Add\nTask', CalendarFilter.addTask),
        _buildActionButton('Add\nAppointment', CalendarFilter.addAppointment),
      ],
    );
  }

  Widget _buildFilterButton(String text, CalendarFilter filter) {
    final isSelected = selectedFilter == filter;
    return GestureDetector(
      onTap: () => _onFilterChanged(filter),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.grey.shade200,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, CalendarFilter filter) {
    return GestureDetector(
      onTap: () => _onFilterChanged(filter),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Tab Bar Widget
  Widget _buildTabBar() {
    return Row(
      children: [
        _buildTab(
          'Appointments',
          selectedTab == 'Appointments',
          () => _onTabChanged('Appointments'),
        ),
        SizedBox(width: 24),
        _buildTab(
          'Tasks',
          selectedTab == 'Tasks',
          () => _onTabChanged('Tasks'),
        ),
      ],
    );
  }

  Widget _buildTab(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 2,
            width: text.length * 8.0,
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.grid_view),
          color:
              currentView == ViewType.grid
                  ? AppColors.primaryColor
                  : Colors.grey,
          onPressed: () => _onViewToggle(ViewType.grid),
        ),
        IconButton(
          icon: Icon(Icons.list),
          color:
              currentView == ViewType.list
                  ? AppColors.primaryColor
                  : Colors.grey,
          onPressed: () => _onViewToggle(ViewType.list),
        ),
      ],
    );
  }

  // Appointment Card Widget for List View
  Widget _buildAppointmentCard(Map<String, dynamic> appointment) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(appointment['imageUrl']),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment['patientName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      appointment['time'],
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.message_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.email_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: appointment['statusColor'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              appointment['status'],
              style: TextStyle(
                color: appointment['statusColor'],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildActionButtonCard(
                  'View Details',
                  Colors.grey.shade300,
                  Colors.black87,
                  () => _showAppointmentDetails(appointment),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildActionButtonCard(
                  'Reschedule',
                  appointment['status'] == 'Cancelled'
                      ? Colors.grey.shade400
                      : Colors.grey.shade400,
                  Colors.white,
                  appointment['status'] == 'Cancelled'
                      ? null
                      : () => _rescheduleAppointment(appointment),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildActionButtonCard(
                  'Cancel',
                  appointment['status'] == 'Cancelled'
                      ? Colors.grey.shade400
                      : Colors.grey.shade600,
                  Colors.white,
                  appointment['status'] == 'Cancelled'
                      ? null
                      : () => _cancelAppointment(appointment),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Consultation Notes:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Add notes for this appointment here...',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Task Card Widget for List View
  Widget _buildTaskCard(Map<String, dynamic> task) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task['taskName'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      task['time'],
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: task['statusColor'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  task['status'],
                  style: TextStyle(
                    color: task['statusColor'],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildActionButtonCard(
                  'Mark Completed',
                  task['status'] == 'Completed'
                      ? Colors.grey.shade400
                      : AppColors.primaryColor,
                  Colors.white,
                  task['status'] == 'Completed'
                      ? null
                      : () => _markTaskCompleted(task),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildActionButtonCard(
                  'Reschedule',
                  Colors.grey.shade400,
                  Colors.white,
                  () => _rescheduleTask(task),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildActionButtonCard(
                  'Cancel',
                  Colors.grey.shade600,
                  Colors.white,
                  () => _cancelTask(task),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtonCard(
    String text,
    Color backgroundColor,
    Color textColor,
    VoidCallback? onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  // Table Row Widget for Grid View - Appointments
  Widget _buildAppointmentTableRow(Map<String, dynamic> appointment) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              appointment['time'],
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              appointment['patientName'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: appointment['statusColor'],
                shape: BoxShape.circle,
              ),
              child: _getStatusIcon(appointment['status']),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
              onPressed: () => _showActionMenu(appointment),
              constraints: BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  // Table Row Widget for Grid View - Tasks
  Widget _buildTaskTableRow(Map<String, dynamic> task) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              task['taskName'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              task['time'],
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
              onPressed: () => _showTaskActionMenu(task),
              constraints: BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Icon(Icons.check, color: Colors.white, size: 16);
      case 'cancelled':
        return Icon(Icons.close, color: Colors.white, size: 16);
      case 'pending':
        return Icon(Icons.schedule, color: Colors.white, size: 16);
      case 'completed':
        return Icon(Icons.check, color: Colors.white, size: 16);
      default:
        return Icon(Icons.help, color: Colors.white, size: 16);
    }
  }

  Widget _buildContentList() {
    if (selectedTab == 'Appointments') {
      return _buildAppointmentsList();
    } else {
      return _buildTasksList();
    }
  }

  Widget _buildAppointmentsList() {
    if (currentView == ViewType.list) {
      return _buildAppointmentListView();
    } else {
      return _buildAppointmentGridView();
    }
  }

  Widget _buildTasksList() {
    if (currentView == ViewType.list) {
      return _buildTaskListView();
    } else {
      return _buildTaskGridView();
    }
  }

  // Appointments List View
  Widget _buildAppointmentListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Monday Section
        if (mondayAppointments.isNotEmpty) ...[
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.infoColor),
            ),
            child: Column(
              children: [
                _buildDayHeader('Monday'),
                ...mondayAppointments.map(
                  (appointment) => _buildAppointmentCard(appointment),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
        // Tuesday Section
        if (tuesdayAppointments.isNotEmpty) ...[
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.infoColor),
            ),
            child: Column(
              children: [
                _buildDayHeader('Tuesday'),
                ...tuesdayAppointments.map(
                  (appointment) => _buildAppointmentCard(appointment),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  // Tasks List View
  Widget _buildTaskListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Monday Section
        if (mondayTasks.isNotEmpty) ...[
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.infoColor),
            ),
            child: Column(
              children: [
                _buildDayHeader('Monday'),
                ...mondayTasks.map((task) => _buildTaskCard(task)),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
        // Tuesday Section
        if (tuesdayTasks.isNotEmpty) ...[
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.infoColor),
            ),
            child: Column(
              children: [
                _buildDayHeader('Tuesday'),
                ...tuesdayTasks.map((task) => _buildTaskCard(task)),
              ],
            ),
          ),
        ],
      ],
    );
  }

  // Appointments Grid View
  Widget _buildAppointmentGridView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Monday Section
        if (mondayAppointments.isNotEmpty) ...[
          _buildDayHeader('Monday'),
          _buildAppointmentTableHeader(),
          ...mondayAppointments.map(
            (appointment) => _buildAppointmentTableRow(appointment),
          ),
          SizedBox(height: 24),
        ],
        // Tuesday Section
        if (tuesdayAppointments.isNotEmpty) ...[
          _buildDayHeader('Tuesday'),
          _buildAppointmentTableHeader(),
          ...tuesdayAppointments.map(
            (appointment) => _buildAppointmentTableRow(appointment),
          ),
        ],
      ],
    );
  }

  // Tasks Grid View
  Widget _buildTaskGridView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Monday Section
        if (mondayTasks.isNotEmpty) ...[
          _buildDayHeader('Monday'),
          _buildTaskTableHeader(),
          ...mondayTasks.map((task) => _buildTaskTableRow(task)),
          SizedBox(height: 24),
        ],
        // Tuesday Section
        if (tuesdayTasks.isNotEmpty) ...[
          _buildDayHeader('Tuesday'),
          _buildTaskTableHeader(),
          ...tuesdayTasks.map((task) => _buildTaskTableRow(task)),
        ],
      ],
    );
  }

  Widget _buildDayHeader(String day) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        day,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildAppointmentTableHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Patient',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTableHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text('Tasks', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 2,
            child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Task action methods
  void _markTaskCompleted(Map<String, dynamic> task) {
    setState(() {
      task['status'] = 'Completed';
      task['statusColor'] = Colors.green;
    });
    print('Task marked as completed: ${task['taskName']}');
  }

  void _rescheduleTask(Map<String, dynamic> task) {
    print('Reschedule task: ${task['taskName']}');
  }

  void _cancelTask(Map<String, dynamic> task) {
    print('Cancel task: ${task['taskName']}');
  }

  // Appointment action methods
  void _showAppointmentDetails(Map<String, dynamic> appointment) {
    print('View details for ${appointment['patientName']}');
  }

  void _rescheduleAppointment(Map<String, dynamic> appointment) {
    print('Reschedule appointment for ${appointment['patientName']}');
  }

  void _cancelAppointment(Map<String, dynamic> appointment) {
    print('Cancel appointment for ${appointment['patientName']}');
  }

  void _showActionMenu(Map<String, dynamic> appointment) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.visibility),
                title: Text('View Details'),
                onTap: () {
                  Navigator.pop(context);
                  _showAppointmentDetails(appointment);
                },
              ),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Reschedule'),
                onTap: () {
                  Navigator.pop(context);
                  _rescheduleAppointment(appointment);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Cancel'),
                onTap: () {
                  Navigator.pop(context);
                  _cancelAppointment(appointment);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTaskActionMenu(Map<String, dynamic> task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.check_circle),
                title: Text('Mark Completed'),
                onTap: () {
                  Navigator.pop(context);
                  _markTaskCompleted(task);
                },
              ),
              ListTile(
                leading: Icon(Icons.schedule),
                title: Text('Reschedule'),
                onTap: () {
                  Navigator.pop(context);
                  _rescheduleTask(task);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('Cancel'),
                onTap: () {
                  Navigator.pop(context);
                  _cancelTask(task);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Calendar',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(context),
            SizedBox(height: 16),

            // Filter Buttons
            _buildFilterButtons(),
            SizedBox(height: 16),

            // Tab Bar and View Toggle
            Row(
              children: [
                Expanded(child: _buildTabBar()),
                _buildToggleButtons(),
              ],
            ),
            SizedBox(height: 16),

            // Content
            Expanded(child: SingleChildScrollView(child: _buildContentList())),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
