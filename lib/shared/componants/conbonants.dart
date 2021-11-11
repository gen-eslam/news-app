

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:todo_app/web_view/web_veiw.dart';

Widget buildArticalItem(article, context) => InkWell(
  onTap:()
  {
    navigateTo(context, WebViewScreen(article['url']));
  } ,
  child:   Padding(

        padding: const EdgeInsets.all(20.0),

        child: Row(

          children: [

            Container(

              width: 120,

              height: 120,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),

                image: DecorationImage(

                    image: NetworkImage('${article['urlToImage']}'),

                    fit: BoxFit.cover),

              ),

            ),

            SizedBox(

              width: 20,

            ),

            Expanded(

              child: Container(

                height: 120,

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                        '${article['title']}',

                        style: Theme.of(context).textTheme.bodyText1,

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                      ),

                    ),

                    Text(

                      '${article['publishedAt']}',

                      style: TextStyle(

                        color: Colors.grey,

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
);

Widget myDivider() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );

Widget buildArcticle(context, {var list,isSearch=false}) => Conditional.single(
    context: context,
    conditionBuilder: (context) => list.length > 0,
    widgetBuilder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticalItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length,
        ),
    fallbackBuilder: (context) =>isSearch? Container():Center(
          child: CircularProgressIndicator(),
        ));

Widget defaultTextField({

  required TextEditingController? controller,
  required TextInputType? type,
  Function()? onTap,
  int lines = 1,
  Function(String)? onChange,
  required String? Function(String?)? onValidate,
  String Function(String?)? onSubmit,
  bool isPassword = false,
  required String? label,
  required IconData? prefix,
  IconData? suffix,
  Function()? suffixPress,
}) {
  return TextFormField(
    style: TextStyle(color: Colors.deepOrange,),


    controller: controller,
    maxLines: lines,
    keyboardType: type,
    obscureText: isPassword,
    onChanged: onChange,
    onTap: onTap,
    onFieldSubmitted: onSubmit,
    validator: (value) {
      return onValidate!(value);
    },
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(onPressed: suffixPress, icon: Icon(suffix))
          : null,
      border: OutlineInputBorder(gapPadding: 20,borderRadius: BorderRadius.circular(20),),
    ),

  );
}
void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder:(context)=>widget ,));
