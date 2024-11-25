//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "Unit1.h"
#include <dir.h>
#include "registry.hpp"


//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ShockwaveFlashObjects_OCX"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
int scr_w=1024;
int scr_h=768;
void __fastcall TForm1::FormCreate(TObject *Sender)
{
///drag & drop files>
DragAcceptFiles(Handle,true);

//<<<<<<



Memo1->Visible=0;
Application->Name="J_Flash_Extender_by_AJLCYDX";
Form1->Name="J_Flash_Extender_by_AJLCYDX";

String swfname="swf.swf";
ShockwaveFlash1->Movie = ExtractFilePath(Application->ExeName) + swfname;
////////SET WND>>>
        Form1->Left=abs((GetSystemMetrics(0)-scr_w)/2);
        Form1->Top=abs((GetSystemMetrics(1)-scr_h)/2);
        Form1->Width=scr_w;
        Form1->Height=scr_h;
        ShockwaveFlash1->Width=scr_w;
        ShockwaveFlash1->Height=scr_h;
////////SET WND<<<
}
//---------------------------------------------------------------------------
/*char path[256][256];
int nFiles;
*/


//FILECOPY
//FILECOPY
int MoveFiles( AnsiString slSourceDir, AnsiString slTargetDir, bool toCopy = true )
{
SHFILEOPSTRUCT sh;
sh.fFlags = FOF_NOCONFIRMATION | FOF_SILENT | FOF_FILESONLY;
sh.wFunc = toCopy ? FO_COPY : FO_MOVE;
sh.pFrom = slSourceDir.c_str();
sh.pTo = slTargetDir.c_str();
sh.hNameMappings = NULL;
sh.lpszProgressTitle = NULL;
return SHFileOperation ( &sh );
}
        void __fastcall TForm1::ShockwaveFlash1FSCommand(TObject *Sender,BSTR command, BSTR args){
//>>>reg
bool tmpa=0;
TRegistry *Reg1 = new TRegistry;
//<<<reg
/*
wchar_t *wch2113;
String str;
*/



AnsiString c(command);
AnsiString a(args);
        if(c=="about"){
        //ABOUT

        int _w=Form1->ShockwaveFlash1->Width;
        int _h= Form1->ShockwaveFlash1->Height;
        int _w_w=Form1->Width;
        int _w_h=Form1->Height;
        int _w_x=Form1->Left;
        int _w_y=Form1->Top;
        Form1->Image1->Width=750;
        Form1->Image1->Height=700;
        Form1->Width=750;
        Form1->Height=700;
        Form1->Left=5;
        Form1->Top=5;
        Form1->ShockwaveFlash1->Width=1;
        Form1->ShockwaveFlash1->Height=1;
        ShockwaveFlash1->SetVariable(L"_root.j_about",L"by AJLCYDX");
        Application->MessageBox("J_Flash_Extender\nby AJLCYDX\n01.08.2007_[18#33#00]_[3]\n\n","by AJLCYDX",+MB_ICONINFORMATION);
        Application->MessageBox("1) Это лицензионное соглашение является юридическим соглашением между Вами и автором этой программы.\n2) Устанавливая или используя эту программу Вы полностью соглашаетесь с этим соглашением. Если Вы не согласны с условиями этого Соглашения, Вы не можете устанавливать или использовать эту программу.\n3) Данная программа является бесплатной.\n4) Автор не несёт никакой ответственности за порчу и потерю информации.\n5) Вы не имеете права использовать эту программу для нарушения какого-либо международного закона или закона вашей страны .\n6) Вы не имеете права использовать эту программу для нарушения авторских и имущественных прав каких-либо лиц.\n7) Вы можете установить и использовать неограниченное количество копий этой редакции программы на ваших компьютерах.\n8) Вы не можете дизассемблировать или переделывать любую часть этой программы.","Лицензионное соглашение",+MB_ICONINFORMATION);
        Application->MessageBox("9) Запрещается использовать эту программу в коммерческих целях без согласия автора. ''В коммерческих целях'' означает для получения денежной или прочей материальной выгоды. Вы не можете арендовать ,передавать в аренду или продавать эту программу.\n10) Автор не несет никаких обязательств по снабжению Вас новыми версиями и/или обновлениями.\n11)Вы можете распространять данную программу только в оригинальном установочном архиве","Лицензионное соглашение",+MB_ICONINFORMATION);
        Form1->ShockwaveFlash1->Width=_w;
        Form1->ShockwaveFlash1->Height=_h;
        Form1->Width=_w_w;
        Form1->Height=_w_h;
        Form1->Left=_w_x;
        Form1->Top=_w_y;

        }else if( (c== "quit") | (c=="q") ){
        Application->Terminate();
        }else if(c== "hide"){
                if(a=="1") {
                Form1->Hide();
                }else{
                Form1->Show();
                }
        }else if (c== "setcursor"){
        AnsiString astr0202 (ShockwaveFlash1->GetVariable(L"_root.setcursor_x"));
        AnsiString astr0201 (ShockwaveFlash1->GetVariable(L"_root.setcursor_y"));

        SetCursorPos(astr0202.ToInt(),astr0201.ToInt());


        }else if (c== "clipcursor"){
        if(a=="release"){
        ClipCursor(NULL);
        }else{
        AnsiString astr0209 (ShockwaveFlash1->GetVariable(L"_root.clipcursor_left"));
        AnsiString astr0208 (ShockwaveFlash1->GetVariable(L"_root.clipcursor_top"));
        AnsiString astr0207 (ShockwaveFlash1->GetVariable(L"_root.clipcursor_right"));
        AnsiString astr0206 (ShockwaveFlash1->GetVariable(L"_root.clipcursor_bottom"));

        RECT LR;
        LR.left=astr0209.ToInt();
        LR.top=astr0208.ToInt();
        LR.right=astr0207.ToInt();
        LR.bottom=astr0206.ToInt();
        ClipCursor(&LR);
        }

        }else if (c== "runscreensaver"){
        SendMessage(Handle, WM_SYSCOMMAND, SC_SCREENSAVE, 0);

        }else if (c=="monitor_power"){
        if(a.ToInt()==1){
        SendMessage(HWND_BROADCAST, WM_SYSCOMMAND, SC_MONITORPOWER, -1);//on
        }else{
        SendMessage(HWND_BROADCAST, WM_SYSCOMMAND, SC_MONITORPOWER, 2);//off
        }
        }else if (c== "fcopy"){


        AnsiString astr0202 (ShockwaveFlash1->GetVariable(L"_root.j_fcopy_to"));
        AnsiString astr0201 (ShockwaveFlash1->GetVariable(L"_root.j_fcopy_from"));

        if(!MoveFiles(astr0201, astr0202))
        ShockwaveFlash1->SetVariable(L"_root.j_fcopy_return",L"false");
        else ShockwaveFlash1->SetVariable(L"_root.j_fcopy_return",L"true");



        }else if( (c=="fullscreen") | (c=="fullscr") | (c=="fscr") ){
        //FULLSCREEN
                if( (a=="1") | (a=="true") ){
                        Form1->Left=0;
                        Form1->Top=0;
                        Form1->Width=GetSystemMetrics(0);
                        Form1->Height=GetSystemMetrics(1);
                        ShockwaveFlash1->Width=GetSystemMetrics(0);
                        ShockwaveFlash1->Height=GetSystemMetrics(1);

                        ShockwaveFlash1->Repaint();
                        ShockwaveFlash1->Refresh();
                        
                        Form1->Repaint();
                        Form1->Refresh();
                }else if( (a=="0") | (a=="false") ){
                        Form1->Left=abs((GetSystemMetrics(0)-scr_w)/2);
                        Form1->Top=abs((GetSystemMetrics(1)-scr_h)/2);
                        ShockwaveFlash1->Width=scr_w;
                        ShockwaveFlash1->Height=scr_h;
                        Form1->Width=scr_w;
                        Form1->Height=scr_h;
                }

        }else if(c=="exec"){
        //EXEC
        AnsiString astr4554 (ShockwaveFlash1->GetVariable(L"_root.j_exec_application_params"));
        char* chr11 = astr4554.c_str();
        ShellExecute(NULL, NULL,a.c_str() ,chr11, NULL,SW_SHOWNORMAL);

        }else if(c=="fsave"){
        //FSAVE
                AnsiString astr (ShockwaveFlash1->GetVariable(L"_root.j_fsave_stream"));
                AnsiString astr1 (a);
                if( (astr.Length()>0) &&(astr1.Length()>0) ){
                        Memo1->Lines->Text =astr;
                        Memo1->Lines->SaveToFile(astr1);
                }
        } else if(c=="fdel"){
        //FDEL
                AnsiString fn1 (a);
                DeleteFile(fn1);
        } else if(c=="setappname"){
        //SETAPPNAME
                 AnsiString appn1 (a);
                if (appn1.Length()>0){
                Application->Title = appn1;
                //Application->Name = appn1;
                }
        } else if(c=="mkdir"){
        //CREATE DIR
                AnsiString dirname1 (a);
                //
                int s;
                char *dn;
                dn=dirname1.c_str();
                s = mkdir(dn);
                if (!s){
                //Directory created
                        ShockwaveFlash1->SetVariable(L"_root.j_mkdir_result",L"ok.");
                }else{
                //Unable to create directory
                        ShockwaveFlash1->SetVariable(L"_root.j_mkdir_result",L"err!");
                }
       } else if(c=="rmdir"){
        //REMOVE DIR
                AnsiString dirname1 (a);
                //
                int s;
                char *dn;
                dn=dirname1.c_str();
                s = rmdir(dn);
                if (!s){
                //Directory removed
                        ShockwaveFlash1->SetVariable(L"_root.j_rmdir_result",L"ok.");
                }else{
                //Unable to remove directory
                        ShockwaveFlash1->SetVariable(L"_root.j_rmdir_result",L"err!");
                }
       } else if(c=="check"){
        //CHECK
                ShockwaveFlash1->SetVariable(L"_root.j_check_result",L"ok.");
                
       }else if(c=="w_x"){
       //SET Form1->Left
                int wx = a.ToInt();
                Form1->Left=wx;
       }else if(c=="w_y"){
       //SET Form1->Top
                int wy = a.ToInt();
                Form1->Top=wy;
       }else if(c=="w_w"){
       //SET Form1->Width
                int ww = a.ToInt();
                scr_w=ww;
                Form1->Width=ww;
       }else if(c=="w_h"){
       //SET Form1->Height
                int wh = a.ToInt();
                scr_h=wh;
                Form1->Height=wh;

       }else if((c=="reg_new_str")|(c=="reg_read_str")|(c=="reg_new_int")|(c=="reg_new_bool")|(c=="reg_del_key")|(c=="reg_del_value")){
        //================================-----------RGISTRY---------------|<<<<<<<REGISTRY
        //=++++=================================
        AnsiString rkey (a);
        if(rkey == "HKLM"){
                     Reg1->RootKey = HKEY_LOCAL_MACHINE;
                     tmpa=1;
        }else if(rkey == "HKCU"){
                     Reg1->RootKey = HKEY_CURRENT_USER;
                     tmpa=1;
        }else if(rkey == "HKCR"){
                     Reg1->RootKey = HKEY_CLASSES_ROOT;
                     tmpa=1;
        }else if(rkey == "HKU"){
                     Reg1->RootKey = HKEY_USERS;
                     tmpa=1;
        }
        //=++++=================================
        if(c=="reg_new_str"){
        //REG new str
        AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
        AnsiString key_s_name (ShockwaveFlash1->GetVariable(L"_root.j_reg_str_name"));
        AnsiString key_s_value (ShockwaveFlash1->GetVariable(L"_root.j_reg_str_value"));
                        if(tmpa){
                        Reg1->OpenKey(_key,true);
                        Reg1->WriteString(key_s_name,key_s_value);
                        Reg1->CloseKey();
                        delete Reg1;
                }
                }else if(c=="reg_read_str"){
        //REG read str
        AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
        AnsiString key_s_name (ShockwaveFlash1->GetVariable(L"_root.j_reg_str_name"));
                        if(tmpa){
                        Reg1->OpenKey(_key,true);
                        AnsiString _a_ (Reg1->ReadString(key_s_name));
                        wchar_t *wch11;
                        _a_.WideChar(wch11,_a_.Length());
                        ShockwaveFlash1->SetVariable(L"J_SWF_last_reg_value",wch11);
                        Reg1->CloseKey();
                        ShockwaveFlash1->SetVariable(L"J_SWF_read_reg_value",L"1");
                        delete Reg1;
                }
                }else if(c=="reg_read_int"){
        //REG read int
        AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
        AnsiString key_s_name (ShockwaveFlash1->GetVariable(L"_root.j_reg_str_name"));
                        if(tmpa){
                        Reg1->OpenKey(_key,true);
                        AnsiString _a_ (Reg1->ReadInteger(key_s_name));
                        wchar_t *wch11;
                        _a_.WideChar(wch11,_a_.Length());
                        ShockwaveFlash1->SetVariable(L"J_SWF_last_reg_value",wch11);
                        Reg1->CloseKey();
                       ShockwaveFlash1->SetVariable(L"J_SWF_read_reg_value",L"1");
                        delete Reg1;
                }
                }else if(c=="reg_read_bool"){
        //REG read bool
        AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
        AnsiString key_s_name (ShockwaveFlash1->GetVariable(L"_root.j_reg_str_name"));
                        if(tmpa){
                        Reg1->OpenKey(_key,true);
                        if(Reg1->ReadBool(key_s_name)){
                        ShockwaveFlash1->SetVariable(L"J_SWF_last_reg_value",L"1");
                        }else{
                        ShockwaveFlash1->SetVariable(L"J_SWF_last_reg_value",L"0");
                        }
                        Reg1->CloseKey();
                    ShockwaveFlash1->SetVariable(L"J_SWF_read_reg_value",L"1");
                        delete Reg1;
                }
                }else if(c=="reg_new_int"){
        //REG new int
        AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
        AnsiString key_s_name (ShockwaveFlash1->GetVariable(L"_root.j_reg_int_name"));
        AnsiString _key_s_value (ShockwaveFlash1->GetVariable(L"_root.j_reg_int_value"));
        int key_s_value= _key_s_value.ToInt();
        TRegistry *Reg1 = new TRegistry;
                        if(tmpa){
                        Reg1->OpenKey(_key,true);
                        Reg1->WriteInteger(key_s_name,key_s_value);
                        Reg1->CloseKey();
                        delete Reg1;
                }
                }else if(c=="reg_new_bool"){
        //REG new bool
        AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
        AnsiString key_s_name (ShockwaveFlash1->GetVariable(L"_root.j_reg_bool_name"));
        AnsiString _key_s_value (ShockwaveFlash1->GetVariable(L"_root.j_reg_bool_value"));
        bool key_s_value=false;
                if(_key_s_value.ToInt()){key_s_value=true;}
                        if(tmpa){
                        TRegistry *Reg1 = new TRegistry;
                        Reg1->RootKey = HKEY_LOCAL_MACHINE;
                        Reg1->OpenKey(_key,true);
                        Reg1->WriteBool(key_s_name,key_s_value);
                        Reg1->CloseKey();
                        delete Reg1;
                }
                }else if(c=="reg_del_key"){
                //REG del
                AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
                        if(tmpa){
                        TRegistry *Reg1 = new TRegistry;
                        Reg1->RootKey = HKEY_LOCAL_MACHINE;
                        Reg1->DeleteKey(_key);
                        delete Reg1;
                }
                }else if(c=="reg_del_value"){
                //REG del
                AnsiString _key (ShockwaveFlash1->GetVariable(L"_root.j_reg_Key"));
                AnsiString _value (ShockwaveFlash1->GetVariable(L"_root.j_reg_value_name"));
                        if(tmpa){
                        TRegistry *Reg1 = new TRegistry;
                        Reg1->RootKey = HKEY_LOCAL_MACHINE;
                        Reg1->OpenKey(_key,true);
                        Reg1->DeleteValue(_value);
                        Reg1->CloseKey();
                        delete Reg1;
                        }
                //================================-----------RGISTRY---------------|<<<<<<<REGISTRY
       }else if(c=="filedlg"){
       //FILE DIALOG
                AnsiString astr22;
                bool v1=PromptForFileName(astr22,ShockwaveFlash1->GetVariable(L"_root.j_fileopen_def_ext"),"",ShockwaveFlash1->GetVariable(L"_root.j_fileopen_title"),ShockwaveFlash1->GetVariable(L"_root.j_fileopen_init_dir"),a.IsEmpty());
                if(v1){
                    wchar_t *wch113;

                astr22.WideChar(wch113,astr22.Length());
                ShockwaveFlash1->SetVariable(L"_root.J_file_dialog_path",wch113);
                }

        /*}else if(c=="istheresomefilesforme?"){



                wchar_t *wch114;
                if(nFiles>=0){

                for(int i=0;i<nFiles;i++){
                String str3(i);                String fuckedborlandtext="_root.J_dropped_file_path"+str3;                fuckedborlandtext.WideChar(wch114,fuckedborlandtext.Length());                str=path[i];                str.WideChar(wch2113,str.Length());                ShockwaveFlash1->SetVariable(wch114,wch2113);                }
                //all
                String str2(nFiles);
                str2.WideChar(wch2113,str2.Length());                ShockwaveFlash1->SetVariable(L"_root.J_dropped_files_all",wch2113);                nFiles=-1;
                }
        */}
}
}



