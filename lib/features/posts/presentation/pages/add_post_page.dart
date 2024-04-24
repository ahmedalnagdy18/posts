import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nagdy_app/features/posts/presentation/widgets/button_widget.dart';
import 'package:nagdy_app/features/posts/presentation/widgets/textfield_widget.dart';

class AddpostPage extends StatefulWidget {
  const AddpostPage({super.key});

  @override
  State<AddpostPage> createState() => _AddpostPageState();
}

class _AddpostPageState extends State<AddpostPage> {
  final TextEditingController postUserId = TextEditingController();
  final TextEditingController postTitle = TextEditingController();

  final TextEditingController postDescribtion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! UserId
                const Text('User ',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 6),
                TextfieldWidget(controller: postUserId, inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]')), // Allow only numbers
                ]),
                const SizedBox(height: 20),
                //! title
                const Text('Title :',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 6),
                TextfieldWidget(controller: postTitle),
                const SizedBox(height: 20),
                //! Description
                const Text('Description :',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 6),
                TextfieldWidget(controller: postDescribtion, maxLines: 4),
                const SizedBox(height: 20),
                Divider(thickness: 1, color: Colors.grey.shade400),
                const SizedBox(
                  height: 18,
                ),
                //! Button
                ButtonWidget(
                  onPressed: () {
                    // final updatedPost = DomainModel(
                    //   title: title.text,
                    //   body: descriptionn.text,
                    //   id: widget.userId,
                    // );

                    // BlocProvider.of<PostsCubit>(context).update(updatedPost);

                    // Navigator.of(context).pop();
                  },
                  text: 'Add Post',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
