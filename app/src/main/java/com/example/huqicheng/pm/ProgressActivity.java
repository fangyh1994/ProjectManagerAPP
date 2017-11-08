package com.example.huqicheng.pm;

import android.app.FragmentTransaction;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.TextView;

import com.example.huqicheng.service.MyService;

public class ProgressActivity extends AppCompatActivity implements ServiceConnection,
        CalendarFragment.OnFragmentInteractionListener ,ChatFragment.OnFragmentInteractionListener,
        ProgressFragment.OnFragmentInteractionListener,
        SettingFragment.OnFragmentInteractionListener
{


    private TextView mTextMessage;

    private FragmentTransaction ft;

    //declare static fragments for CalendarActivity
    private static ProgressFragment progressFragment = null;


    private Intent intent=null;
    private Intent chatIntent=null;
    private Intent settingIntent=null;
    private Intent calendarIntent=null;

    private BottomNavigationView.OnNavigationItemSelectedListener mOnNavigationItemSelectedListener
            = new BottomNavigationView.OnNavigationItemSelectedListener() {

        @Override
        public boolean onNavigationItemSelected(@NonNull MenuItem item) {
            ft=getFragmentManager().beginTransaction();
            switch (item.getItemId()) {
                case R.id.navigation_calendar:
                    //show calendarFragment and hide the others
                    startActivity(calendarIntent);


                    return true;
                case R.id.navigation_chat:


                    startActivity(chatIntent);



                    return true;
                case R.id.navigation_progress:
                    ft.replace(R.id.content, progressFragment);
                    ft.commit();

                    return true;
                case R.id.navigation_setting:
                    startActivity(settingIntent);


                    return true;
            }
            return false;
        }

    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        this.chatIntent=new Intent(this,ChatActivity.class);
        this.calendarIntent=new Intent(this,CalendarActivity.class);
        this.settingIntent=new Intent(this,SettingActivity.class);

        this.progressFragment = ProgressFragment.newInstance();

        this.ft = getFragmentManager().beginTransaction();

        //add fragments to transaction
        FragmentTransaction progressFragment = ft.add(R.id.content, this.progressFragment, "progressFragment");


        ft.commit();


        BottomNavigationView navigation = (BottomNavigationView) findViewById(R.id.navigation);
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener);
        Menu menu=navigation.getMenu();
        MenuItem menuItem=menu.getItem(2);
        menuItem.setChecked(true);
        intent = new Intent(ProgressActivity.this, MyService.class);
        startService(intent);
    }

    @Override
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        Log.d("debug:", "onServiceconnected: ");
        System.out.println("Service connected");
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater=getMenuInflater();
        inflater.inflate(R.menu.navigation,menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        ft=getFragmentManager().beginTransaction();
        switch (item.getItemId()) {
            case R.id.navigation_calendar:
                //show calendarFragment and hide the others
                startActivity(calendarIntent);


                return true;
            case R.id.navigation_chat:


                startActivity(chatIntent);



                return true;
            case R.id.navigation_progress:
                ft.replace(R.id.content, progressFragment);
                ft.commit();

                return true;
            case R.id.navigation_setting:
                startActivity(settingIntent);


                return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onServiceDisconnected(ComponentName componentName) {
        Log.d("debug:", "onServiceDisconnected: ");
    }

    @Override
    public void onFragmentInteraction(Uri uri) {

    }
}
