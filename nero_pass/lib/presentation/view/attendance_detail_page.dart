import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nero_pass/data/models/remote/history_model.dart';
import 'package:nero_pass/presentation/widget/history_widget.dart';

import '../../config/themes.dart';
import '../../utils/commons.dart';
import '../cubit/history/history_cubit.dart';

class AttendanceDetailPage extends StatefulWidget {
  final String event;
  const AttendanceDetailPage({super.key, required this.event});

  @override
  State<AttendanceDetailPage> createState() => _AttendanceDetailPageState();
}

class _AttendanceDetailPageState extends State<AttendanceDetailPage> {
  final TextEditingController _searchController = TextEditingController();
  late List<HistoryDatum> _filteredData = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HistoryCubit>(context).fetchHistory();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterHistory(String query, List<HistoryDatum> historyData) {
    setState(() {
      _filteredData = historyData
          .where((data) =>
              data.name.toLowerCase().contains(query.toLowerCase()) ||
              data.origin.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _refreshHistory() async {
    BlocProvider.of<HistoryCubit>(context).fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("${widget.event} Attendance", overflow: TextOverflow.ellipsis),
        foregroundColor: ColorPallete.neroLight,
        backgroundColor: ColorPallete.neroDark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            Expanded(child: _buildAttendanceList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      cursorColor: ColorPallete.neroDark,
      decoration: InputDecoration(
        hintText: 'Search by name or origin',
        prefixIcon: Icon(
          Icons.search,
          color: _searchController.text.isNotEmpty
              ? ColorPallete.neroDark
              : Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorPallete.neroDark,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onChanged: (query) {
        final currentState = context.read<HistoryCubit>().state;
        if (currentState is HistoryLoaded) {
          _filterHistory(query, currentState.history.data);
        }
      },
    );
  }

  Widget _buildAttendanceList() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return Center(
            child: showProgressIndicator(context),
          );
        } else if (state is HistoryLoaded) {
          final data = _searchController.text.isEmpty
              ? state.history.data
              : _filteredData;

          final groupedData = _groupDataByDate(data);

          return RefreshIndicator(
            onRefresh: _refreshHistory,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: groupedData.length,
              itemBuilder: (context, index) {
                final item = groupedData[index];
                if (item is String) {
                  return _buildDateHeader(item);
                } else if (item is HistoryDatum) {
                  return HistoryWidget(
                    data: item,
                    isRecentActivity: false,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          );
        } else if (state is HistoryError) {
          return Center(
            child: Text('Failed to fetch history: ${state.message}'),
          );
        } else {
          return const Center(
            child: Text('Unexpected state'),
          );
        }
      },
    );
  }

  List<dynamic> _groupDataByDate(List<HistoryDatum> data) {
    Map<String, List<HistoryDatum>> groupedData = {};

    for (var item in data) {
      final date = item.date;
      if (!groupedData.containsKey(date)) {
        groupedData[date] = [];
      }
      groupedData[date]!.add(item);
    }

    List<dynamic> result = [];
    final sortedDates = groupedData.keys.toList()
      ..sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a)));

    for (var date in sortedDates) {
      result.add(date);
      result.addAll(groupedData[date]!.reversed);
    }

    return result;
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        DateFormat('dd MMM yyyy').format(DateTime.parse(date)),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
