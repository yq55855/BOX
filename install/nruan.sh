#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�mؤenruan.sh �=�sE����t�Ȋ=�Nr��8 �%u`(�^-eyUcilO"���vPtev1$��M6�r
����{��l�j���d����_3=3=��(�9l�=������ﳻ�g�^}ڲ�iÝ�Sr*N���`5� ���5���%�a{�ܡ,/�"Χ�d����kv�+�֍��x�_xy٨�	���sFe�j 58(�#�e2v�fxs��"\��Ө��,���ҙ�#ƪ�Eh��p�z�)�a��0�wS@kM"�D8T�h�(��L�B��qzeV\�/�W�V�A*�(�E�$���n7*4������:�|����Lr���47����D\���SFC���ŌE��Z�\c���ǥ���K�=��A������A�Y�ǖ�zF���|`2�W1\��Y3�Y.zV��ŕ2��*�J}R�r|��@B�.i%4�Z��;ΝCl�|x���3���Ҝ�����>r�H6��>��墒S]�9v�E�C��&��ZC3N�f�Y-���}||[�8����
H�I��<���Q�F�Hɩ�d�]=%�ϴ=W��p��C�Y�64�yb,�A�s(=��(�D��!5�Z�L7ڈ@ZX��hh�e�A��t�� �14jACQ+"�'�
\��������C��U}���xQL�P糥��[�n��|�����g�����\�ѭV���y(F�%}�H4��L�,{�GFFyڇ�?��~��p��m�d�<؁�N"�,i/I�9�k��/_G�`���󝏾^���Λ��5���Yw-�.Z��|��/��� �kF�����+x���!)�XM���(�G�v�Kڴ�'
����!�%���hm��W���O��s�t��h@���'���|c�^��s�N������[����U�X�p�z���N᠐�j�#̆�l_����7��/�Dk��t��Ƣ�GK���A(P1�D���Xվ|'�Y�Y���Fvç�_Rru����P��Ϙ�*f��F=L�*�'��)c֬O���s� <,oƭ�FPɮ�1	"�����:a��֬]+�;\�\(6V�H!�L��JYQJI���̚�Y'a�@���KЫ:�����7jėCH�;�D���y�;W/�<���|��х��K�o?��vi��Wè���+���swy��狯gA?N6<�,���f��wP	�;���"��{�s���Q�4`\����Z�yk�ͫ�K�V�����b�z������{�0��oyy�:��+C�Q�߯}�������o�����J��y�
��~��^���ś��s�
H�bm�M����<�l�߭�sy�!I# τ�|�(���S�\e2GQ��m�	�I�F(P������U=��P~�D�c��D��#A�"Uvl�-�V�R�p�Aď0���(��p>S����>;�֗���|�v����?���o��l��P�g	�lS�5G$4�f�$�p�rI��|X�;%�u��:pR� �{@�o�bQ�C�5B+���Q�A�9g��A�����V15p� TP�q,^�e@��5ش5���,�2;7��ʈ"������M�&�����DRP`o�Q��e.����F+�o�~�߸<~s��|���D��O2S�E*�����}��#��qN5���<��T+a����,�kC���h��LiɔVLi��Km�TVKe�֪���#ˮ5��(%n��T�Y#�0LU"��U5":U����XhA��(�F�@�]�c���A`ߝ�^{����}�'ʡ�'�M%ק$�1+�h��`L����?���?&Bw��C�����~Z����f���0�E��*cN{}��ք3a0.r�� ��Y2�nd�Ikx����7�%\9��D[d����t��{�#\9������'ʣ,ę�Xh-Ky2u��A3X�j��ф�0Ք��Z�˴e{3�R>��T�
6F��d:I����h�~wi�gʵ-Q>���h@;�%����o��d����=M�����T)%�?�������z����R͈Y���rS-	 b� 3  �>v�-� áX��f%�S9,��֌�t8���r6=t=)Vh�cl�z�2h��������Ni��T7��5Mt�(�B���|��D��U��,a㚌�;)\T	���gkǺnO�I
2�1����%:��ZaF:f�Z�z�Z��ºɭv-ҤM($"�!��\�k5�!-]������k߮�x���OV��g�Qtm��g�p��#6�����fk��\�/0���s�:`]{����"�u��s�ѾHʥ��c��Dˎ%�M�7��hEkJ2KT�f��L�e�"Yub@p��ɊwZJ�M�A�K���LΡ<��[XG��'8�Զ!n$�y��	 ��KϞp���%s1�rW>��f�V��PW����br'��d��\�Ud��~{���=��P�_��v����&+���\�0t}�B�ݯ�Ia(sbƖ&_4�����K�RZ��!�����uc�/v�������!�$z���"���9�Ӯ����:�dqڌ�+{ֲ���Zv�d ��])�3F��Q&%�%� I�Ț����DK��s�)�b��X� t�.�
�Y7�M
�Aפ^#�c˞�Uv�>�;��訖V��ؔ伌����{ �m��x�Z4�gi�^x�
���3�"�v��(ɐ���Ϛ���9�猺Q��>���G��ez3Zͩ�͍eqPq�^�����6o�� �<��>��Ɋu~yʕ�t��b�s�!(�kA'���$�l��d!��Hs���R�^)%O�,��p)�j�g������l0��� �n�S�&^��72��d$�l��4\�Uc�y)��,CX/�H-I*��5�Xe��!�^�$���Kc����;:�J�I{��Tvjh(�	'�0�Uq^�.O��#���� ���pU�I�h�Z��0%X��z��V�9Ǆk���,:I��
6�����5x9)��x��*B�S#�b�D��&0��0\,�DWH��[`��9@Ma��ĩS�E��jW�y�g[iE#�UP^e+
�b�FH��sڰ	֚�N����9��,�N�%�Y@57�Gj\��b9�$�\��R���� k��.��lx'���Y�J�kZ�3!Ltg�`t��4�OSf��@&�Ѥ�4�˾���H�U�gǏDB|�<�
�8S�x�	8WUz��v �1b�7(�*��V f���ѕ>�
�!\�f�_W�\Wq\�,������c!z�#:��L"��c�^$ԋm��'(o��j�����#�~���Q��2s�$��s���B��)�#��琌,Ħ���S��Ɏ�4z2��j�FI��3��B��b`6_�2z��zu�|�5 ��W�#4e�2CH$Pr?01��â閌}�A�,ړ��!N��dA�?�
���t��a'<���v$�χ�\̎�Bą@T{rX��k��6�E�ϥ�ձ7u��Y��f���*�*y��V�L�#?�OT�|�U�,�v����G��'�XiB�p�ر�(��I�@Z[ �G�I��"�v�)��b4�� !i]L�����E���=�a��(���G�X�zY�fy�/�[b�x2_����4ƶd�rcݲx�Y|�r7��d�\26���[��}a�x���,�'��'k��f���Mg��>��5�s�����f�]���o2��N����w���,~7����K��ֳx��qg�2}����~O�4lno@l�[x�ӯ��F��cS�7�2E 7�m�����A���LH��D���(�i�.BQ��G���Q�fB�K=iӿ�T4G'#9z�:SW�K$%�4ug�D�S� �힀G0��٨�^�,'��1�5E^�*��&!�Vb�k�$h�~�-s+��'�QУN�t{�����M���>͏5�0i�Ȣ ϟ;낤[��ϩ�<�c|*U���ѧK|��a����tz]�O��?�^S���fh~2�&�zM���ϽM���Jv2v�6��F,�~|S$F��Ć�m�5by���9���j$�{VC����F���F�xJ#�����@��L[=��7�S���ҭ�����Gr@�t~l��b�{�n�������{�r������[�ܧ����z�������,v��>b�ؚ�kl}k�b�gK�2d��h����}=e����q�G�㱤�/�ɉ>i�֛Fvq�.��U��E���:� ���>��3e!��?8�9~ e2J��s9�ǧc�y:a0����y����)&�y΋��u祰����6��`w��:�]��v��Nq^�=�S��d�r��F�b�GP�U��la�(��z2�=ah3Ok�M5��4���fns����8 :y�9|�{���&-m���	c>t`�Q5#�آC�4�6��Eg�vĢ��{}���Ѥ@�~�z��q�O���M��9��R�?Ng>��b*��	��Q��p"�[,;���t������SW֜uӃ���Z~��9���`�9�P�c�� �;�3�\�6�}T��{�~�T�B���Dzϔ/�A�	.6�%VFf�`���QKP�y�"�W�B��!�.6��؆���&�j�G�����78�a#��4̒�揢{�����,�����:_��Nd�㢱_���'�
��)>��EE�i�>vW�Dw�J�j��7��_}K����ʓ/�ł��S#���F�K�X���QH	�����B���t2CJFO�
��3* �a�~�� N-��&����3��:��T�!�����Cv�y��3���lpd�tj(?��U�ӏ���.q��}!'�����۬�A���o�j`�e�w���B,]ކ2CQ�J�}��BN����+��v�ऴ҇���p;��hX��-�����߲S?�j}4����aj掐���(�}�^��eG�u4�|��x '�d�����kAo\ۂ�WA.�s�y=�'���^���Lӟ��eƟ|��P"�'�b�&G/�,�Gb�*�4�H��y�<�bү�nb2e�5^��RO���ڈ(������s��˜��wcl*�M(�hM�M��l��y��������K���7-bAZ���@qο��݊��`��%�T��g��r�U�2(b�c�Zo�W�[�1�ثd���X9I��S��g
m�(������؄3��j߾�����o��5�� ��vx�T$�)��U��h��׉��ۥN+-st(�s��J�bn=�����%���%�ܛɏ�Z̓|��I����łP�C0�î�ҩ.."X���2��ws��aS�+a`W�!�_ʤ�i��XQ�=�S#W_Z�	Wjjk��FM휰��hl�j�d��BKɟl���C��*��	��2:�Q�N�z����L������J<���{]���I�~�QZ����u���5ݏt��k��Xf�zS�+�_Zv�8e��heǩ'>�s����c�A�$��o���|<�%�.lu���Vɤ����nL9��;m�x(�CWBFJ�����kP�n\����~\�℞]zs[��Q�"~���%<��n������ğI�����/^9qb"�.d��&��ȳ�t�(���>4���=ܰ�?c���M���9+z��HY?0r@L�ϑ%,����P���f�m�erM��]7B�dk��#�\����7P�q<�Y�F�#_bo���#�����?��:�|���K����?�m/�u减���z���a�����ן���������:�����ە{�����+���ͅ��###��>48m��}y��wr����^�����j_�ق8l�}���_�޿پri�߾�����j��EF��fj�t�״��6PFϏ�8>p
g��Q:c�ҵ2L�8�Xs�s�u�E�ɩ�dZč��6<����+�3�V������"��k�u+�	�1���}�s��f�TҪ ����pO����Is��_ǐ6s!)QU) ���&�	��|Y�Iզ�9����lL�FR͉㒹����E�j�����Bɫլ&{N���rQN��}��4(�Z
%H{Q�W��Ǹθ�E_91j5�8-�����3e�~bDo�u�. yFl�@��ϑ�jɫ 6yͻ ��#Q��P��ڣ�я1H�ҷ���G�|��������޳v7u$�9�=%�@O�q2L��3��	sΞYD|�|m�X�#��h�!�1�H� !�I�M	�}���ѕ�O�[կ�}o�+��f=2����UU]U]�(/0�K�K&gW�\��j{�gSV��Z�� ��̽\f�{4J�RA�Na�K�z����~Z����������N$�Q��u�#�Xɦ]��7ֲ/ҭKݓ�Dbk�_�I�B�F&��ܰ��Z����uQ���x)[�.�;G���3��T|�Es���Z�ėF5ӻj>������c�+�e���n��hiX���z�"�j�����ڃ㢯��di���n�
��n;�>�+�9�=�V�YT��~�<�����>�3VV�7�4m�����A���04�]%jY,^��3s�1��s�B�� R[8�K�Pl��[y�׍%��(p����TA(���*���܅�����C���F��_��7���g��/^��=�R�z}~ٹy�h��?���ŇS�o����,�_��y@�Ʊ;��,�Vf+q��p�ߪ�?j� �:1ݘ:B��h�\?���o}���)�\�:�̆��E6�L�,9UH��duq������@i|�ș��=��q�3s^����?ە�rc�P��� �п�p�UU�2a��A9�.�S(�>:����2Å�i��U��Q���l&iN�[:6��?VB�e{L�#��C#ْ���P/;U���d;y��a��:o (���7�~��^�ȏ��d�����ݛ6�lT=Z�:PzL���z�����]�g#��~�<(��0�J�R"rr/�_�������UeqFҬ�<	����W�'_,~;]���y8C��=�4
���l����;�S�4�ٿ�1w�y�,O�� V�㋈^��-�x���3��[{�?m����4��c�a�����w������@)���,Ξr����Ua10������g�W�6�Đ^��+�M.'���f�/%��ݻ���p�9{�]P�լ! ClA��w=�?���7ކF�1Z��.�m���=(�Z��\�R[�/^�a�'���N֧���������gk�/9�3�����4����2U�����@�l�˘��i�M����{�W)��}?��|8�6 �x���q)���>�4;̄i�%����\@�:�n;3���[�~L���p��^eŲ�a��X���@4C�H�)�����������{���?g����Kw�g�q��_��q����b��-�ʐ��)L u�΁f۽�������Bv���]��������  �:���3D"�����#.��Pleh�{�Pw����TC��P�P�-G��I�.e&��(�z��l8 ��ҡ�yjAX��So�COi���k�Qǝ)�O�'\��`_���(ȃ�R9���(w��K($w����K{�}u��2�Y�9�z>k7�����mP݁�&���"�d?]�#��7�_O�]��z�Ecd����k�O�0wb
���$d �������۹����@�M�
��*�;���'K��EX)U�zK�b�H'�Tb��[���b�,Ҟ��0N5p�s{�EE����TYPhA�M�wo�$�߻'�cԗ?�"�	Ѱ �'@Ș��s��`�ILq�����#�|������>l���dZ���|�s�%��*��½6�Q�f�\���AL;��d��+�U�!^ֲ`G}�F���YɑD>%$�3;�a�"S�(rcڙ�B���B���kp���⺸GF��$-q*RW��P�.����`~�l�)g��Z%bWoy,����i���A`�8�i�CϪ$��񷾄+��z2�xv� �s�r2���I$�^T����s��� ���sr�>��c��W,���Uո���7�5͐����{��K�^���$`4�� ��A�a��נ��/�#�0��tD?`3*����~�	7�{�7���ٜ���dK������9�UJ��Ђx>�˖����M��!9bW�v1W:0V�=2�8��>����)�����sh�~�~���qزH�'ݐKD��b� h���ȟ�L*ݪv.G���R���y��[ϟ��%�d�s�'������_���0�!��or�����LųD<^���=����4�Hv��/������h����q����x�� ��\�{�f�T�d���tm��9�b���(=+�uH���"��*�Þ��6�k�U+��ZIvN`1��v}.Zݰ�&膤:��Z�@�d+���tS�A=�m�� K�r6�u󢏉*0�-�Z�#�^Ɉ�/nإf�q#W�}J� `C�-~v?�Tu}+�A\�t �G�qn}٘?W[�O8���ś�ш�qk�(��6Z��z����.Ê�*F��5:f���A?$���R[�>�<>�=P&=�7�R�ɞ@z/���ݩ�[��q�R�i[$�>��i}|��p�o��Γ�voat����Z��&r��s	���3w�>ΰh=\�`v>z�̰Ǡr����9zę�G0�L �Qu����I�-$�/��Kى�AB�
�GݑrC�2�d�|���ǳ#I~�}XاL�8�S��rР�v:C�÷=9l5��7�7�ڊ�CY�gVq_������M׼(�{j�{���� ���Զ���EhZ���8�L 'o�%�-4�nj7�3�1"E+����̻��������u,2ȴ���v��|�%�s���^�t�~�V������Վh=aT�VN�nGvx�j)@���2]p��;'o蕻��8�v��F�Lݛ(�;�d:�ز�*r_�E\3P��+�̄�����'��1��~�͑xM~��`BsϕS�pd)B�ц��YИOCr�QI�BH&�%#�u�%I@�������k���빠��"��5���Zi׺�f��De�"_��O�P�k5��>m�4`��k-��8 (�s�#J��t�Z�-�n�g󍏺�B3Q8��v��ۡ�LVIf��~�ʙDt>��ɤ1�F���J�'jl0O���Ҿ�|qVi6�2~L�-�a/c�CK���Eqj��>��]T}Rz�ɎJ������u退]������f�|,�M=8Ѽ]%��&�<��v-����������jA &�8^E�B�B���$M%�GIh [�E�Vrh�t��h�6l��$<ט�҇iŬ�����T������W�.��t�aeOe��ò&�>8���c��w��p��N����=@;7��&s�l�͝J[������y�l ���2���A곗{��e�8vۛ�������Y�2�3#`��70�L-�(����+��8�qP1����s����y���?�?@��yZ1�Ji�����Jv�X�q�x��yg�.�섛e��U�At>�c�:L�=m,��r���}bl����}�n~�����{y��R�*m�	����3q���ԉ�������gd������H1��;�N�g(�W��n97/�-�Ah�#���w.�7I<^��	(LJ�3P�2P�;4�<0�gyO�ȼ��
��'��o˖ �R�_�ץ4N�g���7� �s<P����M����cS,��@��,c��hλz���.7�6͏�t� �7�U�PӐ��n&�HYW�Gd�:Pz�Z��&�,��	�\��`hBg�eI#=�M331뼱*��sg�B]>?��at}~Iv��s9[i�J�I&��d|Y��@�YƊ�1]�J��4�sJf�t�O�d�����Rp�,X1n���A�
f��-���]�|z���2����չ��4;��%��2��5a4�A�ɺ�7��;�?��r�є8���k��������K�� Q����+u����<w�~��ܰ�]9���Y�EH��Z���qe
6���ԟ���Y^S��Q&x��Oh��`��h!ș!���xB��sc�R���`����^��޴y_Z���_���x�������x�������DBLVq�yu�����ӎ~2ɪ�t�2i凋��F��gO�8Hs��U,IS�`״�|n�I�<��h+���K����zS�;���
��㘆�f\<��;�W̶f� ��d����.f���X��*-�V�(B#�i�3Dّ�"v�ռ16���VӖ�[:�V7Y�+2ܾF*4.�����4���v�cx7)#گ����p���n�����/��xЎ'!�8�v^g"�u���Fd�P���4��^r���O{Ù����6mQ{Cޢ�O�vm�J�2x��b���Z��9-OJ{$�n�c�����푮�2��]�j����N�$0�~:�W\'�2=L'�60-��c��ܧh���I$�֢���Mj|�m�1�V�?s�ƸW`#ʴ��h�<����Hllٳ9��ђ��a��.��c{����j�acy�kn��?�՚]DI����xWdi� �&r$>"_�܄�J�2�{k̾�B�*�,�["��p��!'[�wP���m��) ��H�\��?ٽ�Zw�Re�#�>-J� ����]�Q�ٺ9�.9��.���{�H�<p���	v����X�u�#��,��Ȥ�Eu0x����ܔl�t��=��%qi�Z筬cv�Ů��5��b�X��bC���;8BV;��* Ov4�F�B���a&�n�:PȎ�Y!��RS��E�]2�tw_:,�TD���F 0V�˝�3�<X�HR��� 
-�j�CPG��b�!n�݀l&��q��m��\��-z\�?�¼��V��7��X�S����9�੅����7����]�j\����*n�W�[���r��KNV��������������l��CzS�!�J5��_��z��Rz�����y}O��ߘ��%�b��[)5\�3R��A
��+!���C2�I&��x��@֗�O<^(��l�mbY���ݾ���X�x����<��\)u��H:�y������"�(y]|�U��R`ՠ��������
��"�X>�������m�	ۈg�<�U�V�����D���V�]і�N	��3�ay�M���R3�H�T�y�A4����)���RZfG�%;W-���I�[�Ab��W�+� �4�f᛽���1��*0V�Fx��.�C�ߒ�̰]�|9���΄K'|ή�����P~���?՞|ɜ�e���Ӭ<�,}���R���D��x�'W�r��ji�ڱ�����ov�i����R���m�[�WTq7��/�F����(��p�Z� �Gϓ���T)�aL�O˗�zD?�0y1����
�JkyDC\���Z�qiS�^A����$�c�a.���CY��`X���k���P@R&�ש�j��}�׭⳻&���U���-�<x�* C�� _�X�/O,�<�"i+�w �o}+��H�?�om�U���^�+IGt�L��Ƥ�4^,�E�T2_!:��x�6Z�ga���l��鐌3���`x,�[�a)fꗿ�f�f���C_9צY�U��UU�	IY��]��Zu��`�t4�Am��J�+���"�R��3A��3��7���L�M�e�#wY&kg����g���=��t���,����4��x��/�睛�8�����/MM9���Q"��b������ʰ	�^�z�P�Y*d1i���5����!f�л?93���f���x��=��jr=}��p�#J���i�ܥZq��j�H�Z��?������i�x��Ŏ����f	�qk����`~�� �0� ��p4f�@�g�8g���w��s���[��0-}xZ��)�gO��X7��q݃�PN6���$a�@�d���jD�/]���UD�������E��3����,L��<�f>�`�����
Z9wY������(V����@�L���,3��*�t��z���?-�H��V���B�<M�q�k��%����h�iY�>H\���Q�O�\E���a�4{Z���ۜ2���r��h����hH�aX<V#�=6��ta����"���F=�l��� �q�Nn�Vȵ4��+�
��N��ق7�*9i�,�M9ԣb�n�T-�4u���'e���Z�#��ET7DX6�$���aO���Ajw��q��D,����sX�r�[���_�XS����^z老/������Yd�	�Ɍ<��s��蓠�lCw�O}v<��nׯŻn�d��i��b�Y���������a�)�.�FKZ����C>Qȭ�Gs���M;3'Y�RY|�t93�9G5�Xe�ƩAl ��>?�|z�%�����(V�ƣ������)��Y��`BH�Q�f+�1?g(��d�e�������h�Y`ƔHOo�{���R6]ˊ�O#���޳3EQ��b���w�qGcĹ��7�t�s��s����3�7O�{P *R�ީs)Y��%�, �E�Q�;�#���ѝ`�F��w�<�N��Zռ�l =QC�=elN�$E�/��xg�1wu�/�� U6?�5'F�.��g�3APb�]�}Sj�%'���j���=A�Ų�p�� ��+�w���mY��%� �;y��|O�ϱ���=��ո�\��knY��w3���@�L3��'m�kp���n�'u^� Ad!R��9r�?�ף�BF���� �����5w�Uq�7b��6ѱUOI�=�e�ː��"_}�3}.�k`�r�dY*)M��"8�����m��5v+N6���_Z_iXiXix���Dǩbh���"F�s!#�LP#d-EUuO�4�˪�ZD��Et��u� ���%S�ji�tFQ���ڜ��
˾�,�2y\�Ϭ�g��3k���>㽖Bl4��s%�4˻3]��纬T���pp��@2�6�:��j����)(k
ʿ���,�̌ԾY��8i	I��Ge�]S˨�͏�Qfh��nج[�����@�an�����I��4��E���@Zp��_|�	��qf���o펣���_Q��ea�F32�F0$;'�E߈�,˙5�F��hF�Y��u���ؖ91q�>�dَ�:�N��O��v������穱�9�tW�c׮]���۟,����t�Q{1)ȃ��'����������P�4=���.C�ڏ���}�k�,I9>��H%]�h��U���Gu�]��zy�v�2+AC�/���:5�Ԏ�<�!@X|�%�x+�E�% ��4,¾t�ߖ�4����~�ǌU -6+���#c�cz���<��(t���:O�eJ�R^��,F�id������擏7?�B&��r���zt��+��ku�E�4���7�<<t��<A�"�������g�,y��<%S�Q��P������*@/��_�gB���1�@��G��K=0b �-��=u����p��x���⺫W��T�[uT[υ^W1��x?�bZ����d�Um}��Qt�V��]��l��)/W��|Ǟ�=.p��'*����J�D%|�>Q	���OT�'*����J�D%|�>Q	��*�C��DFrŲ���hWJ��9�.�V��,����N`:����cu,Q��W�mK����v&d�&���Y�i׬Ǳ�ջח>ǀ��u�)�',��y>}��w)tO�l�Lz&��D)���5��RZ�|13I�~uiG����פ���HS��4�P��{�AX�,�9էI���^��.,���aZ?�|��
����(������JɝX�6������0�މT�Q���C�c����agNstNy#�":O�1�%��
ܖ�8Nw"��'1$F�)̞�8��/	�B1"bY�q��isZ'%_P�.�N�^�=-\'��HmyI3R�.��͸$�T�'�L��.C���7~V]���c�;U����-C}ho�%���y4���/�8)} �M�݀˄��NT�>L�a��=\@&�YF�[ǐ[��]:���:�Q�?�~�1il��59[][ǣ�W���U��p��ߩ��'��ph�_·��t8�W��w7����g��k�Ⱦt{��;̎����	��@t!�X�e�XPPq���' #�iu�!|,�&���H�IE2�c�[�d�poU�iϯ)?�����]A�.�-�jz�]y�5��@�	����p���a:��m��m�A*2�}D��l)`�$���͇�������A��B���j��9�ne<G�~* ��&����M�zD�H0o;�pg�q�Ɂ�-��@�>���3�
K=�|/]����H@��)���O�$�HB�$�HB�$�HB�$��!!�JD��Șs#cn'��K=�B��H2�9F���;"2CL�*��I�<U�Ȕf��84����B�DG�g�Ce�E�d����$���*Nfg���b���+�*���M�\:F$;� Ӻ�pode�E��9`����1$��좞�@2�E�|k�+F��Էb�:�\��-�M�v�+�Y��R2�!t�/�^��7��/7�=�WnR��g�N�t�a^v9�t��*5-�7u�\
<�����U{��ƍ�t�Qtp��?���?wb�E]��``u	�g_��vK����/C�F)�b�C��)������[?�\�sp��� �q�4���+�}�b	��1�nI�*��7���N�\��Ã��h�F�"��t���G�7'���N�{0��B�^��3�����0>��ni��5`������N���t�D�H���rZw���Os�": �"����m���V$�!-�G�<�8����$�nI�T��y���O���I�3��L)<�ʡ}����+?ғ��:*N�8!�B�O���7'�c��#Ք��Ï��bi���h�V��.��m����-uBoo�"0��g���3���B�8�V�p�3�2$�SR Җ�4��#k�	)��AzwwO�$ �󒎥��
!��EO�+K�ȚHVC�.�ޅ������3V2���#P֓��G3��؜�-��~+m�_�3滅&��H)u�I����
�K��ŧ���Dr��v3p�o�;w)�D=:�dt&������W���	�#!aV0�̗�A%�H��B�����U��(�Dx��Q��a�}X��?��έ�n�̝�un�u}R&����o0��/?�k���=�
���舷0�;�,
�9��\ɘ	j�"���$���}��g�5f���tID�F�n��$�R�c��nf��h󦇄��>�| s���,s�9�,�~:��d�������=�R)���JY��N��(u�܎�� E��6�$��$�9�id���ul����$���jP�A4i��j�4��c�S;'�9�cAp�gʘH-1*eJe����(�%�̐`ȫvA�0ph����룆A%�n-�ׯU��`hW׮n|��}�����j��I9e?Z��򮣜2i��iM��h�����{B�띘fR!Ԉ����j���~�\ꆓ�0�-w�2����d;��`W|�'#��~ 	s��`~>7� pXv�R<�'��.@j`=k���G\j�=�c����ڲ��l�׶>�� �خ>���v~��;0)Ha|�>n	���.ܸ[��c���s��A��#I2�c�O����W[��T����'_���0��>\�>��G���}�C0�\��^����^E����ϯP�2�x<�>������d��a�g�⊸��� ��Y1��""�9��u���<�hJwQv�Ssq����.�Y=y>OL����-�.��c�� �Z^�/�o�ܲ���X���s4ܣp�C��[�ӡ8��g�#��	)�#Pެ�65�  7�)�C
���|Ņ�
�]./�)$�ڀۃ���+�W�N<T^3`	B&�@!
h��s	�ux̙
�9�J���+�$�z��a�d�	%P�ӏ �%�/�aӣ��5�]�M�4)�'��7��==DZLO�%ԚC]G��;	��H����H�p�N���M�ZF���lF��l�����۽4�#zs4�s��c�?(���A��D�-!��:r��IH�=M��hM��y�9�+3����At��q�ݭ�n��.$o)�� ��V��PlM��D�����u=��k�,.�U��GYsg���̵ө~�汘�*i�G"]�r��">��ӕl��+�[$ĩK(�B���
)�1�P%�C����Q��7�Kh�Ef������^��Y�~ ����e���v6s:M�Ke������x�o��E�?Yr���k(M]!�R��z��4+�iH}�w�m��O��>E�D�m{�L�j�_����dd�p�@o�B�n���Kl�i]��/�=N���9y�2�+����S�b�,D6����'�:OR�AdY��ox��w���X��0���l��-�3%Ꞩ������s���D����)wؿ���ƞ��=;�3����)��G�;ե���Nڇ�(�+� N�(z��6/~�XQ;n0��B�Vf��+�9�O�U��Wx�����u0���qI�G��h��ߧ�l��İRטnr��6���Ȳ� ���
�����Hl1��=	�K�Ҽ�$ 3�;��!�^��[7\A��!<�33�?��a��<^U�١r�-&��\��tE�!E-Og�9U0^�e����擋<�����f���"^G����u&��o|(3y�g��(˕���ܺ?F�?�)A5�x>[�`�(����-FpD���Q3�b�	}��&f�C{*�^�))�����h���sa[���r�/R*+��Hg'&�*Cvz�>j&&dC�V۔r�ye��'͸�2qY�!�)W�k臞���2�?u6��X��zd�w�������H�`��Xć"FZ��������jB����<�D�>9���O,3���CК{���U�<]
��s�p=� ���#���q�'�I��Z���@�c?��Q?�%�ɡ����O2��Y��i��3��~�a
����C܃e�%c_iZ��~qI��B���ٴ@N�V�4c�b����c�>:6�"�9|e�_[����^_�W~d�8�ߣF����Z��1�<R��G�n�����X��B}�>|�����uޛ�oD�{��@��߮Q�lT��r��^��Hn��OD,�Y7>^�2+��i�ʌ&aѕ����GA/Ƨ� �ƺ�Z���.�e�@�@�����4QE](�'�tT?;K��ta~�d���x�jc�xVe���(��Yl:�g~���Qf��2tFPbx����ׇ�X�����B�������V�����i�����?��t�FF=�Cn������}M̥���5,e[��h�0���4{:��f!7����#?)g�M���Ia��
�� �óɟ'�{H*��py͖ހ�<�=��VRRW����c�sY(712�By��K���_�q�Ks͎}�a�b�^J?�<1 ����<���B@�	���Ņ�+͕N�N�`G�(�*r2��Lͥ&fJ��l��B���G�̽�r���It܅r���Ņ	��f=��_�NY�V������~��LN����Єd���$�����/ȓa�Wy��+3_)��,|�G��l��?�{�AǤ�%�M�d>�߸�B����N�����.�K�������Z(;�b/ز\C�Y���k��$�KVq�c��a�eO�V]��g��e�ay*Y�}p�v�b��#��J*�2B�;��{j7�������O�r��Tl��?�~~����L�!����"���lU݆[������(z�գ��o�_��������B��(^�(�>��(^� ƣH9����͋;6�^�� �ů��p�b^�ؑ�\m�ࢋ���_}���|��7[��@�b���C�dYR�w��9��fՏ����.~,TD'���D7������$CesJ� ���
YЅTT7��x�@J�}	�MX��x�����$���T�.H����!BG���F��/����� hWh�D�Y�q�TZ;' xhX����=��!�(I�ԋw�U<���[m4��羔%���y��J0ܵ^%1���|�Ӑ;r�BvM��	Z^�	����ߋ��Xl�!dmSn%P�"`���?����b�"֌eX8;y���}�s�,�zv�&�-�Wsav8��/	pqKE�Ѹ���
�:�wsX��Woy<����JGdtx��t[{�eyR�M�|2�*,�`^�ڼ�R� �0/��1R u�����ֿ������2�i{&$vP����˽B&앩J�E_�%�6��;�Ӽ�y�ʚ~���s�$�3�_ԯ��4�aѫ��k��O�ڏ�5���:���}�\�;�_� E�;w X(�h��x5�;$ǚ!�;��P�4|r4��z��+���@��@ä́V�AE|Ϡ����F��˦Nά��q�q&��@/C�3�+����N�/�X���:�wB#��qJ0�O	"��_��&;&��.}x\�G��}[�`j�D,-;Hg�=f� �9�:M@P��rf��ܑ�xE�78|����!+����hF-�Ȕ������>�$��OL� m���ڟD[���������=��fx#i��|H�;�����ڍ�Kס ģ�Ww$���X��0���KV?ٸq�{]���ׯ�������/�v=��e�*m<���]�O>Ş��������~F?Ѯu��N��'w��yrG�ܑ'w��yr?m���U7r��M�ٻ��Z����:���\٥Z�X�x��<���3o��S�\�M=�#��ȱ:r���#���:VUEC���X4%�c��&��X������i�jM��ȧ:�|�#��ȧ�{ʪWK�S�}>�ޝ�.�j��v�O��t�O��������N.��y�	*]�b����V��m�I~�x�!��(dv�{cC��v ���>�����d^�e^Qf#��]�j֔=WN���sT�%>$���<��I�/̰����b??�xp)&��_��Dr	l�d�"��+E��!�E���NN��_���Ρ�#��a���!�&w�5~V:�XƑMD±�^�l�+�=��]x���������-�f� �0���������|�0�^�c� u�	5(�0�jߢ.)<�g�K�y�{"���{�0�����#� dO��Ǔ����~�����R�37�p�y�!�C�rNF����7u�s<�������Y'�QTA��I�(��ZPw�;e���slԋ�H�����ܧ�G-�u��T.�\��i����������.+l(���`G&�V�A��1����R�/��Q�J2���1�6�@+$����'Gyi�Q����ߤwA�m�Y����8S�q�p��])�	�K~$O6~�/��l#v�R1���?��`��x3?9�.e���-NfS�L%w*�έ���\�#���u �🣁�U������\&���L2�FON�S�L>3�)LfK{�wL�8�Wzna�,�MI����gS	7D��q�0���@d���q�З2ϑ+p�b0.,%�x��7��21���1���ےNĹ�����^0Ha*��[3g�n��a�'����ߋ^j��r�g55YL�VN`|͚��2=�iKM�No�c��QZ���UrN�Pb)���8��11O7�*u�7�l����e;DX{�"�����a#��j��Ο��㙂���/;'�M(��KPW���{*C�9^H�7a�g�lE�DV�?Xۆ�بɰ��>�S��a�k������Ĩ�YݎJI��l����v$ܒ��/QSP:B�O��~�����0�`[�?�f#w��`d���Q���^Җah��Fx��~i�0�z$i�.ݜ\o�3��M g �X���5Z�� ����7�������OC
�[�*�����uR7�x�s��<;�{��J�B��/�1��RV�b���j�H�.vv3�˘c.�G�����E�{0�٤�0�t�\����A�������?(�K��hxWM�t.��X���Tq�n�2��Ə�d�e��E"�"z��!��̱=K�-:�Ԉ��(=�`kH���Z�Pf3��-)E����UIJ�@T����eH�K�}�����7^=�,�7���Vcyג4D/�
��0�������m�)��k^^�^�H��R��W�V������N��)2���] k�/�)rh�[����5 ��pπty�dy��#h"��3��|z2WJY��r)���R6N����UhE���@�,�M��u8�G���:��%�
7d&�;�9����==̭����K9Lv����(�������nR�������3ޭ9�?����`z��핛�'�:��Ճ�7�ݟ7���	#}�RJ�f*3���%�Q��x��L�OZ�ق&>Yb�Wg:>��tS㝱�J��w�ZJ����=��>��pXzC����/��b�Oo}���Ox��:Q�y��* ���[����?k׾�\�`38��PE{�:.�7N�eW�_h�C�~��eh�?C[|����*߆n�oh��C�~���;t��^��m�Mʛ���6?��Bx�!������׈��G��E�=n��zfw	�˄f�p�h�}��y�Q�Rh�s��n�
�kE�mr��f�Ww=W_Ǖҷ"�E��E~�|-v����q'���n���E���È|1�;��N����X��n��]���n���[��]� ������<~.���:�v�su(ze�O�_v�5HW\��.ݗm���3�����Ğ�{��� t��r��e�~����k޸�Y��u{�J���������}�~��3r�W�#�Hm���� n��H	v��W�0��Ǣ%<���x�C��ł�ϙ���7�..�R:AN/��ڶ�;��pDť�XCѮu�p�.�j8�T�d�lS��n�⢖q	U�����3D3Q�cb�o��j�v��= ��E�Hh�̻�V&ƽ����x:�����a����$����j���R0��/������i�7�ӿΜ��E�u����期M�<1�h�(NT�hgW*�Gl	Qbhw2j[q�;,�;b~¬Z�S$)T o��QT�(�tU:�*��ґ\s������]�7l�&<oê��z�9��Oy��dC�$��Z�����O�<y�ݣK�ߖ�L�r�WhR�7<��;t���X7Uk2{]��j���<�j���Up��	5]�H���c����=��S�P�xǽWn�
P��tk(�,a+Ay�0t5���z.�n�T�
��ZQ)����T����wz�|H�e�����>��&��Z��L{��Hk_$���j�>���n���:�Z�8B�i'x*?�P�J�m;�(Ei� y�;<��:��������=�Ռj�=��Wk�t�����UYk�:Ui-�V4s�����و�Ƭ?Ո6#�f�5�!S��y:^��-�^貍�!�5������Ѥ����؈�E�8,BVz��F�7�}=�I���p��`��v-�.��N�Ka˶׾�wE��ō��	�Į\���h�ֲ}뮽���}sϾ�Y�Q��Mbc'�ym��q�����U��򫇎?g8�9T~ul,�o�����K��=Z����=�ׯ�N��Gl-_~�(;&��!1dPS*�NE�SC�5"�:�`��<���P�*JS�q����sQ-��~�m���23{M̲)XgZkV�M"%��Vd�7!#Y�웼D����%���z�����ӯ�	�����sLh�!�7�wP��o����fP�y2(I-r' ���x<��k0�1[,��J٩��qnHuT,ȲP��_�R�ŹT�%`��?�RUJ{�Qb峅��z)����7<�~��JO�R���R�s/�X�={�ox07�H9���/"נ�Xb`	>r�m�ܒ�GӑH8 �,N�u���%«��3�9��!����ē�g~>��4nZ�՝�O�p��fA1�}�~[!����E�v���s����\Qz���c_��'E�	�v�פY�����a��EazQ�^�����d����0���s��qXQ��n��۽au��x�+w�x9MԘ����Dj�Y��bw4<,����梨�(j.��kmԜP�E����ͅT�(�Te��O��1f( �	�okY̜�JF.��E�rQ�W.��p9�����;\λ[�.�k+���2o
gf(�m!w2h|C�~���uw�U��Ҫ[��)A��#��J�M���"#�z����di��%x6c'G��G��8��e�pq��mtq��/_�x�����ޑe�C9V���D>��n%��U��,����0�����̗��\a���������ʪ븻���I�byF����s��?�:V��|��b�6����N���`kt��M��;[pB�L*V
��'2y�)L�Z����Ħ~���ŃK1���z~&�K�F�Zu"])��/ļ�S�Z����_�Ȯn�G���3T���2�N���5~V���qI?O5����tU�\������Rr++$�Y�Euٶ*���M�}�IA%�eؘ �F�J|g��T�CS�x�ÁNā��q�ڋD����f�R�)2w���	���.\�խ��uk4�Q�D?ѹ�	��VH2Ed ?��̒g ��;U�&%Hq��D! Qȶ���� WM:�8�aI�X�
��OEvr	r�w٭:N�<�Yu*�-�Ƀ���AǃGh�PM��_1�7:{<_ʥ$�H��?�-�r�?���DS�r%V�ˊ�s�R6�9�d��K��$΄)ŗPZ�07z��K�.O/����2L�{������py����@�E��@]��)æֹBi�B�G$�ہ���E�ذ�8r`x���ݽ�8DT�oWXU��y�F���k���x=^�.p�u]�i�;�PD����d[��;�ѱL�ͺ��*��^�y`���-�ȯ�=�o�����k�����N���4�=�C�vi-,(R+Dj�H��"�BH�+i.�������j��n�j�ٓ��5>�����R1t�;Wŀ^�b%C3Au�T2���$XI*a�*�/ڔ�+�.�e�D���G���@��qI����o[!ȫ�"��'pI�٥�]�u��� ���Y|�Y�����@�{��W���&G���L��T_@S]�t�r
��R9�H>F{����$�͗�{E����`��>FZ�	3xd$9"Zm���~R�w����@CZm�G�44����yŧ��'���-\�����w"�4��~<O�F�?��?�[K	��ց�4����n+��}�Vq�¨�Fx;T��uҏE����[�K�~�q�L�L"��`��ܗ�u'$�+���)L�A���#K}B�'knW��������7*p�n��8|�G�Cz��@O�D_&چk�ڤ����ki�>���C!e��B,{�I�&����RZ��Ф�q�cc�E�y[j&7Yw�)�a�	o�.�Yxc��On�{�����5HҰ��c����؏Y��,��h� ���
Y8gOa����q�!�ƲM��KY�ȹ�ح�R�z�#���s�.̙���H��ypc�6�U�l(Z�l�f!�O<YEʚD,5���f�!����#(6�_f�*3����fN��I��$%E�@g���D
h����(���"��?��[��7�>7� p��������K��&-��a�r@����H��sYg��O�r$3A�0�W�AO��F󴘟T���P�=iNv���&��-�IoD�}�'�^���\���I��YR�������A|��[�J0-�
I	�{�іF�(H��%�v��V��4Ə����la>:�ԁ��/�M�����F"e9���-�~�q���m�LY��M�d�y��LQ�E�w _N�Q��cb `�9�-�P%�$.ҏ�'�����|en�B>HHLS�c��b����	�?LJ"�Iχr}�ب�Y&R�X�/��I�ˤ���&���FfY	W<�L�^歒�V�9�7�D�p�<l�r�����u���������!����6n�{B���K����K��,�:3�������f�����mumy�ƪ\�?��a�Mu��wf�p�vq���w7�o�%q�k����'7�?��=�\��7�y������5U@&�7H�-J���*���v�&t.h���R�������:¾Q��۽� �Z�C�/�G�C�g����W��J͐`�@�`�x�>��W�ӎ�?Cw.��T��d�R)�b�t%e-,,-;)��\Ҵ������cD�wk70`�ނ.���O����4��n<�MYz���#^4��E��ڟ�V��ףK��O��&2�F�=�<��D��U�X$���x"v��Wנcoy.]°��R�2_*��i4!�2�#�� p]��	���YқH������?�)d���2�X]���j8�MyCxq�c>7�6[�����:�M��Mf*Y�HB�r%S��$=�PWR��M�ab�4�o����)�&�oayz����0ћ�w3gʕl)�I��)LZ��w�}��Gy�Y��#"���ɋ|*D��*gP�(�3v��A�s�qR4�`D���s�,]�P�x��ir�7^�ɰh��ڭ�\��G���j�Z������6�\<g���c|��������|Ʈ��'���[Ht���[>��(�m(����6��Ϊk�b�2v�KZWзK��/8�5��KNr!>�����Ѩ><���,GTׯ�w>r���#�k=j7/V��mD�!���Dچ��0��0�g$A��&}����F9�h��;���l	d0��l~�^�Uf`�s���=� ��N����Ca{0<��O%�}>�R���߇B��A��}]�H��E	I#�H$��KVټ�7����E�2�Ġ�T�'	K�<�����(i���i�.���P�g��R�H2�V3s�6�/�����֮~Q][�����;��=��+?;|`?�4^�Hz��Mַ��a\	�P{���b�p�U��@� V�p>iF����Hj���Hj�>��i�&�@ҕb�� �-8R,�̀ϼշwb��G�ׅ��4�~�O�h��x������b�����x)�'�{���b��g,�S�CE�R��cBb��U�E����Ty̙V����\|2{�O	FD��H߿�%�5�v��	�����r9�hʚ��X�g��9[�D�N#�)�$����V�$�7A/#��S��<U��=Tj�=%�0~�����l�J�\ߏXM]3�E-f0>�w�O�!1R��و�=V=^E����T����"��+���2n�ҨGP0Vz�`>�B�4���WϕLe���Xn']�3����������e������[-��k�l]\�[zFR�l@��'s�L%������n�w��M?	�x�ܚ�]#��G?鸴O[��mG��#��(���H=>�x
�C!)��~z�Y���ϻO�JxI2���w����^����y"��-|��}���??���M��y���RW�r������)E����������4�W��w�Ƌ�-W�߫����j]�ՙ\��ڨ�Y�@�Jۺ�����S������1|+�+Wj�/Q�:������S�L	c�i]\�W����ܸ��i������W6����|��� ���S��
� Au�:�?��W�ϻ����v���`2�]1����S4�ԩl	��`�g�~P��`���U���:�8���p�5Ñ=�h�8�`���^�^�@�.�vkپ~�6ǽcYm6S!7x��./��#�G�
7�v����dT�����j�������u�"�G�A���!R�dO�:�I�΃���g��T�Ç9⾗�NҒyV�x�D�Ic���D�y��Z:6��֢�"�Q����n���-w��H̱���@�
  