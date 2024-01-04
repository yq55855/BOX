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
��ǖea.sh �=kSG�����l!ci$��	X{7q�-�M�+$�[D5H�-i�p0�H0�ư�Nb�7���86?��_Y������L�C<!	$����ӧO���t��'�hy�G1��jAU�TZ/��d�h
�g�b2ܥv�sᆬ��o����YR��'(�(�3N��Z���M� ��{$��H�!��J%-�R��}c�A�f<%=�����OͫE�TS���A�~���A���s�O?�ƾ��yo�����L�ڼ��˕�_/��[o�|����ʅ�V$!�Ri߫Qc��L�!�X2D��eSS$҆2:��x�00�0��������=sS�)�(�x��.��E���/b�2z^�c�hF!��Mq�R`}���N$QBH(���⨻��j��LM��HbT&T-/<�������u�Quz֚��?��KN�!�Dqr�f=]�UO���V#5#�S�/�
-ߗ��B|C�n�Ŕ�肋H�e����S������%ڋx�`�E�>-?�gA��^�a�Ϻ�A��O�|I��qN^+����>g0��I��%b#�N�U����E�V 
T榫�.�F���my��oA��҇��n���SJ��~-��Y*"� �Ft� �?��)J%<M�X��!!�H�H�-_(��N�՞2��x�β)��Q�	�̌wJح6	��!|TWtjpȚ��t ��/�C�E)@�6nR~�Zc�6�2Ո�(C��#�H���D)��k$)���9J+4,8e#���7{��W���9w���׺�����T�_ w��0�]��э�z �b�ѣq��{y�(�6��z~�jWy+y=�qJ8�����k��5prI���C�n�ԩ�(Jt��*"��[`�
��:�찷ǛΣ�XC`o�ry���T�`z��곫֍��K�]��b �pB}���*\���+S����h��z����|��������;��tc�:V�m���KBKoC�ω�h�c��T
�%t�U��&��rSn�%E�(mn�Ԃٔ��ɚ=:��B�)��~�b&�(�QP@?�(�"�PP��Dd�p���;�I���^z������/�0Z��kۇ����k�u0R]���S�p��d�r�X.b�
h� ���ۭ�1`sp��we����O�ss�� #+�@O��NV.}#q���)�z	�4Gps .�H.E9������iW��z�W닝6�<b����>x���f�h��2���ԃ-+T3ռ	�sr�w�0,�WY˃��f�׈����HΨr��͢�?L��rH����^{��.��[�'�Y,]�*���c!�����؉��.o�����G���8�GA*�>���1$#�cL�2�>�.�j�^P�Ii6����"�l5*�OaY��=`}3�$���IodT�@����>pPT?���� x���η�n�=�Cm I�����*P
��*��mǁ� =�4x]f�|9���3�t�RTҦZLJp	�7ǣ�j�Fz�l�%~�i��>�2�F�X(E4CөysM�Mf0�8�f�K��X���Zh�1��bc����	P���Z9��5�a[7�O�Lr��t�X��O��O"�B���:�$	�T�P2Iguwc7K��/�B 8�	F�)� `�!F�]��C��
����A�{$�˅k�.>ܣa%Z.��x�RϠ�+a)�����D�##a� �O�Ż����ƂGE����Gۉ�!	Q���p��\0E�/�q�\i=lKl_���;%�)c��F]�B��O�וǣ5�"h�+�e�4�")Ś5���dxh*�J��ߨ�sX�r���O3ܪ�'�po�hR'��WOtt���|��g���G���@p{	 3��+9u-�fQ?��1Ԃb�z����~%�z�A�j �U5 G�\t]�R-p7���q���I{�]�L緳�ng��;��I��� �Qs=渖��ky��in�z���ro�v�2f]tg*�A��[���x(�%P�'����,�t�\��U�W�Q����%�%�Pm5�S܌ݰZ�� 8��DE�m�6��A�%V͡���c��{ �9,Ej"�[E�E�v�P`� ��!��C���#���ş�� ���_���ή`���,�8���:�D`.2yտ�pZzLvE���]NP�P�n������Z�n��gb8H��z)�,��`9��S'�ph0,B���"T��{���0�i��f��yb5a�Æ��%얻��}a?T&�V�;��v�ןt��ēmE].���r�\�z��#J�-�sS�{���#��?�0��`�i�Y��i��DA]���f�"�3�ն���'#�R�p��1p>�j��<�Ľr_rD���Sʟ�c�@ͧ���Iy](�9>��9=��jО���u"����9&9ӆ@��z�3^
���q;���q;NM��<c�#q���jq�]�~q�r/n�v���Y����6#:q���^��ۍ�k����ힷ����= �?n�u�G��������b/n�`ܾ�L�����{q�^ܾ[��:�_������w�M�N��ם�X�Pk���Fl��+��Q���H�@�l���]�~9����0�W�0��@怵�|��fG's `��́���U�K�W�W�x ��`^ɂL����0d��%6�12KZz}`j���P�6�b�x�ئ��IJԆ��g��CmE�������d< �?���p+�ܝ;$��5��5�y�C=?��Ѓ��;(��(��`�:l
�3�\}F��M���ĭ����͌ۗ:�5�R�1�/_�����f
�S.{�?f�;��˷�~��!��|�����-"�ɶ�4����_��l�["��$!��[����Jp�z�'!�0RBn����74��{���/���������[���P���N��b�㹕Onw���xɺ}�}z��G�Mkl�>%�c|K�+�l!��dk�%�b��%1��I,	(�?���܁�Q�n[$��X�ut8�#��O��ܗ�k٧-ۦ�K�d�'�G��3����P���ΐ��Y��F?���(	Y�1�4>���5fӶf#��p}�b]�v�-X��_o�R��"o�pmd-%�ݢ��=.��3\{�k�p�.���A�5���H�︰޷��(�%���g�B~�}�2ِk��;���h��W������G6r�h	��i��5p6��o�1ZZ�]�&��a�J��^NQ�+���-H�9!
@�JP�O_#b��]5�^�ڐ��q��*1�(�\Ka��C�ek�,�	e�}+I�f�^=L���:e�0<��KPR�����޽[�%I��	�ջ'�t��(�4ʍ1���>��<����JD����_�;��J���o�X�`����.������G�_��J�c�X�YO�g�@����aP�2�����s%�]v����n�N+w��Ej��ݐ��~kQ�-�n�D���w �E�%4��]5C]J���N���!��tPr��}펺b��Ab=��Hunt�ճ�\>5�e����xm$����I���8���<}�sT'7���"���x3�#��`��ׄ�㐄��(P�лI�����l�(d�E��2nf�<C�y�7Wg��v�	o ��vD8��pv��>�Q�^F�K�Yd�z9�Tz*��<{X��Gb("Ub��hi�/(�^L�ڀ�*9k�`�X�$�$D!Pc��σr�}����7&�7Z\�0e��Y��ٻ�����f��.3����������x׺������6k��Vn��{�wU⎸���GW��}��w������2��M�N�����	��]m�p6�d�qM^ uv�rh�X��n`��66���� ��nj:]A��^ˈ
�Xx�;�1��jY�>���z�#R���+�b�o۬��Oaxx� }��)8�j>��Hj�X�ͽ�2�蜰felj��=��3߱��N���aӝ����s�WsܾL��W��؛�<U�M��K�
��e����`4F^��7���s��'X�I�я��T���_O
�NߋIxOX-��BM�3֟��޵PH�4�)z�,��@"~�%H���)����=��kq���G?�q:!,ņ9]���EsA+)ϬF�H?������;gM4���s��\��|v�1�zH�үEN��К����saYI�w'�i����SYT���a̸xf���RBb;c�L�X�q��@f^I�gA;ЯO�s�j'K����8{I�R����T"	|F�.V�|��mR_m(*Ƅ#���0�x!d	��.�Z��n���q.�
�����G�����r=H��ݎf"�	�k�'�H��G;�(�a��ɽ��垼k[}���O�����X�kޚ�ffU�+�V�m�+-\0T5��.���2H�����g�ӣ]/���t�HK I��1��@�����.f����rD�60V7�wY�*X�%ȦN%�ܦ=�R�UrL~P4��l~p�S���*.���8mh�u4���j��<8;z �-F
G�/	�����'����[Z:�X��w���yؾ��]G�1��/ɪJq�s!��w����5���,��j�@�M g%���W;��������2�:6!ZT�SC��	��b�����f��	��uo����?`�ֽ�+��''*���Sp�<[�z�-��$n��Q�>��ǫwƗo\[�2_����NYoU�](/=(/��W�A}�6�`��YT*dS��D8ބ[F�pnm�.Eg�Ƃ5�S��g՟�Y���$w�U��E�V�?X�~�2w���|yq���Fg�g������b1n:=���Z��ꃱ������ʿnV�aMOY��ڧ�X3s�?--/ݴf�@�5>E�v�-(�3Jy���$)�7J��7[����zJZ6U��ߓ�Z�ad�0�F�G��]�O����t:�^�>w�	�H�ZC�=3�b{����f��D�7d
g���XT�"*>�g���Hebƺx�R��$4�~\�O�-����O;DӠ���Rڒ>�kg�L�f��)Q��O�̓HB	��<V"}ǘ����ٯ(�B�p���|ə�FN�r�!�g�4)͌&�Et����f�Z�/_M��������Y�:k���K�����T3��sX=�H�t����Q|�����".W����{A���V�ᨥ%X�(��^�ɚ�'==���+��Z�Gˏ�Y����t��i�uƝ��҅%V�b����Oz�&�Wo݅��K�<��}q�jFթ�Ć���b�۞���)�Ԓ�H��=j,��L��B	)Z�u���3�u+s��o�f(��Qk�;<�ɩ�ǣկ��|>C�S�x��0Z�pr�y:B��nM̗��G ��1)� ��`�M�FL	�.�q{���� �v��(�9�V��O����W���g�Ū��V��+/�!͠by�"=��7w�=��Z�?Ť$����Ǭ�ɤ^�f�җ�K�q��iO���ʅik�1e�x��r��^ʼ�U�j��TX;�M4�)���5�V�xLv勇�El���Y��n0	��]�G�r{G�޼��#�?�0\�D�~�)&��E��W�iX^�i��P���ϫ�����Rxؘ�a A������Nu�)�	e7�+7�_ x
�����Q���W����@}:��Q ����kM�{�|�U��u���y��e0C�f��@1 :p`�'O�ǋli�}�29s��Xc~�Ҋv������Ol�/���.?��`(��9�]�V"�{�_�`D&+�.VF���Z�������QZW�4��#��%��<�����_���xү)���ws����Gس(˗�_�����+�Ϯ̎�/;����p���bַ���ɜ���3��\�$u�����'E��|xs�圀�7�������֍ϫO��'=� =�򉡴�����+W@� ��?~\��&�~�|ɚ�F��9��v������wA�+�//} bKm���CQQ�h�5tbI
�X��A��`����^y�b51;�N�B���l��^Λ�
I��]��lNe��)f�_ͤ
E�W�9z^J{�3�x��H<�׮�Zޏ*�3�%R���	xe	|}��A�?� �SY���ĭ8�W�ow��>���}�c+�m���Ҿ^V���e�=!����!�V����ϗ8]��<���ks[����r#�˒l�Il\
:�@���K��s-];Y�r�Ը�0$!���@x�hhӔ8ia
�~��|�/t���}�ݽ�J�e�I�ĒvϞ�={���������Õ��k�T@���/��@�/�b����9���X�\*�ݦXZ@�,ʊ�p�#��ܧ�'�ٟ(��J�g6<�Hΰ��V4"=�ɭ��,�H�B��I��=���Ht�����}��XA%%����/ ����o�5�I�u�\84>]�t!~%¡�B�|�֪C�;̶���6�����'G���#��Ⱦ0}�=dho�0���j}US��(���l`yI:���[�����zfyy��m��5|�R���54��Ҕ� ˬiG�yj�u�lD�u�;�+����+�3o�@Y�������r���p
QX��!HW�?��;R&�3����W(�D<�cD��,�bmFh5�+&JJ�HF���\���33s"9�e�I=�/�`1�麷 a;��[�ҋ�-.�*��ݶ=@���<�s�D�闼�e���8�� =�4�W�n�XG����RU�zC���lɂ�f#ܕ����cjlŖ���2ˉ(��I�l2u�ќG��gx0��� /��q����޾���uz�#�>�ґ�h�`�gaӦ�>���eV�$��J�O(j���a��Tۛ�*;���B8eR�RE�Iq�a�v��4���>θ(��L��!.f���7WTpڼ���u���$7��g�n^�ͭ �I��̴�t��`���[j?V��U|��eŗQ����!|U���ٖ{�Gc��Y���������Ru	��`���_4�f�4�"����PB�c��":p����ڄ�1�K@����M7�
m���TO&�H-6*I�+�3��ߛnC&t�"G��To[�o?��\<.�b��N�g������	&l�3NT�DݑV�}�&�̻�4Jc��0j�YL�{����L,nbr�8���֍������2p��-A�I�t49�QVe5��F��=�D�0���9����� ���$�]���Q����'�`Ֆ��^f�H��F��c�7%q�qa��ٛ4GN�&W���X��pu��[��鞚��[��.G�J;w�>���,T�[<&QزA���@2�Xh�}��e��}�����a�pJ~.lD�K�y�u������D�#m?������]n�_��=���3�X���Zￎ��N��������O���y���I�.��b�IRZ��{7��<�Ek[O��!"�����+F��q�E����Z�z��]��Z�����zu�E��(�ㆂ0|�m�$����?�V���@��WewLROH��!�c�Π�{���u��P:sg��	��������P$�٘yǟ�+�P�O� M�G��t6s�y���C0�Nlɦ�]��)X�ؙ�-�O��h'�W��i�4�Kz�Iukly�$:e��ЈL.Y.��FC�!x��ŝ�+A�{�!E�2Q� �hM��]�t��i#�0EB��N����G��I�|1CķS5Ȥ�P�3�V��RJ �U�؟ľ��;�F�w2%���y��.�b�����w���aL�a-9�::�a*���7�;�m	¶��޼��uC�����#KrZ��Z�՛u24�:1����W��$���2ƶ��}����x���6$��2����9��{�� ��I�k�$��eo/$uZQ�1�~s�1�#d�#C������e���tKpmW$�o�x;]Y����ː*/��d�T�܂+
sy
�T���ό�!�n����FՂ_�i��2�Sh96������U�R�W_�*�jW�D{�����*>e�<�}���K`"
O�Q:b�Z.�t���ϼ�~>���SB�`�Uxݑ:��5\��D [I ���|���R0���ְ���Yx��{Vb{����4���z��s���r�|�F��K��p�z�=��A���~4o\���X��X��V8��r !�+a<�¼�z7e��a V�!T��O%
_'�BC�Q����.�5s8���:m�#<���t.{��?`&�a�?�����������r�ZQ�\��ղ�!�%0%)�H�]�����G4c�M��A��z��;�ׅs��N�m�om{g���E��)�����(&/yy*��>.Z3AZ�� �{���?�@~$�,�H�Q;Z5G�ڷ����/��6�r�'�̶}mXm۷�a�l��`�m��hc-��`�DP־K;m�V�>	�jn��'r���^�&,/آ7��x.��ñ�(2(��B��2��8^lyyy$8����B��bp< ���O����h��a̲<'��P�ֱ�[.A�9�R$����s�p�$f�>�)�Hkʐc$�2L~��>��oּ	���%R NPq���P��jp��'OlwS6 XQ$���"j�;W���L��Qm%��%����Z:�7�f������!",��� c�y�xW(3�R��O� �pFlZ¨� �3�P.�}#���@���M39�NA�}��]��(y� ��<ၶW������;�n�B�Z?	e[���!VQ�s�B*+1%��Ѣ������TE��)����!v�� d1',�5T[�����{=82���1W��+�c~������i�ڇ�����AU�,���N�ʦ	�\A
�4J�.�:�Tjз�Q6'ٖ������5��q��[��SH�9ce0Z���4�s�'^9�ڄl��4$��^㇇bhe�x�+;t��6�!���AN�7�-��d<�ݍR��W7q�ox
��	�CwHS�o����)���}�`���QMľ�y�{Q����d�\%���^�!�����vn��`u�'c�K�Sfi)�� ��Z��é�\Tz.�	9Cl�Ii�� S j�����E��u-�G������T�0�1`N��>��n¯�B���ߣ_n}�rL�G������mL����L�@Nw[�x�H.��%'���Q'�2XS�O�OT�0�ճIN�Tq��yo��cK�L�0��j���z��s�2+��KԔ<�1���@��m���?��� >O�
/T����lJG�GWÌ&7��cm,��h
&��Z��KN�(��K>��!�|��R(������U*G�U#xQ�F �!)�C�X�Q�ch���!�{E��L"�v^�0��%	��3�=��hZ5�2h�s�y����w�7O7������໹y�b��[��n��=(�M��]6��)�)T� ��?:������c�?fӇ�>�
�]y� }.DE3��҈��k�:�C+bz&�ƌ�C���<�ajE�[W����V���K b:�l�t��h�Q��3�a/�~��T{��
���N�\g9!���ᄑ[�	����5���}��)��rI/%
���Z��Ar0ћ*���$����<	�Yz>!����J� ���a��؋Q��L��O�I�m��&3P!�0':=��U��\��J0v�~bgx
LP�Yu�\��qk%���|8'�f����REz�&Wb�_q���3���᧼Eg:�cQ)��c,#�u�
���� ���
2����%��Ѩ�V�^,�퉏���V�/2�|&�v�s_}���`6+J`��?�����Jm:�ZE���4�7��a�F�)�#�쯁Tv=|=)}���g=P��M��fz1p��pi878-���)X�)�e=y�	F�� FP��T��ݴ�S�z���'������9���)�]������}E�}E<�""��..�����T�;cdB���Wdu>�߄�D�UN2��vJ��e��2�}�W #jW,�k�vgS"�x�p/�!�Mz�S����9}�c��{����@qO���F�5�R,�}�j�]��φ8Fp��T���|5�M�R�����^�B��x8DK!mn|���dj�|,���"��{�T8�ze��[��3�����k�n^�r���Oxs%s�Q��N_���Z�N��~B��dC�?�@}���7��d�4H�?��j]�'zᅧ�� ��p$�ۮ0N��uԆ��%d�8w���*k���{��F���O��{i��1��g�n��U�/ ���1�X]��^����e�>�Q|���''�Q�ҭ�wz���^������XX���3�Ą!s�X� ���G��JU�JYG�g�� ��2�+7u�;'�/7��#e�Z4�l��:$�R�&Z�k���eGН�6Z����� X�sJ������(q�b ��6�ni}x{��M#��A����>haar��$���(�|�v��+�|n��~��>��ww�����_��ʲ���֚go�x���V�K��>�5~q����WCޓ���,a��z=�΍�r�ֻ��SQ����J�oQ��XnP���U�:<c���R��OM)�F��].a�q�������Z�̱AC�Jҙ�֢x�ׁ�s���d����M���L�`B��":�;��q@�@�wbq0Y`�o�" 䲆-գEb��`���X0��5!rl�1�v����v�J�=k��T� �uH�J�[��@��8�H|��(�h�w�&$�������  