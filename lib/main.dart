import 'package:bhargav_stockal/Blocs/home/home_bloc.dart';
import 'package:bhargav_stockal/models/task.dart';
import 'package:bhargav_stockal/stockal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Blocs/layout_list/layout_list_bloc.dart';
import 'Blocs/tasks/tasks_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhargav-StockAl Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xffFEFEFE)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeBloc _bloc;

  bool typographySelected=false;
  bool layoutSelected=false;
  bool colorSelected=false;
  bool styleSelected=false;
  bool getStartedSelected=true;

  bool expandTypographySelected=false;
  bool expandLayoutSelected=true;
  bool expandColorSelected=false;
  bool expandStyleSelected=false;

  late LayoutListBloc _layoutListBloc;
  late TasksBloc _tasksBloc;

  bool boxModal=false;
  bool gridNContainers=true;
  bool implicitGrid=true;
  bool negativeSpaces=false;
  bool alignment=true;

  String radioIcon="assets/icons/radio.svg";
  String labelSelectedIcon="assets/icons/tick.svg";

  Color scaffoldBackgroundColor=Color(0xffFFFFFF);
  Color titleColor=Color(0xff111111);
  Color selectedTextColor=Color(0xff555555);
  Color fABColor=Color(0xffFF5A60);
  Color labelIconColor=Color(0xff111111);

  Color selectedItemBackgroundColor=Color(0xffEEEEEE);
  TextStyle labelTextStyle=TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      fontFamily: "iAWriterQuattroV",
      color: Color(0xff111111)
  );

  int themeSelected=1;
  int styleApplied=1;
  int typographyApplied=1;

  List<Task> tasksList=[];

  TextEditingController taskEditingController=TextEditingController();
  @override
  void initState() {
    super.initState();

    _bloc=HomeBloc();

    _layoutListBloc=LayoutListBloc();
    _tasksBloc=TasksBloc();
  }

  @override
  void dispose() {
    taskEditingController.dispose();
    _bloc.close();
    _layoutListBloc.close();
    _tasksBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if(state is LightThemeState){
              themeSelected=1;
              scaffoldBackgroundColor=Color(0xffFFFFFF);
              selectedItemBackgroundColor=Color(0xffEEEEEE);
              titleColor=Color(0xff111111);
              selectedTextColor=Color(0xff555555);
              fABColor=Color(0xffFF5A60);
              labelTextStyle=labelTextStyle.copyWith(color: Color(0xff111111));
              labelIconColor=Color(0xff111111);
            }else if(state is DarkThemeState){
              themeSelected=2;
              scaffoldBackgroundColor=Color(0xff111111);
              selectedItemBackgroundColor=Color(0xff222222);
              titleColor=Color(0xffFFFFFF);
              selectedTextColor=Color(0xff555555);
              fABColor=Color(0xffFF5A60);
              labelTextStyle=labelTextStyle.copyWith(color: Color(0xffFFFFFF));
              labelIconColor=Color(0xff555555);
            }else if(state is BlueThemeState){
              themeSelected=3;
              scaffoldBackgroundColor=Color(0xffF2F6FF);
              selectedItemBackgroundColor=Color(0xffE8EEFF);
              titleColor=Color(0xff5C9DFE);
              selectedTextColor=Color(0xff555555);
              fABColor=Color(0xff5C9DFE);
              labelTextStyle=labelTextStyle.copyWith(color: Color(0xff111111));
              labelIconColor=Color(0xffBED8FF);
            }else if(state is GoldDarkThemeState){
              themeSelected=4;
              scaffoldBackgroundColor=Color(0xff000000);
              selectedItemBackgroundColor=Color(0xff322B26);
              titleColor=Color(0xffFAD7BD);
              selectedTextColor=Color(0xff5A4D44);
              fABColor=Color(0xffFAD7BD);
              labelTextStyle=labelTextStyle.copyWith(color: Color(0xffFAD7BD));
              labelIconColor=Color(0xffFAD7BD);
            }else if(state is NormalStyleState){
              styleApplied=1;
              labelTextStyle=labelTextStyle.copyWith(fontStyle: FontStyle.normal,fontWeight: FontWeight.w400);
            }else if(state is ItalicStyleState){
              styleApplied=2;
              labelTextStyle=labelTextStyle.copyWith(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400);
            }else if(state is BoldStyleState){
              styleApplied=3;
              labelTextStyle=labelTextStyle.copyWith(fontStyle: FontStyle.normal,fontWeight: FontWeight.w700);
            }else if(state is DefaultTypographyState){
              typographyApplied=1;
              labelTextStyle=labelTextStyle.copyWith(fontFamily: "iAWriterQuattroV");
            }else if(state is MulishTypographyState){
              typographyApplied=2;
              labelTextStyle=labelTextStyle.copyWith(fontFamily: "Mulish");
            }else if(state is NunitoTypographyState){
              typographyApplied=3;
              labelTextStyle=labelTextStyle.copyWith(fontFamily: "Nunito");
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: _bloc,
            builder: (BuildContext context, HomeState state) {
              return Scaffold(
                backgroundColor: scaffoldBackgroundColor,
                body: SafeArea(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 27,top: 40),
                        child: Text("tasked",
                          style: TextStyle(
                              fontFamily: "TTFirs",
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: titleColor
                          ),
                        ),
                      ),

                      BlocBuilder(
                        bloc: _tasksBloc,
                        buildWhen: (previous, current){
                          if(current is AddTaskState || current is TasksInitial){
                            return true;
                          }
                          return false;
                        },
                        builder: (BuildContext context, state) {
                          if(state is AddTaskState){
                            taskEditingController.clear();
                            return  Container(
                              color: selectedItemBackgroundColor,
                              margin: EdgeInsets.only(top: 16),
                              padding: EdgeInsets.only(top: 16,bottom: 16,left: 24),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/label_icon.svg",
                                    height: 24,
                                    width: 24,
                                    color: labelIconColor,
                                  ),
                                  SizedBox(width: 16,),
                                  FocusScope(
                                      child: Focus(
                                          onFocusChange: (focus){
                                            if(!focus){
                                              if(taskEditingController.text.trim().length>0){
                                                tasksList.add(Task(
                                                  id: tasksList.length+1,
                                                  name: taskEditingController.text.trim(),
                                                ));
                                                cancelAddItem();
                                              }
                                            }
                                          },
                                          child: StockAlTextField(
                                            controller: taskEditingController,
                                            textStyle: labelTextStyle,
                                            maxLines: 1,
                                          )
                                      )
                                  )

                                ],
                              ),
                            );
                          }
                          return SizedBox(height: 8,);
                        },
                      ),

                      BlocBuilder(
                        bloc: _tasksBloc,
                        buildWhen: (previous, current){
                          if(current is RefreshListState || current is TasksInitial){
                            return true;
                          }
                          return false;
                        },
                        builder: (BuildContext context, state) {
                          if(tasksList.length==0){
                            return Container(height: 8,);
                          }
                          return ListView.builder(
                            itemCount: tasksList.length,
                            shrinkWrap: true,
                            reverse: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder:(BuildContext context, int index){
                              Task task=tasksList[index];
                              return  Container(
                                margin: EdgeInsets.only(top: 16),
                                padding: EdgeInsets.only(top: 16,bottom: 16,left: 24),
                                child: GestureDetector(
                                  child: getMainItemLayout(title:"${task.name}",isSelected:task.selected),
                                  onTap: (){
                                    tasksList[index].selected=!task.selected;
                                    _tasksBloc.add(RefreshItemsEvent());
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 16,bottom: 16,left: 24),
                        color: expandTypographySelected?selectedItemBackgroundColor:null,
                        child: GestureDetector(
                          child: getMainItemLayout(title:"typography",isSelected:typographySelected),
                          onTap: (){
                            _resetExpandedItems();
                            expandTypographySelected=true;
                            _bloc.add(RefreshHomeStateEvent());
                          },
                        ),
                      ),

                      expandTypographySelected?Container(
                        color: selectedItemBackgroundColor,
                        padding: EdgeInsets.only(left: 66,top: 16,bottom: 16),
                        child: getTypographyItems(),
                      ):Container(),

                      Container(
                        padding: EdgeInsets.only(top: 16,bottom: 16,left: 24),
                        color: expandLayoutSelected?selectedItemBackgroundColor:null,
                        child: GestureDetector(
                          child: getMainItemLayout(title:"layout",isSelected:layoutSelected),
                          onTap: (){
                            _resetExpandedItems();
                            expandLayoutSelected=true;
                            _bloc.add(RefreshHomeStateEvent());
                          },
                        ),
                      ),
                      expandLayoutSelected?Container(
                        color: selectedItemBackgroundColor,
                        padding: EdgeInsets.only(left: 66,top: 16,bottom: 16),
                        child: getLayoutItems(),
                      ):Container(),

                      Container(
                        padding: EdgeInsets.only(top: 16,bottom: 16,left: 24),
                        color: expandColorSelected?selectedItemBackgroundColor:null,
                        child: GestureDetector(
                          child: getMainItemLayout(title:"color",isSelected:colorSelected),
                          onTap: (){
                            //colorSelected=!colorSelected;
                            _resetExpandedItems();
                            expandColorSelected=true;
                            _bloc.add(RefreshHomeStateEvent());
                          },
                        ),
                      ),
                      expandColorSelected?Container(
                        color: selectedItemBackgroundColor,
                        padding: EdgeInsets.only(left: 66,top: 16,bottom: 16),
                        child: getColorItems(),
                      ):Container(),

                      Container(
                        padding: EdgeInsets.only(top: 16,bottom: 16,left: 24),
                        color: expandStyleSelected?selectedItemBackgroundColor:null,
                        child: GestureDetector(
                          child: getMainItemLayout(title:"style",isSelected:styleSelected),
                          onTap: (){
                            _resetExpandedItems();
                            expandStyleSelected=true;
                            _bloc.add(RefreshHomeStateEvent());
                          },
                        ),
                      ),

                      expandStyleSelected?Container(
                        color: selectedItemBackgroundColor,
                        padding: EdgeInsets.only(left: 66,top: 16,bottom: 16),
                        child:getStyleItems(),
                      ):Container(),

                      Container(
                        padding: EdgeInsets.only(top: 16,bottom: 16,left: 24),
                        child: GestureDetector(
                          child: getMainItemLayout(title:"get started",isSelected:getStartedSelected),
                          onTap: (){
                            getStartedSelected=!getStartedSelected;
                            _bloc.add(RefreshHomeStateEvent());
                          },
                        ),
                      ),

                    ],
                  ),
                ),
                floatingActionButton: BlocBuilder(
                  bloc: _tasksBloc,
                  buildWhen: (previous, current){
                    if(current is AddTaskState || current is TasksInitial){
                      return true;
                    }
                    return false;
                  },
                  builder: (BuildContext context, state) {
                    if(state is AddTaskState){
                      return  FloatingActionButton(
                        onPressed: cancelAddItem,
                        backgroundColor: fABColor,
                        tooltip: 'Cancel',
                        child: Icon(Icons.clear,size: 40, color: scaffoldBackgroundColor,),
                      );
                    }
                    return FloatingActionButton(
                      onPressed: addItem,
                      backgroundColor: fABColor,
                      tooltip: 'Add',
                      child: Icon(Icons.add,size: 40, color: scaffoldBackgroundColor,),
                    );
                  },
                ),

              );
            }
          ),
        )
    );

  }

  void addItem() {
    _tasksBloc.add(AddTaskEvent());
  }
  void cancelAddItem() {
    hideKeyboard(context);
    _tasksBloc.add(CancelAddingItemEvent());
  }

  Widget getLayoutItems(){
    return BlocBuilder(
      bloc: _layoutListBloc,
      builder: (BuildContext context, state) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                child: getLayoutSubLabelItem(title:"box modal",isSelected:boxModal),
                onTap: (){
                  boxModal=!boxModal;
                  _layoutListBloc.add(RefreshLayoutStateEvent());
                },
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 16,bottom: 16),
              child: GestureDetector(
                child: getLayoutSubLabelItem(title:"grids and containers",isSelected:gridNContainers),
                onTap: (){
                  gridNContainers=!gridNContainers;
                  _layoutListBloc.add(RefreshLayoutStateEvent());
                },
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 16,bottom: 16),
              child: GestureDetector(
                child: getLayoutSubLabelItem(title:"implicit grid",isSelected:implicitGrid),
                onTap: (){
                  implicitGrid=!implicitGrid;
                  _layoutListBloc.add(RefreshLayoutStateEvent());
                },
              )
            ),

            Container(
              padding: EdgeInsets.only(top: 16,bottom: 16),
              child: GestureDetector(
                child: getLayoutSubLabelItem(title:"negative spaces",isSelected:negativeSpaces),
                onTap: (){
                  negativeSpaces=!negativeSpaces;
                  _layoutListBloc.add(RefreshLayoutStateEvent());
                },
              ),
            ),


            Container(
              padding: EdgeInsets.only(top: 16,),
              child: GestureDetector(
                child: getLayoutSubLabelItem(title:"alignment",isSelected:alignment),
                onTap: (){
                  alignment=!alignment;
                  _layoutListBloc.add(RefreshLayoutStateEvent());
                },
              ),
            ),
          ],
        );
      },
    );

  }

  getLayoutSubLabelItem({required String title, required bool isSelected}) {
    return Row(
      children: [
        Container(
          height: 20,width: 20,
          margin: EdgeInsets.only(right: 16),
          child: SvgPicture.asset(isSelected?labelSelectedIcon:radioIcon,
            color: isSelected?fABColor:labelIconColor,
          ),
        ),
        Text(title,
          style: labelTextStyle.copyWith(
              decoration:isSelected?TextDecoration.lineThrough:null,
              color: isSelected?selectedTextColor:labelTextStyle.color,
          ),
        )
      ],
    );
  }

  getMainItemLayout({required String title,required bool isSelected}) {
    return Row(
      children: [
        SvgPicture.asset(isSelected?"assets/icons/check_box.svg":"assets/icons/label_icon.svg",
          height: 24,
          width: 24,
          color: isSelected?fABColor:labelIconColor,
        ),
        SizedBox(width: 16,),
        Text("$title",
          //style: labelTextStyle,
          style: labelTextStyle.copyWith(
              decoration: isSelected?TextDecoration.lineThrough:null,
              color: isSelected?selectedTextColor:labelTextStyle.color
          ),
        )
      ],
    );
  }

  void _resetExpandedItems() {
    expandLayoutSelected=false;
    expandTypographySelected=false;
    expandColorSelected=false;
    expandStyleSelected=false;
  }

  Widget getColorItems() {
    return Column(
      children:[
        Container(
          padding: EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            child: getColorItemLayout(title:"white",index:1,color:Colors.white),
            onTap: (){
              _bloc.add(LightThemeEvent());
            },
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          child: GestureDetector(
            child: getColorItemLayout(title:"dark",index:2,color:Colors.black),
            onTap: (){
              _bloc.add(DarkThemeEvent());
            },
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          child: GestureDetector(
            child: getColorItemLayout(title:"blue",index:3,color:Color(0xff5C9DFE)),
            onTap: (){
              _bloc.add(BlueThemeEvent());
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          child: GestureDetector(
            child: getColorItemLayout(title:"gold-dark",index:4,color:Color(0xffFAD7BD)),
            onTap: (){
              _bloc.add(GoldDarkThemeEvent());
            },
          ),
        ),

      ] ,
    );
  }

  Widget getStyleItems() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            child: Row(
              children: [
                Container(
                  height: 20,width: 20,
                  margin: EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(styleApplied==1?labelSelectedIcon:radioIcon,
                    color: styleApplied==1?fABColor:labelIconColor,
                  ),
                ),
                Text("normal",
                  style: labelTextStyle.copyWith(
                    decoration:styleApplied==1?TextDecoration.lineThrough:null,
                    color: styleApplied==1?selectedTextColor:labelTextStyle.color,
                      fontStyle: FontStyle.normal
                  ),
                )
              ],
            ),
            onTap: (){
              _bloc.add(NormalStyleEvent());
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          child: GestureDetector(
            child: Row(
              children: [
                Container(
                  height: 20,width: 20,
                  margin: EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(styleApplied==2?labelSelectedIcon:radioIcon,
                    color: styleApplied==2?fABColor:labelIconColor,
                  ),
                ),
                Text('italic',
                  style: labelTextStyle.copyWith(
                    decoration:styleApplied==2?TextDecoration.lineThrough:null,
                    color: styleApplied==2?selectedTextColor:labelTextStyle.color,
                    fontStyle: FontStyle.italic
                  ),
                )
              ],
            ),
            onTap: (){
              _bloc.add(ItalicStyleEvent());
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          child: GestureDetector(
            child: Row(
              children: [
                Container(
                  height: 20,width: 20,
                  margin: EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(styleApplied==3?labelSelectedIcon:radioIcon,
                    color: styleApplied==3?fABColor:labelIconColor,
                  ),
                ),
                Text("bold",
                  style: labelTextStyle.copyWith(
                    decoration:styleApplied==3?TextDecoration.lineThrough:null,
                    color: styleApplied==3?selectedTextColor:labelTextStyle.color,
                      fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700
                  ),
                )
              ],
            ),
            onTap: (){
              _bloc.add(BoldStyleEvent());
            },
          ),
        ),
      ],
    );
  }

  Widget getTypographyItems() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 16),
          child: GestureDetector(
            child: getTypographyItemLayout(index: 1,title: "iAWriterQuattroV"),
            onTap: (){
              _bloc.add(DefaultTypographyEvent());
            },
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          child: GestureDetector(
            child: getTypographyItemLayout(index: 2,title: "Mulish"),
            onTap: (){
              _bloc.add(MulishTypographyEvent());
            },
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 16,bottom: 16),
          child: GestureDetector(
            child: getTypographyItemLayout(index: 3,title: "Nunito"),
            onTap: (){
              _bloc.add(NunitoTypographyEvent());
            },
          ),
        ),

      ],
    );
  }

  getTypographyItemLayout({required int index, required String title}) {
    return Row(
      children: [
        Container(
          height: 20,width: 20,
          margin: EdgeInsets.only(right: 16),
          child: SvgPicture.asset(typographyApplied==index?labelSelectedIcon:radioIcon,
            color: typographyApplied==index?fABColor:labelIconColor,
          ),
        ),
        Text("$title",
          style: labelTextStyle.copyWith(
              decoration:typographyApplied==index?TextDecoration.lineThrough:null,
              color: typographyApplied==index?selectedTextColor:labelTextStyle.color,
              fontFamily: "iAWriterQuattroV"
          ),
        )
      ],
    );
  }

  getColorItemLayout({required String title,required int index,required Color color}) {
    return Row(
      children: [
        SvgPicture.asset(themeSelected==index?"assets/icons/check_box.svg":"assets/icons/label_icon.svg",
          height: 24,
          width: 24,
          color: color,
        ),
        SizedBox(width: 16,),
        Text("$title",
          style: labelTextStyle,
        )
      ],
    );
  }
  void hideKeyboard(BuildContext context){
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
