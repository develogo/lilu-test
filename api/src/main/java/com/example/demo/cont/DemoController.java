package com.example.demo.cont;

import com.example.demo.model.Contact;
import com.example.demo.service.FirebaseInitializer;
import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.*;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

@RestController
public class DemoController {
    @Autowired
    FirebaseInitializer db;

    @CrossOrigin
    @PostMapping("/getAllContacts")
    private List<Contact> getAllContacts() throws  InterruptedException, ExecutionException {
        List<Contact> contacts = new ArrayList<Contact>();

        CollectionReference contact = db.getFirebase().collection("Contacts");
        ApiFuture<QuerySnapshot> querySnap = contact.orderBy("name", Query.Direction.ASCENDING).get();

        for (DocumentSnapshot doc:querySnap.get().getDocuments()){
            Contact cont =new Contact();

            cont.setId(doc.getId());
            cont.setName(doc.get("name").toString());
            cont.setPhone(doc.get("phone").toString());
            cont.setEmail(doc.get("email").toString());

            contacts.add(cont);
        }

        return contacts;
    }

    @CrossOrigin
    @PostMapping("/addcontact")
    private Object addContact(@RequestBody Contact contact) throws  InterruptedException, ExecutionException{

        ApiFuture<QuerySnapshot> future =
                db.getFirebase().collection("Contacts").whereEqualTo("email", contact.getEmail()).get();
        // future.get() blocks on response
        List<QueryDocumentSnapshot> documents = future.get().getDocuments();

        boolean haveEmail  = false;

        for (DocumentSnapshot document : documents) {
            haveEmail = true;
        }
        if (haveEmail == false){
            String id  = db.getFirebase().collection("Contacts").document().getId();
            db.getFirebase().collection("Contacts").document(id).set(contact);

            Map<String, Object> hash_map = new HashMap<String, Object>();
            hash_map.put("success", true);
            hash_map.put("payload", id);
            hash_map.put("message", "");

            return hash_map;
        }else{
            Map<String, Object> hash_map = new HashMap<String, Object>();
            hash_map.put("success", false);
            hash_map.put("payload", "");
            hash_map.put("message", "Já existe usuário com este email.");

            return hash_map;
        }

    }

    @CrossOrigin
    @PostMapping(value = "/updatecontact")
    private Object updateContact(@RequestBody Contact contact) throws  InterruptedException, ExecutionException{
        try {
            ApiFuture<QuerySnapshot> future = db.getFirebase().collection("Contacts").whereEqualTo("email", contact.getEmail()).get();
            List<QueryDocumentSnapshot> documents = future.get().getDocuments();

            boolean haveEmail  = false;


            for (DocumentSnapshot document : documents) {

                String recive = contact.getId();
                String onBase = document.getId();

                if(recive.equals(onBase)){
                    haveEmail = false;
                }else
                {
                    haveEmail = true;
                }


            }

            if (haveEmail == false){
                ApiFuture<WriteResult> writeResult = db.getFirebase().collection("Contacts").document(contact.getId()).set(contact);

                Map<String, Object> hash_map = new HashMap<String, Object>();
                hash_map.put("success", true);
                hash_map.put("payload", "");
                hash_map.put("message", "");

                return hash_map;
            }else{
                Map<String, Object> hash_map = new HashMap<String, Object>();
                hash_map.put("success", false);
                hash_map.put("payload", "");
                hash_map.put("message", "Já existe usuário com este email.");

                return hash_map;
            }
        } catch (Exception e){
            return  false;
        }
    }

    @CrossOrigin
    @PostMapping(value = "/deletecontact")
    private Boolean deleteContact(@RequestBody Map<String, String> json) throws  InterruptedException, ExecutionException{
        try {
            ApiFuture<WriteResult> writeResult = db.getFirebase().collection("Contacts").document(json.get("id")).delete();
            return true;
        } catch (Exception e){
            return  false;
        }
    }
}
