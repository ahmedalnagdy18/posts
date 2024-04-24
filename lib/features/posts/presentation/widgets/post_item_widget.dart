import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagdy_app/features/posts/presentation/cubits/cubit/posts_cubit.dart';

class PostItemWidget extends StatefulWidget {
  const PostItemWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.userId,
      required this.removeId});
  final String title;
  final String description;
  final String userId;
  final int removeId;

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Text('User ${widget.userId}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
              const Spacer(),
              PopupMenuButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
                elevation: 10,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('edit'),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                      onTap: () {
                        BlocProvider.of<PostsCubit>(context)
                            .delete(widget.removeId);
                        setState(() {});
                      },
                      child: const Text('delete')),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text('Title :',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(widget.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text('Description :',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(widget.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    )),
              ),
              const SizedBox(height: 12),
              Divider(thickness: 1, color: Colors.grey.shade400),
            ],
          ),
        ],
      ),
    );
  }
}
