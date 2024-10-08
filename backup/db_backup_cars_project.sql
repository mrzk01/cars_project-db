PGDMP      /                |            cars_project    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24955    cars_project    DATABASE     �   CREATE DATABASE cars_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE cars_project;
                postgres    false            �            1259    25619    ads    TABLE     �   CREATE TABLE public.ads (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text DEFAULT 'No description'::text,
    created_at timestamp without time zone NOT NULL
);
    DROP TABLE public.ads;
       public         heap    postgres    false            �            1259    25644    bids    TABLE     �   CREATE TABLE public.bids (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    car_id integer NOT NULL,
    date_bid timestamp without time zone NOT NULL,
    bid_status character varying(50) NOT NULL,
    bid_price integer
);
    DROP TABLE public.bids;
       public         heap    postgres    false            �            1259    25632    cars    TABLE     �  CREATE TABLE public.cars (
    id integer NOT NULL,
    ads_id integer NOT NULL,
    brand character varying(100) NOT NULL,
    model character varying(200) NOT NULL,
    body_type character varying(100) NOT NULL,
    transmission character varying(50) NOT NULL,
    color character varying(50) NOT NULL,
    price numeric NOT NULL,
    distance character varying(50) NOT NULL,
    years integer NOT NULL
);
    DROP TABLE public.cars;
       public         heap    postgres    false            �            1259    25595    cities    TABLE     b   CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    25600 	   customers    TABLE     �   CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(50) NOT NULL,
    contact character varying(100) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    25607    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    city_id integer NOT NULL,
    name character varying(100) NOT NULL,
    contact character varying(50) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false                      0    25619    ads 
   TABLE DATA           J   COPY public.ads (id, user_id, title, description, created_at) FROM stdin;
    public          postgres    false    218   �                  0    25644    bids 
   TABLE DATA           X   COPY public.bids (id, customer_id, car_id, date_bid, bid_status, bid_price) FROM stdin;
    public          postgres    false    220   p&                 0    25632    cars 
   TABLE DATA           p   COPY public.cars (id, ads_id, brand, model, body_type, transmission, color, price, distance, years) FROM stdin;
    public          postgres    false    219   �M                 0    25595    cities 
   TABLE DATA           *   COPY public.cities (id, name) FROM stdin;
    public          postgres    false    215   �Q       	          0    25600 	   customers 
   TABLE DATA           =   COPY public.customers (id, name, email, contact) FROM stdin;
    public          postgres    false    216   WR       
          0    25607    users 
   TABLE DATA           ;   COPY public.users (id, city_id, name, contact) FROM stdin;
    public          postgres    false    217   ]       o           2606    25626    ads ads_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pkey;
       public            postgres    false    218            s           2606    25648    bids bids_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_pkey;
       public            postgres    false    220            q           2606    25638    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    219            e           2606    25599    cities cities_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    215            g           2606    25606    customers customers_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_name_key;
       public            postgres    false    216            i           2606    25604    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    216            k           2606    25613    users users_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT users_name_key;
       public            postgres    false    217            m           2606    25611    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            v           2606    25639    cars fk_ads_id    FK CONSTRAINT     j   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT fk_ads_id FOREIGN KEY (ads_id) REFERENCES public.ads(id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT fk_ads_id;
       public          postgres    false    219    4719    218            w           2606    25654    bids fk_car_id    FK CONSTRAINT     k   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES public.cars(id);
 8   ALTER TABLE ONLY public.bids DROP CONSTRAINT fk_car_id;
       public          postgres    false    4721    220    219            t           2606    25614    users fk_city_id    FK CONSTRAINT     p   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES public.cities(id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_city_id;
       public          postgres    false    215    217    4709            x           2606    25649    bids fk_customer_id    FK CONSTRAINT     z   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers(id);
 =   ALTER TABLE ONLY public.bids DROP CONSTRAINT fk_customer_id;
       public          postgres    false    220    4713    216            u           2606    25627    ads fk_user_id    FK CONSTRAINT     m   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(id);
 8   ALTER TABLE ONLY public.ads DROP CONSTRAINT fk_user_id;
       public          postgres    false    4717    217    218               ~  x��XM��H=�E�����}d�`A#��K�x3'�(N���[�L�ɰd��&���^�WU�a��x��U[?7����e[��wq5��K��Ī�c�⋲y��9_tON�'�e3���U[�u�z�G>�?>vg,6��(�Qm9�"�?:s�q���\<O��C�*�&���,�*�m�5>C�?G�1���js�t�P i�E�S�}z�_�2��~^����}܁�i�zG���y\l�.�ӂ��L6ͬ�u�a�x�;���X�� ���-�)4�R��i��,�!�l�)�C��e�V��ӉL�%�s9+W�?c�5?�6�����F
m��63̰�����*^�w����H4�UU����KW5_n��`�WMu� �e�Q'�,�
�d��W(d�I*��H�և�@z��m\	�>v?���q]'|e[.�l�	��M��D�A+� s̝M�Xfo�lӾ��Nͬ��3R8T���jm��zmu晿Z�異m��eV�*���@��BaX�Y`��3��@�ݛ���)JmRaǩ����^"��F�Z���:�O�Y��@��?��E� �����{�\�K]Gl��uHF�{�p����g}�4Ԟ��Lf\@��� E�r
理��ێ7��xn��,�������R�����I��f���'u{
�K�G��&ICZ��а�(����(���!ׯ�p'�j^=�Bsth@IB��{ef�ş����J�DMW66q��d`��������voտe7�d^JF'kEEcş��P7�א͒9�3(J�P�!sp��g�[�c_<fz�)/�'�ql]}HE��4��⚁c��}Z'����#elR��i��Bu����h ��PX� 2��L�Ƥ���s~s��aO�d���֣�Pҏ�`[�%X&��ai��D�B�W�(�a��a8I#�I��	��/Ph�3e�Oρ^~�ت:��4j���pAk�*�{Ⱦ}�w|��y�f���.���=Yo����w]����NF~w9�c��2�Dz�m24ϯ~u�i&�J�i]���,��8������Ħ���N�:���� ��cW���Koޅ��H������@�szFq��۞���7��z��/u��Sd�|�6Gj�.}4 ���֎�Q�PF����]#��-���T.D�Az\�$S��qA�[R�O;�Pv��y�^p�pT�ViMU:8�Fq<U]�f>�N�V�I�xE*붞o��q�R�VCK
��ru��Q��v�r�-7��4^�OLiLi�fJ1�kf�S[7�&����� ���P�h���W.��e���W!W��M�͔a�3���wkHOeS��q�k���'ג��Jx���Ȳ�_���0            x��}K�`9��8j��L�G��U<�S�`x�#���܈�qOv%�����+������?��k��k��c���ϔ�G�}���������)G�1�Y��L�?��?��c�8�����-Iq~��kɿC�L�3��\�~�V�S�I��I�D�׸���w�5���{Nӭ�D6m[�ȇY��_C������u���/����C�ǚ��9~-�w�?����"�-߷���~�:����5�����s�Ɔ���9��a�������ʹ��6>��=s���8ݕ���,��qs'�����n[��Zb����ҋ�mR���Cf�s/�5%o]<I�ƞ���Y^�WSp�&��	�s~�k������F��8�������ǰ��c���G�ϙ�m��m�5�������{͛_\5��q�]�ۍ����������?i��~��>�?��J}�����ϵ��癜��$~>θ�Ŏ�o�b܌ܼ{[򹐯����u~>�ϯ��~�3_�^���ǿ��,M6�K��g�y�}�L����q2�i����c��ȮZ�c_��d�&���3���n���wk��aK��,��q��<rC�����m�%����,�^���g3!0��#�A�{�5���<��H����s~��ϯ7����~$��qw}�!`{�?iw|Y�Z�����[)�[�� ���f�Ul��>��k�~?�-��Ì���N+�d�`9�5�.i�Y���j�����G�R���O�;�b���B�+��BĞ�����e�}�f?���=نS�%��ş�;.f��V��>�ܠ����P�_bO�.�]��x��B;��?o�}1;��w��I^%ɔՂ$^�����qgPT��e?��$�I�M	�$��B���>�_�	T����iD̟-����'#����;]{^)��<��`Q�O��K��ʗ���@vj�}b��*�_MuҠ�OI�'�!.i��`}���VM����NRyy<ݢ���*�A�n�z4��O�&��/K��"�uo/���K��.]uG�.�����I�-F�z���Z��zp��yԌ���4�Ia��Ã3]���8�żհ`g���ʓГŧ!��Y�u��vߐ�3J^]O�K�V�교�x��,�Jȅ������/��Z�	s>�V��"������ s�9����}=�P�E#I���^NY���fe\@�K�)�����s��U��#��y녆�H�����k3^=�#�C�h}W8�)��+ɖq�;��$[��i��J���J�ݭV��k��H\d�K[z��â��}��oB��.��bɓ,9��������M���f���.f���,qG!��]��F��!B��^ڋ�)�q��n%�RݮP6���L�F�.�B6tS\'u��BI��<��`�ok��OI�����o��2�ػB����B|nַ�R��8�s8GQ��A�� ??�/KZ��-�)���!�\���ѢQ�C񎟫�
S`�8��M���Ԫ�C:}�8�c�>�	}�/<y�|��$���%���n2ɋMмt�+�&� #M�R�����G�/��gcW���)F=��7+�D��<�YV"��ښ�u�w���ƾ��q�/R��r�n�$C� �&�GJ�����?�P�+S���WӔU��z���&R|n|�Ϥq��Z/����5:�;���\�u��Ǒ^�Q
'z���J��.���C�������PH��K>��YvY��`���_�<�-W��B��4uz!�V3^s�X٢�pr!!6̵Ӧf<�������5�g�u"�����F�'�:�jOH��{��0���'�<l����(����9"o���,lj�!)N�3�%��(����v�A����v�C��C1��ýM��&���+��A�W�����c�N�`A���g��뽞�!�`����%�CS	G.w+�k�a��w�;�S/a|���#g���]gi����Ů4�����n[����j.i<ө,�ϱ��,c�pB�dV��}��$�#"k6����\����O�Oj%�$��X+��?*�/�cd�%��bY���r�V.���|=r5���l�-�9�����5�����ޟ�v��g��ݑ1����_�li�gFj_�:H5��-�U�J��o�I��LQ6Lð��|��LV˛���"H�^��K�������jZ�?������yˁ$�қ��B�r��8�����Id"X�֓j���;@k�t�9�s"���j"x��I�e�ze	�F������]��YC�����܉��Z�KRJdh�ɬ&L�645μ�`\���ěG*a�Y��M1K��R��V���z�1g�q��N�e�)�8�5������p6~~��R���`s�����jc����2/}��	���eG��{��"\�^הJ.�z��Yy^��-`sPf�(��Nj�.'���v�9�'e$��ؐ$8�zy����1^���З�-��yCc�V/�ǘ6w��b!N��OFR i
��-P�%�lu�v��0�h�7��@c��Ab?� �g���H��UZ׮q_@��a޾�N��ؿ��	�H0⇲��X�bkZ�b2̦���kXEHH�<~VkO��|a"7ɻ>M�}�7+�::b�f�2~t���J��l'��2���ʼ�.LQ����w�T����R�����YkV.�����=Vz&����A6�b%�Q_������
�F�w�N�y�. �C��ր��A(����
��,� Ӭ8��i(RC��%��'A:\_z��B�0��-��a��zPS���a�ޖtX8��t��2�#��;^��5yr7��p��/k��4
$�3A��,�Gn�,��] 8&����"��ԡ���'�*o'��K��Ћ�pbM�=��H�D�<[�|"���L�]���:`���!�|�Q���i��)N�P�3E1��%��bXܥ�N���y����t�[�l�#{�',�Mh�c�{�(��ȏ�{:-ȉ=i8�Er��|NE���sT.�	�|�o���p�æ_R�ۏ:�S��r��k��f�r�U�����S�1�<�>vG�+.o�����8��G��UO8)	��|N�A�e�pL�=�� e
0Ben�OFG��u��[�S�I����O�4��M�u���k����!�Na^�0�o[�d�P�iMr��/I�8m��<yf������;�N{�d�4�ue������PVx(<h���1���G*��$'SFD�;�0WT�Tp�H���P�v`
�62�q��,h�gPYU�c*�=�0�kEm�<���Vy�hO�hS5(��W���#+S��J��ш�U%��S�D����ye����1�ƽ��3��;��n_8-��#��畽�4��:\
���za{�ݘ��C(�x-��>���|V�� M�)��/����W��]|4W���$N!Ʉ����$�@	%��"�OD��W���I�H�[�����\�hDI҄����"ܖ��M3S/S9��%wc%��aK�&�b$���	+�G&J���/�or��9��f�<b��aCbS�5�d��t�<r��`}�C�T�����C
�`y�^�)K�I�/��!')�ŻZq��P��(��i3pU=۱�C���w)�����I,Z���T���)L���J���Rmqַs�!ϳ���\iL��ȝ�ejq�(��~"��C����q����{B������.�f���$%�|�.2�5�XF3L�A	�\�RaA=�g)���+[��6t�T��3�	ƓqL�_�A�̨#|1��D��G1��ػ�T�Ov����2FF�H�ޕ&��}�~����fUjK��h� <�tP��@V���<M��X�?�Tu�?:��d:&��(0�v�H<��7�n�L����Fu�>��b��F�YUf2Ɂ{�у�&Ò���MU�`2�B�/^c�s$��T�7ēG�J�tat���wKֆӏ�;Z�eU��C8:@!;#���k<}#B$�2T�[���d���%_x��m��x���|w���~r�����z���u:g�
Y��v�xyߒ0��    Y��܉���fk!��oˋ��^<�G�e�"���0�����0h��ϐ��v ��D�MԻ*w����"~$��F���Fnm}MR�(��V���^T�TnL�-���r�ywߌ�٩��o��ئB,A�<?�z��pzǻ���
C 4LaT���#�`2���Z��c��]�O�D��dǓ�i$Y�b���;Ŵ��T��݁E��"9w5d`�![p�D��m�^��$G��<����|"H���˙|a����o
v�U�;����bQfSa�{9��Y�픰�;�`�*�Ȅh�����F���5^X�Jt��.}��/��l2MC��[(*��[BW�{h��ǻ$������o�ᯛrX�g�W�@Cc�����û!E��j��Z�?���8���\M��W�H;��b`�3n�Yi7�\�^�ꇢcCv�ˬ	[�&n���>��p�zW��0�i�uZ�$~��*k"�rfab�naH���*�	�w��Sq|��,�ƪ�$��T'z~͆H1OV���N�����~>�؂���]gަ$�^��I^�+[�����ȥ���i��Yٺ���u{�'D�}��2ٍN��> �U�.8a����%��Rkr���Ic�������4�UI ��ڑ�&��NЄ���d�7�v/:�_a'��'��J�M���恻z�p�lyZ����f��B�`_Ro�0���4���DHd��ݍ�8Dr��*��޷b�/*����F�5(�փ�o0����7�Nv�|)��Wk���T�Q��.���/o�~����HZ7TH�"ey����]�Ω6B�{!���9U��v?}:m'��ME?�Z4�9��b�.�Y��4�cqSz���d3����DQ=So����M:�9�P�r��o��G���T��n�]�@�;"M�}4�tA=OEz��r���z:�uBu��ҟ�pc��i)��j�@'{y�q�p>���l.� Ԗ��b!���,�d�G�����gx�!���Sŉ�ﮣM�nMM����s�=`���G��H���I1+_J���4�?�5h����8��A���	��!Lټ9z֝DS��\�7ȹ�^IWC�)PZ@�P�Zڃq
��R��y&	Ȟ�uCESM(��K�lO��$D��@�+��Tթ��sA���q���G�'��������j��8Fs�cV�L���,�z�0�y� Д1&�R���'�LW�4������D�?�	{>SaT[[(B8����|�|�T\���LxP~_ۂcC��/�-	g� �/�Ӟ�cp�@����~L����6/�����
��ѽet�zle�dtБC:���U�C��u.6%�f�s%QӴp�`�7xg&���ΒQ?�@����/�DĊP˒���O�N���'�v�_��*�MD�B�`�]}f�+ZlBx]Q�
��-Sf�N�)̅����|~l���C�
Id�K�O�$O�&�Xa�aꝣ��RR}8��ȏ��ElC������0Ȼ�BJ.PM���$>�:�2�<��/�8U(n�	���	t'��4�r�Iͻa�����ld���)��^�&�+ͬ�0x	�7��Y�u��ђ5\~�g�$�I���u+����?tP�������.���d-v�aut�n���7<��B#�0ʗ���%����Rg�2��9m=�y�q*�	�)䔃D�ȹ�;�K�@�O����yOf}sD6��A?��&p��}�+�@���ؑ%��y�kc�I·a&���R&H����
t��.l&Y���64(}����]���Z=��=��`�Tgs��c(t�T��|+CM֣Ѹa��D��\υɀ-�?��3m�ÓdU!Ul����2"yI��䶸��ě���j2Gƭ��Z��̨r�p(:6&�}
��txG�}���p��O2�[�s�Q2��)hV%�&����!���:E3���~�9G(���\�p���8�k���+��,��g�Tu6g�L��l����1{��7�oAM��On1��5���/_Xiof�Ё��-������6J43�bЖG2��4Rl:dEF&�r��-Ŭ�#Q���٪�5���IB:����x,��B1��i�4���~�R֐.Af�8ak�0��/ꏏ	�=���D0���f
3��?>�W����^"�����`�$$�xo	va��m�-����I�}��<g��65�N�6�ןH��t��ѫ�~��;P�qG�|���Y�;�k'�o�.P�� �s���e[R]�o�a�$���x=Lpt��O���)��Bp�y<B|����J�`ᨁm�,��|�1��l�C�z�"�*4�K��f��	`��,� X֤-�;{��oh(�R�'�rӅ����J�7�q�'yO9��v�/5�v��j:)�=�#qW���J ʛ	�S�^r����l�K"��b�J+�Fأ�Omݬ��:D/n7�|w54,|٭1�,&��8�U�D��C|�J2�s�.���\����+^w��w����]x�.
s��l)��d�h-0Ѯ��o�����M��!zv�iR�/��X(���Ֆ7]t���R�P2��ѯ�eqpvrh��n�]�7�Q��.���Ra�w���`�e��{�n�|3�6:��t�Zfji�.|[Ź��̚ ��,���}!uxc����Pa���Z6����{��b����<��,@�,�R8 n��C2_��|ʒ`�V���s 4%�)�e�*�+�]f�:*�RNm�[ک �a�5�ft�H�/ٝ�����9�l Ǵ���ٷ:����y0��ΚL̈́�.��B�g=	�y��@�fJ��CBz���o��B���zo�7YʍA���_�e<�6fzkb+��Q�48��frt�(zvkڄ o:ٴ�������2%9�#�;F�W�J�����=�=y/Y��$5��ip���L�vAw����LGnS@h�V6�i��Z�89(�`ą��$R^��ʝ�w�Mµ��B��5mU�'�}��]+K���<mӯ�M|<ӥ�7;�#]��_�Q�!�2�k�sqA���*�ȁނ�`�b�7��
 ���`o�V/�Rr��¿�<JY�M�n"'_N_�=Ҫ7����&[�Tw]�@r�b���|R���(��7H�t5�W� 2s�7z^݃�W5�tyz�}�&h:�m-qi�j��� q�9CJ?��J)r�
r���:N�;8���q�֚4↴�Q탸R%kgZ�f֎���U�e�oM��9��q�elsuu�0��P�֗Y'8�)M�
�k`��)�ӥl�@_'����uV�U��h�)ɯ��R��s��to� ��:�@P��k~{�1���b�gjW��f6tM�j�v��B�>]-,cvmHM]� �g`<���* �)>]mc��x�(�[U��T��g+�G����:d�-�����W�ڗZ�^��ɧ�u(I435�N�_�4�y�c���� L�Ս��XP+�;�;�������.�mR��w����C�
_���FG����^E�i�hP@���)���B�s���^i9~���1��oTOMD`%�_<�S=��	!.��b�g(��S�,(�:Q�٣�ض�e0���֯��<_�Ռ�_���'�A5�� ������ב/V�������9���ޛg��Ub�0�T�����
�MZE��g(�W�Q#+�W�R�)�57T���{����f�7��1t^U�~_�����DًP���ɛ\�k�]��P$�51�Ts��>��@'��via�3%��"R��(�Y�V��@�~n�^q�xB�eG�x����,���.P_hB+769AMS��\:���U���2�,�j[��`�9��j���@k<ż�t:מ4�g���,�jM�"���յ �JW����tR�zư�F�Ţ�(DD���j��x�e$Ea.��u����>A�,��M��hf���!*��Y�r0'X�F��hԓ�TMf���nPخ�m�8�r���z(	&ha�N�ڍ�F�ԺI����d�e��kAh?�Q����D��쁽 ��R2!��=~W���mxǗI���� h  �b?e�|c�~ �i�����*s�l<$�����(U�)[F)_0f�t�<���!��O�ENe)��ek6$�kdd?e�6
��a�Kwi/����4�U�9�җ�.�6J�f�|	6�_t1��l�gqr��3kuQSZ����IJ̓�����2�7ԑ�
>h�5�w���5�JG+�$JjigU�Nu�?{���?�*	�ۘ��Ir]٬����ɗ��2g��H~4�F�T�6�N��y}_�*J��q���� ������y�-f�9��,c��j��V�L�\�PJ�Fi�p���6l�l �Kgp���?0ͷa ۛ��YI�B���"1��|dv>�gMvK1M��ڭa�dK���Ɨ�%�'�iqQr9q)O��Nj �B�*�@�>*:$��;;�s�#�Ȋ��(؆����-��&�q�]�_�d;2q�% 	�i�� ~��0��\ﷶ�p�MR�4���XwP�'�h�7ٖ����:���A��dU���#jc�3�$�E�ݥ�Y3>�>�5-N�鰩��,Um��^1��o�B�˞��	�<c�T��L�w�)1Ŧ��e��U��݅(�n�8�^~hև��2shf���$ؗ��pf�5��zI���t�%�6��z��c�'���<� ��K�ԨX�[���o��(�����^,�G؊� ���;�3'��>X�vĪ��Z��'hhOm��go(b����!���Tղ�Õ��yB���6=zQ1i�������Pg�L� +j6ߋ$�.k�����L8/�R��ͷ-�q�ح����:x];�^2�ltm0�h���"'�jA��3:{f	w���e4+�")�dIb>^3�P�ۻ�ϼ'�1-���iV%�	��z�喵0Tw�І��Ƴ�JC�3B��Y(,R)J�U����y9�$�*5���\��Zh^�,Jo��l`�'�Ri`��!�=9���JF�ْ8����.�����M(<�����£nc̳+�S�Cb`[U�M]q:��
X���c)�P����
4������HJ������d����p�F+ϖ��Br�ߡW��D�YX��Ɉ� U�8�Ț����-���� �"��(1�RRv�\�d�Ym����n((V���Caw���������<zN
�����WMŠAӨ���I�Onh��ٓr2�e�qX�G���.�8
M�L��YX�ޱ�Aa�5�u��?�hS�w��F�E_8������^7X$Q�a���B��T��Io�?�ؒT�2� OP����A�!��z�Y}����g�&���,��ㄇ�Ǔ:շ�q��AR`�\��O�͟j��(b!H�S}���т��~*�C��=�bN�Drv�՞9����=�?��Ql�EX��a�
�̾���6n�("k���0���F�Gա�j��N�^pn��X�a�s�ǳ�R�=��=YE[��I��ɒ��%|mT�A�p�qW�����Y*$��	 �K�
��G0���)F���.�﹒;���s���*��OkH47�z��1V����5e��v�O��7�~��5	��$�2�7��K�5:����s�q*����4��$�J�5���Ǝ��]g��1�Y7?h�Ď�׭k�=xw0�9��Ѐ�u�aC��U�&q�Y��CY�IJ�Zo��#�-��d5��]x��5��Tt�p��,<�������V#�`5u�7��tbc�E��3����?J��Q�����]?4V�	�p��1�C�d7U����ao������޳��>_��Y�^�L��r*]��*�|Ac�:&���+6M�����_�� ӈ~4��W����}gCis<�>��e�G�D�*ͧo��8��:��?���?�E�H�         �  x����NAE��_�H���ג<$	)
	I�l�`ؒ�#�ק��=�c���֭[Um@���e�
�c�;,�gqV7����A\��:<���e�`�z�� ��Ó@F� }�s�^-�ª�_׫�^ ���d��$N�d�p�m�X� 5Y���Z`�X:�A��~���n� ���zPa�������Jy�2�K��fӻ�m�8牪9N�a�l2��,E�6�G�aΰ��:�씵�e�������r݇�WD&�Y	�����9?��b>(�JYF{��ǀb(e���j�mU��N�F �b��մZ8��F�Ǩ����v	v#<"%O�z��]��8!�S����y]����<�͍�?b���R|�=�P��i��f9Ap
���M�F�*NK��)����8���c���Z��A;�h��K�~������Ր�k�q\'c+�T�[���H�6�6Fm��8oqm$�3jTRΪ)M4䱙����|��ԫ��SL�XT�λ .�^m�m5�*���옭�v�q�u3�Ţ�ˡJ�6��#�����偫G�R�O)�o$�G-�|HCr�����ٗ��z`z���j���0�R�����Z��fcuSz�LR󆁢���8�k_^2�\7���i{~�����+o��L!IF���wWc��m��ߘ�������{��#�^�S$@u԰)'Hž��=F�W�5Mƶ+�J-�oyWf��F0�C�����<~i#e�0j�U�\���͜�iOe�l�UJ2�E7���Mk*8fT�%�b��F�� z\�X�����h1혳I+�r��~�����r�ݍ�%��x�,�ya��^��>�qa;՚�?*��N!���moc�ɖ	:�ë����:�,�*)_���-�[9�K)�)U��         �   x�U��
�0D�ݯ�b��zj�C��)��(19��M�rZx�3�����p-�7t0��n�%��,�O��yʅ���<�ͷ���"�<���":U�e �4���ŧ�q��(�UN<�B�:�d<��h��-S�NY����λ�@��	�_������-���*�9�0T��~����'"�y�ak      	     x�uX]s�F|^�
�_��~c�NI��'ۥ��.u/+"V$ f�_=����S�\��ٙ��p������yl��O��{�U���߾�����e�2�R���
�x�	v��w���G?N���au?����wS	�Mw����BUf��RP~��H��6~绍�����b����*JS�L���U�ևv�|���ǩ��k��1�&9ӥ���
�2�n6]=�ǃo��:�}��_��I�Uh]�\�̰_�U����n�����S�v�������q����p��9��[UTʚ̲��iC�n����~���D
WH�LQJͳ��]�bw��g_���%�8�&�I��,���X�9�~�?�!�������o��~j}Rq%YVU�+-2^�_���������7������s^(U��8�}�]����B0�k?�u�Oi�,Q'4K�Je\��u�����&��M�D����Q��˸d�f )�D�;�O ex�	�I����FJ�:�����o�י�L���독�@�*�Ĝ�HX����ǉ��#�t��J��q��.��ؠ9oW��C�@�!l�����WN(%ʅ>gܢ���M��Ti�y^�X��X��V��w�w�ޢ\xE���q~��E��f�2����!�Ｃ��3E���+*�a��Q2%{�k=J��߼?U����&��(�0��N�Lp����O����cׁ�tEa�1��0����ݦG����4�l��R&���YV��1:cT0z�S$�J���P�yB�ۀz�m?��=�OC X��L(���A)kv?O!����`����D@�W�o��\���B8e��0�z�/�o}���s�<�tN�)Ql�n��p��c���� �ēR
p��.����+v����C3�C ��~MmƂ���+Qp�������~��xl��:tΥ�o�4�̍��,��������О
���9hYXS��D,g7;b�7�Qc��ҳ��E�$XE�e�,.T�\��m҆��Z�L�(77�	�C��C:��Ik�����+���@���Y�>�-�*�f&b'9˺�p���LB7w-��md��h���X�*�J�I�>l�+<c���A�Ê�Ԉ��~��b�r�3�*,�I���ד��Zt}���E��i�GO~��"����ا��E��r�C��c79�1P(��ټ�Oa v�4��9cG�S%[����Xl�{�a��=�����@2�	��A��(�)@����nzI Q�����l-7P(�R����G�Xt.'�ö�"uzҠ~�@e��J��@��)����⿿��s,���A.�ȔZ��j77�o@ښ���O���T��A��f���f���/w~��=Lh#y21�\\D�)�f: 6������;�ur\ne� �Do�V���#lG_?�0C�B�F�j]�*��x�����Џ�� [��uR�����}��7�=���9����!�A�.��_�!�~´ r�M9�J1�h<�����e�,��Q���r/Y�)Kc27�z(��_iS���X$��:ӀW���u<7�{�:-�6�m-��L���ޯa�ߞM9(w?O�_h;=�������g����n3w#�!:�kO�PiC�H 	Ö�>�M����I��*�G��4y��)l�V�'�Nl\F4�[�p�	,�"�@��\����̋��p�[��L;�ú�Y�pl~`�8N�����L�>�M}YG�}L�2E�A� T�8��߬�_C�ꋋ/�l�OVVSj3�P�~���O,d|��~�"5�L�A��2#�+P��e��E�↓�B��(����ň	�?/��ї)����)��p�=v�Q���Ʒ���^��$ė��̌����ő��BC��Z�t��Zj���m$�hq<*�65�/�	@�	Ǐ�D��rMרNJZ�P��@$�M �m�����6�Аg�w_�<�C�J�eK��OgS���`B8W�tXX���xf	^ Q���T�$6��T�[�ӳ}�ba�7�6��ݟ�}	[�<�V�m�6[�+$w���b�/&�?�� �2��3�f[n�y�p��ר����eu#w�1���j��:z���Q�uW�>]�����̚H�]_<�Yb��8���`Յ!�W[v��'M_�����RO���pVZ�3[��..B�;H�IZ��"��)�|f{�?7��6܇��!���Q��5hQe����<y�������KD�10��?�역�Ү��_Yũa��\��>Nd�����+%���ǏK���أԿ�{B�Ҷ�E�Rݕ�ظ]�*��.�ї������/�c��: ��xGiyV��G�o_ĺc�0)Mp�Nc�UJ���eA��GCaS�P�R���&��3|r9�	'��� �q�ʹpYe�k��|�-�-t��,��K!�0\�;�lVU�7���θ��_����`Ļ�Y�n���,��蕋Y������D�<�#�U�*�P:E�4�J�������-�I�����"���nK���)�H�)��h���qw������-�'7q���꧆�����j�/sb��|�/����+n�D��X�S�g�wx�0<���_�S�b��)쭎�5�!���+�/:�Pq�hPuIU
�X7�}�����v?��� ~;/��Ǟ���z�9x��pDӷ��p-��b����F� `��Y�0E�RX������5�B;0�sp�����A�w��;'�K��!���/K位���u�1~P���]c3�@�\�f�[eY��Y�      
   |  x�UTKs�8>[�B���z�ݙ
�I���䲗&� v�l/���mY0�)_?��W7TJ;����#�q��Vz�{�" H&+�����?c�[<��!~�������0��5S(g�5nc�|9	'�$h�噮8U�S��	�:��&��	�PFk!�f��D3�Mۥ3͝P�	�=�c��YF�i�_7���>h�\e�@_��gL�7��YȲ/C#����7���_�5���eܧ�P;%dh�p��Y-�k��#�/��^t��OKBi�4�S���k;�<�C�O�D;m@�x� 
�u�Q�;�i����y�r;�*�b5�e1�k�k��cG�o��`'��/G�Oθ`�J�)�S<���t��1��t#�D[�P���#���]����Jq@X뀊�=��ܣ���ԛ2:H� �b�#
��V���3�T�k�c!0p�_�1��7<\�v7�~OxN|��3�]�~<c����:��ߋ]�ȿc<a�� -q����e�)�\ќ�l�-X�EPV1	ـ�
�Ł?�m�<s���i�����hUV��>�^w}iQ#@I�W��ۚ�7cK�C��_��C3��L���hy�I�pSD-wA�|�������S�	�p��69��i��-<g5Ş �$��c��)�!K�+�O^��aw⋱�t��S���nE�däϿ���>!�x��U�^�HB:C�C�u�L<�x��[�p[h8!�~P��jJ�N��u�5X�n,%��:`Pҝ���לƥ\�[˥!���Ô,hZ�m.�3v�oG�gC��!�)3��2��Djc�}gLG�d�ҥ�۴��c>���H�ѱptV�N)S�-IU�|�/]�[o�К"P��5c�?8y=     