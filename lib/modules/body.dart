import 'package:flutter/cupertino.dart';
import 'package:newspaper/layout/cubit/cubit.dart';
import 'package:newspaper/shared/components/components.dart';

class bodycontainer extends StatelessWidget {
  const bodycontainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).buisness;

    return articalBuilder(list);
  }
}