//---------------------------------------------------------------------------



void __fastcall TForm1::FormCloseQuery(TObject *Sender, bool &CanClose)
{
 ShockwaveFlash1->SetVariable(L"_root.j_FormCloseQuery",L"1");
CanClose=false;
}
//---------------------------------------------------------------------------

/*
///J---------------------------------------------------------DRAG AND DROP FILES
void __fastcall TForm1::WmDropFiles(TWMDropFiles & Message){
//char path[256];

HDROP hDrop=(HDROP)
Message.Drop;
nFiles=DragQueryFile(hDrop,-1,NULL,NULL);
                        //for(int i=0;i<nFiles;i++){

//String str3 (path);
//wchar_t wch2113;
//str3.WideChar( wch2113,str3.Length());
//Form1->ShockwaveFlash1->SetVariable(L"_root.J_dropped_file_path",wch2113);
//DragQueryFile(hDrop,i,paths[i],sizeof(path[i]));
//sendfiles(i,path,nFiles);

//str= filepath
//Application->MessageBox(str.c_str(),"!!",+MB_ICONERROR);

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$FILES>>>>>>
for(int i=0;i<nFiles;i++){
DragQueryFile(hDrop,255,path[i],sizeof(path[i]));
DragFinish(hDrop);}//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< OVER







//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$FILES<<<<<<
//}//end for
/*
String str2(nFiles);
str2.WideChar(wch2113,str2.Length());
ShockwaveFlash1->SetVariable(L"_root.J_dropped_files",wch2113);
  */


 /*

}
//J-----------------------------------------------------DRAG AND DROP FILES<<<
   */


