import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../config/common/values_manger.dart';
import '../config/theme/color_manger.dart';

import '../logic/cubit/events_cubit.dart';
import '../utils/app_string.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _fetchData(context) {
    BlocProvider.of<EventsCubit>(context).getEvents();
  }

  @override
  void initState() {
    _fetchData(context);
    super.initState();
  }

  String _formatDate(
      {required String format, required String data, bool addAmOrPm = false}) {
    if (addAmOrPm) {
      return DateFormat(format).add_jm().format(DateTime.parse(data));
    }

    return DateFormat(format).format(DateTime.parse(data));
  }

  String? _getDifrenceDate({String? firstData, String? endDate}) {
    if (firstData == null || endDate == null) {
      return null;
    }
    final DateTime first = DateTime.parse(firstData);
    final DateTime end = DateTime.parse(endDate);
    final String difrence = end.difference(first).inDays.toString();

    return difrence;
  }

  Widget _buildCardWidget({
    required String eventName,
    required String placeName,
    required String data,
    required String? endDate,
    required String intrest,
    required int spot,
    required int price,
  }) {
    return Container(
      color: ColorManager.white,
      padding: const EdgeInsets.all(AppPadding.p4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
        margin: const EdgeInsets.fromLTRB(
            AppMargin.m16, AppMargin.m8, AppMargin.m8, AppMargin.m8),
        elevation: AppSize.s8,
        child: Column(
          children: [
            _buildImageStack(spot: spot, intrest: intrest),
            _buildEventDetalis(
              eventName: eventName,
              placeName: placeName,
              data: data,
              endDate: endDate,
              price: price,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageStack({required int spot, required String intrest}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s14),
            child: Image.network(
              "https://th.bing.com/th/id/OIP.fs03VYi78kJokUkzUbxLbwHaEo?pid=ImgDet&rs=1",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: AppSize.s12,
          left: AppSize.s18,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s20),
              color: ColorManager.white.withOpacity(0.7),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add_task_outlined,
                  color: ColorManager.primary,
                ),
                const SizedBox(
                  width: AppSize.s4,
                ),
                Text(intrest),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: AppSize.s12,
          left: AppSize.s18,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s20),
              color: ColorManager.white.withOpacity(0.7),
            ),
            child: Text(
              '${(spot == 0) ? "Unlimited" : spot} ${AppString.spotsLeft}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEventDetalis({
    required String eventName,
    required String placeName,
    required String data,
    required String? endDate,
    required int price,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: AppSize.s1_5,
              ),
              SizedBox(
                width: AppSize.s200,
                child: Text(
                  eventName,
                  style: Theme.of(context).textTheme.headlineLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: AppSize.s1_5,
              ),
              SizedBox(
                width: AppSize.s200,
                child: Text(
                  placeName,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                height: AppSize.s1_5,
              ),
              Text(
                (endDate != null)?
                "$endDate ${AppString.daysLeft}":""
                ,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: AppSize.s8,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.darkGrey,
                    radius: AppSize.s12,
                  ),
                  CircleAvatar(
                    backgroundColor: ColorManager.darkGrey,
                    radius: AppSize.s12,
                  ),
                  CircleAvatar(
                    backgroundColor: ColorManager.darkGrey,
                    radius: AppSize.s12,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: ColorManager.primary,
                    size: AppSize.s20,
                  ),
                  Icon(
                    Icons.money,
                    color: ColorManager.primary,
                    size: AppSize.s20,
                  ),
                  Icon(
                    Icons.card_travel_rounded,
                    color: ColorManager.primary,
                    size: AppSize.s20,
                  ),
                ],
              ),
             const SizedBox(
                height: AppSize.s1_5,
              ),
              Text(
                (price == 0) ? "Free" :
                "AED $price",
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.schedule),
      ),
      body: RefreshIndicator(
        onRefresh: _fetchData(context),
        child: BlocBuilder<EventsCubit, EventsState>(
          builder: (context, state) {
            if (state is EventsErorr) {
              return Center(
                  child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: ColorManager.error,
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
                child: Text(
                  state.error,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ));
            } else if (state is EventsLoaded) {
              log("${state.data.length}");
              return SingleChildScrollView(
                  child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final _date =
                      _formatDate(format: "dd", data: state.data[index].date!);
      
                  final _day =
                      _formatDate(format: "EEE", data: state.data[index].date!);
      
                  return TimelineTile(
                    isFirst: (index == 0) ? true : false,
                    isLast: (index == state.data.length - 1) ? true : false,
                    indicatorStyle: IndicatorStyle(
                      padding: const EdgeInsets.only(left: AppPadding.p8),
                      indicatorXY: 0.3,
                      width: 50,
                      height: 70,
                      indicator: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // shape: BoxShape.rectangle,
                          color: Colors.redAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                _date,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s1_5,
                            ),
                            Center(
                              child: Text(
                                _day,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    endChild: _buildCardWidget(
                        eventName: state.data[index].title!,
                        placeName: state.data[index].placeName!,
                        data: _formatDate(
                            format: "EEEEEE, dd MMM yyyy . hh:mm",
                            data: state.data[index].date!,
                            addAmOrPm: true),
                        endDate: _getDifrenceDate(
                                firstData: state.data[index].date,
                                endDate: state.data[index].finishDate) 
                            ,
                        spot: state.data[index].spots!,
                        intrest: state.data[index].tag!.title!,
                        price: state.data[index].price!),
                  );
                },
              ));
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
