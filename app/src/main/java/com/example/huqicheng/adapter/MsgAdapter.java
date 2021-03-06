package com.example.huqicheng.adapter;

import android.util.Log;

import com.example.huqicheng.entity.ChatMsgEntity;
import com.example.huqicheng.message.BaseMsg;
import com.example.huqicheng.message.MsgType;
import com.example.huqicheng.utils.DateUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import java.lang.System.*;

/**
 * Created by huqicheng on 2017/10/25.
 */

public class MsgAdapter {
    public BaseMsg ChatMsgEntity2BaseMsg(ChatMsgEntity msgEntity, long groupId, String avatar) {

        BaseMsg baseMsg = new BaseMsg();
        baseMsg.setType(MsgType.ChatMsg);
        baseMsg.setGroupId(groupId+"");
        baseMsg.putParams("username", msgEntity.getName());
        baseMsg.putParams("body", msgEntity.getMessage());
        //System.out.println("avatar:"+avatar);
        baseMsg.setAvatar(avatar);
        String pattern = "yyyy-MM-dd hh:mm:ss";
        Date date = DateUtils.parseStrToDate(msgEntity.getDate(), pattern);
        baseMsg.setDate(date.getTime());
        return baseMsg;
    }


    public ChatMsgEntity BaseMsg2ChatMsgEntity(BaseMsg msg,String clientId) {
        ChatMsgEntity msgEntity = new ChatMsgEntity();
        Map<String, Object> params = new HashMap<String, Object>();
        params = msg.getParams();
        msgEntity.setName((String) params.get("username"));
        msgEntity.setMessage((String) params.get("body"));
        msgEntity.setAvatar(msg.getAvatar());
        msgEntity.setDate(new Date(msg.getDate()).toString());
        Log.d("msg","is come msg"+!msg.getClientId().equals(clientId));
        msgEntity.setComMeg(!msg.getClientId().equals(clientId));

        return msgEntity;
    }
}
/*
    public static void main(String str[]) {
        //test

        BaseMsg baseMsg = new BaseMsg();
        baseMsg.setDate(new Date(2017, 10, 25, 15, 38, 30));
        baseMsg.putParams("username","Mark1212132321");
        baseMsg.putParams("body", "blablablabla");

        ChatMsgEntity msgEntity = new ChatMsgEntity();
        msgEntity.setMessage("blabla");
        msgEntity.setName("Mark");
        msgEntity.setDate("2000-10-25 13:34:43");

        MsgAdapter adapter = new MsgAdapter();
        BaseMsg targetBaseMsg = adapter.ChatMsgEntity2BaseMsg(msgEntity);
        ChatMsgEntity targetMsgEntity = adapter.BaseMsg2ChatMsgEntity(baseMsg);

        System.out.print("targetBaseMsg\n");
        System.out.print (targetBaseMsg.getDate().toString() + "\n");
        System.out.print(targetBaseMsg.getParams() + "\n");

        System.out.print("targetMsgEntity\n");
        System.out.print (targetMsgEntity.getDate() + "\n");
        System.out.print(targetMsgEntity.getMessage() + "\n");
        System.out.print(targetMsgEntity.getName() + "\n");
    }
*/


