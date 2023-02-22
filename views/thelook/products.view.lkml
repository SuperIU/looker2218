view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand;;
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src="https://cdn3.iconfinder.com/data/icons/business-part-2-1/48/Tag-Brand-Cost-Label-Name-Price-512.png" height=12 width=12> </a> ;;
  }

  dimension: category {
    type: string
    # sql: ${TABLE}.category ;;
    sql: "jhjahdfjhadsjfh kha dfhjkhjdfhkjljlhasdl12345678901234567890'{}}{-.,{}[]*}kfhkljhdfklh ksh hkhdfdkgjlskñdjjgkh shdglkjh aksjñlksfjslkdjvlkajdlñkg kjkmfgkjsdffkgj kj jjajgkadkjrojjadsfnakltjaknhgKJVsjeh kmfamfkjdfnkla kajskñlfjd kajGlajekfjalgmv,jrkgkahnn LADakkklgnkañmgLDsdkjg kñlsdjg kñlkjaañlDsgkfñlaljrrg zñldjglñsdd jñldkfdfgljh xkdmgj ñLkfg ñljgklnjs lñdkfgdzjfgLÑSDkdfgñlLZkhñljmklngvf,.xcmvñlsdfsdjfgkn Lkxmfklñgnsk-fmbgÑLXMcb,.z.ndfKÑLDGJm, lmxdflñbm x,mbñlm smlnk.nmcxbk,.nx.,cnbnb.,m,.m-lzfldml,zmdfm,.mzcx,..mzbxc,.mdflmndf.nzcnkcxbnkcnm.cm,-xckjlndfszgijhoasgdhoñasdgñuoaergoiuegfwaghiladgsljhasdgjhasdgñhjzsdgñlihsgdhjsagdjlñhdd kknhsdvvkljsjdfkl jfdñlkjaddfkljalkjdslkjklhhadgklhñsagdkñlhvagsdhñlksd lñkhjzsdvkjzsldkhjzdsgkljzdklhsdgkljalk hjklñsjdg kjadgkljsdlkjglksdjglks jdkgjñlkxhhklsdfdjfgkl nhññklxdzhcdvjkhzxcvk nvlkzjxchjvjlkzxcnkjlvnkjlzcvb jjbnndjsnvlj hndnjlfnhklnds<vxljcnlkscfbkj dnj jnfdkjhjugjkhkladkjgkdfjgkjalkkfgnk kljnakldjfgk kljj kjfdskj da kjlkñkjasdflñjlñasdkjf ñl ñl  dglñj gdfklñj sdfgkñljbjn ihdsakfhkshklsa jñkhhds fkjhskfjdkl sjks dlkjs kafjlkjsdkljfkljfei lkj kajfkñajdkjddkj kjsg ñlfjñkfsjg sldkjglsñddkjflñg sjfdgkñl jñlslfdkjhlñjsdkñhjkñxdjfñlbgkjñkfdjbñlskjfjhlñbj dfñfljbl ñfjj bñldfjkñlb mmdfñlkjn blñdfmf ñlkjhñld kj jgñljd lñjñljfd lñjlñg jñljñljkjlñdfglñjjfdgnmlñlflñdfmgblñmmñlgmmñldfm lñjmjmlfxmbmñlm lñm fgñlmmbf gñlmmbcñlmmñlmcbvkñlmcbvnkbcknnckñcvkncbvknbvknckncvbkñmmbckmñc vñlmm cñlmcñlvbml ñmmlñmm ñlx fñlmkñlxccmvbkñlndkbnkñ" ;;
    html:
    {{ linked_value }}
    <a href="https://www.google.com/search?q={{ value }}" target="_new">
    <img src="https://cdn-icons-png.flaticon.com/128/4196/4196708.png" height=12 width=12> </a> ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  # dimension: department {
  #   type: string
  #   sql: ${TABLE}.department ;;
  # }


  dimension: department {
    sql: ${TABLE}.department ;;
    html: {% if value == 'Women' %}
         <p><img src="https://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20>{{ rendered_value }}</p>
      {% elsif value == 'Men' %}
        <p><img src="https://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=20 width=20>{{ rendered_value }}</p>
      {% else %}
        <p><img src="https://findicons.com/files/icons/719/crystal_clear_actions/64/cancel.png" height=20 width=20>{{ rendered_value }}</p>
      {% endif %};;

    # link: {
    #   label: "Google"
    #   url: "http://www.google.com/search?q={{ value }}"
    #   icon_url: "http://google.com/favicon.ico"
    # }

  }



  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: retail_price_string {
    type:  string
    sql: concat("$",${retail_price}) ;;
  }

  dimension: non_numeric {
    type:  string
    sql: replace (${retail_price_string},"$","") ;;
  }

  dimension: to_number_dim {
    type:  number
    sql: CAST (${non_numeric} as INTEGER) ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id, item_name, inventory_items.count]
  # }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    html:
    <a href="#drillmenu" target="_self">
      {% if value > 10000 %}
        <span style="color:#42a338;">{{ rendered_value }}</span>
      {% elsif value > 5000 %}
        <span style="color:#ffb92e;">{{ rendered_value }}</span>
      {% else %}
        <span style="color:#fa4444;">{{ rendered_value }}</span>
      {% endif %}
    </a>;;
  }




}
