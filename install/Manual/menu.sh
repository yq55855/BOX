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
�+\�eX_without_comments.sh �=ksG���+:S"�0��l���f��[�Kg�n��U���< i��61�rB0f78!l��6H�yVݿr5��)�~��<$��6�1{��������y��65�=����)k%M���R�R�]�6V
m�Z��}Zo�%�y=7d�se�)��+Ϫ��n��9)R�i���v�)�+��GK�5Ě�N�"o�x�Z�1Ҫi�bA+��6��T�l�4H��H��φ�����V�ʪ��9 �!�HF5���t�
����'�ٓ7�7?^:�v�\����gj�]������۵��,���F�����F�4ʨ�]O%� }o*B�ಣ#ۃ�i#"	4Ŀ`�1���V����#�.Ex��.��ERp�/b��FQ�8gu���r�S`&��Q/�(!$$k��߃�!���e�$1Z�V$~}tfyb�>�>3kO��Hn�Q�BT���o��2D�(�����L��T62�i�G�T ��+�:�
S/��@�����Z9�]6�v�n��!kT��u��1d���|>mZ�Uq�ʉ\R�jP����VP�5��
�T�W�hYCtO�y=YX��d�P���rϮV�Q�"�G�W� �� 1j�3�kg�Յ������w�d��g�/����@��!n��2"s��^}X#�;B���#�'�.���84��!� LZ�Dt3��m�J���m�1��maz���m4p���^,U�V�M#�S#�X��uSF�8�gm���e��!<m���¥�����vո����o���YB!J�����?[� ��]&��e�Ord�;�0ډzxi?eT���y�@�ABbogo������#�y���vf�053/4�d3��R(���da���P�hQd��.�S�W�=���q���^�Y���Y���k�6��X_QB����D#�M�P�,LB� ������}��e�m���ܹ~��F~Sy@���|�-�&�yc�j��%�%�DDǔ��y�O��d��x�zH��t�H�&ĵ+B�-w%�lbq�T;3U}���������������i���% 8���k;}���5b4]�cm�_ �GR;y��ߤ��vm�Q)��Q�N)��B�����!]���hI�����Fpa�(�tD�&S���AI��3�fGJJ���{f����������n�%T�
zR+�WL	j�MW�RF���؞U0�H* 
��I{n��������N @�'���-OL�N'�F������]�+�� P�q�B �x �	��ӀWАe��nE)�#�$���С�Q-�)(���Tpo{uE/���wIt�0�L��~���6�+�<����Iw��0�MSt0+���h5R4�j�������J�"�j���e��D�x�������*��@�����G-���@�dsL*Ӗ�sM%��� �i75b������dMI١��(���(N��A� ����߽���ᡕ�0������)PK����`�9�����eK�Ц�YChCjY�XZ9%�%��LȺf�%#$ٕ��C�I�ZyS.�ʣ�n�F�ʒ����c�uS�b�W"�\>`G�����+.��H��{�s�������� ��6E}>i���%�InC	�R�W����X��bEr�� HV:�� vڑp\���ޣ�?�fY�w fu	��(���k�>>ܣ1%z.K��+aB��F��RE�H�";ǣ�"���I�wtDc��$�2�ì���(��W��(mXC�O�L�"rBB	Ϫ��(�u��JQ��BW&ɸK�!�(!���1��Q3Va����l`ҖV �gii,���V��:�d��U��N������2�2]����_OOz��=P�׆5�O�GC.�n���.�m%�V�8�1Ԓj�#Fya�Cj�1��a2mjD �ߚ ap!L��(� �L�k9�+��M9���4epow�T����Q|M��u�	c��T�"Qq�
ٺŤlɂq%6`w�{7Ϛ� Q�C�b@߶K�y�7i�Q�*��X���֒��^I����J��LtȪcU�`2�A��8Ҫ��\�X3�TJD��՜��E��b'�{��ǢA?O0�vJڮ��)���#�`��?{��(�]��uJ28/�P��f����SH�!�ߔ+�@	��`�O2ܛx�	��j�_����6�28 ��u��%����M����m;|kbeZ33jI�
#���fۢ��ۧ�گ������yP1�:����7���y���x�������P��Rh���ԑ���1�xX��aY6��3y05I��F��kT��/}�v)�tִ�zcߘ��6������.1R��o�z�}��jŌ�ղi�㍱I�;.cFVԡ?�Dj)Nr$ tJv�YɆRL\��o>mFB�3�L����J	��n�b�VB�O��W��ϐ;��&��4��8!n���3!��m|B�7�I�M��b+!^eB��B��o%�[	�VB��&�<�~�	�8�uH��s�NB�w�W�_؛o�]͒��Ȼ�tY���9v ��X)�vڭ_��|�Rl�θ�v�7#�f�_E��z�2��lG��4[�E�iv�\�d��R�\��mGx��<��A =�����{'�0Ϸ�-��Ȫ���4ȑC�U}X�`�#Hk��/�o�7�&�zcc�1�zK����ՍO��D}My:O� Q:b���j��'EA�9A:o����[�xV�)�����`]x��&��ٱ�`^���X��P�	��2����E����Dpqb=V'��s\��1��-M�6qa"��4[�؀�	��<�	q�&��%�o~:����V_Zk�*!uO��B_!��N/��TH߾�pg������է�jϣv��������˗��b�{����i���*WLZ';VFp�L���
�0���8*<�

c�*VPX�gxR��|"La�O)�ZY�&�� u����U�P� ��!K����:i��
�kͺo�eO�B^������}960E)�����	�Q
��P;�H����֬�ߩn��xV�q��g�!v�9�#��z�m�gl��-��R��Mt�m��m���u3=��u�����c���Gt�?)�?rH�Ͽ�&��Uy����v�������&;�#��m4�����,�񭅉��F�k8��"۝`S��o+����V���Jή6��tK�۰-n���@w^C��e��GQ�Z����(��7Ϻ%'����d1n��fl5o-� aR�`�M-R���[kN��Xά�+�q����	�Sv��K�}}��������x20V@"��QgH�u�p�|<�"����66-��6��sF�	����>���Y��8N��(�=Xs}x���kПC�7BX�D^5���lNxL7K���H����*�E9�]髼���C�vyb�c"q8�q�)l�J��ѳ�PjW"(94�	13q��{�p{|�$?C�L*�G�xN��v�Y��)�G�c�'�9�B��N©V��Չ}�[l����"���^�p��E���!�H	o֣��l��U��@�(ܘ�ixT��1H{�� ��a�_��u�Ҋi/���w��i�f0o�W򰢹�~yrz��=�´��buK��d�d'���љp.�$���͊�)���a _b����1�&l�"$�� �^���/�� �]�B�&g8�%�V�'�x_��zQ��h�\oH걛u�
��x4>�(��D~��7r��%<!D��)n�u��)�=i.)<*�]n�ŕ��$�\*;+��e�@U�9z�SB�jܧ}�G��7�lg�-?������V"����P�ka+��6#L\���Ї:Г>я�I�.����x�Þ_��_��)=oU�yY6�+O�j l ��m�O����uY-���D�&c1��HII��w���j�u�.��X�x{$y��Iٚ�.�`нld��Y~�ѕ��Jj!��YCar!�&R��1<�h�W���)�R�D�8!jZCd�ʃ�|�к�Q�^VhmA�J�X�٫xC�N��I�8�+���
���Ph�Ģ��ZH$����S7:�I��ս��Q��
�p5yk=#��a��;�8���QcjZ������/^7�5Y�`�Y�(7���OII;wv5��Hd1v��s�|����M��AǂzF#��
\W�>S��ܼ�Q���8�&ؖH(T��F��x=yX�k�z����s��hѲ����c����Ȼo���"�Ѳi��8mSx{�O���w �Ktu�&�_�z��U4+��%rVm<�l�oo��Cx�dlJ���co鑷�ۿ��)�����۲:�9�V.kyM5��9����MɲaX��o��}�B�T)eU����O��������o��[��T��ɥ+����/�?_��L��o^��x���.��|�^m�|�ɱ��$=�>q�~zl����d2�s���NW�V�e���Dr�}���?��.~m�LCv��(m��_��p��U��Y(��Oӱ��]��j��zc�(g�f�����R�4��@E�ge�4�����2R^0ͼT�7�0T�ۏ�>�c7�LF.�@��#�� �0Z������|*�q�L��bL��𮡇;V:�_>X�!-\Gƈ���N��O]��r��xK����^���C�����@����=G�n���"B*|J�b�,A����6�W�-{���=���Qy���������!V�pV'g�+���=B���:����>�W	
+��0�B%��Vn��>����dl�^<���Hh�G���?ZG�j��G��j��M
^�
@��DVƇv;V��*�˵2�m�ݻm���ڄd��xDIwΧ��Bu�6�c�w�;� �e���t�������~o?��>�Gm�g|��U�/Ӥ627?A�L)NI��3�;�xgb��X�vzVN���r��bHUU�GF�F9R;00ײ��Vi�@�Z��Y!��L�Y�ҵ���/9�j�3@-��9J����jjz��D��oj_�#�}1�����ᄹ�	Ɯ!F{�'�T���%�����&!��f�������6;��9E���9�4Z}�b�(�[c*��\��v��c{f���F��}{�8GT�kVԬ�\]�� &��.��_����1 d��_Ɯ%P������L��v��ݳ���k�����ҩ8r1��|bƞjG���J�Vިd�jY��?D��������7� �کS�������}��~4C��s����?�Y`�.@�pơ��z�sw�����g���O/c�Y\��<]:+T���W�;�b������NQ�A�����<�L�3w�r����U(�b��j_�f��8yk��-�zj'/�	��]h�������3�e����}y��d�>��=w̞;�ZR���8L� �Ic#�1�� `4(�'=�9�I���c���u�ܙ�����������t�8���^zx��]�]zr����P���O�0�	S��sh?���d_ 2%�5m	⋑���5���%\B���`�keha�+��j6��|dj�6w�6�-���=s����L}n��M��;#&���jC��O"]3<ti�>�jH������0o�|
�� ��t�ǥN3����������(�O|_�����k`{�.H]��ɸ�v��"@p>kT}�5����/첹�o���_�d���$H4���F3Z���ܫ��a_X�,��E��=��Y-�ɀdQ_���{��D+��%�����+k���	p�z)�M�����&d+�P
M��֓D���D���\�ξs�P�7��ޚ�'.�d�/�j��(���)>uˊ��dA���<�-����;��ԭ��te��0�7���W<�������R%�Y�f�GJV �`��@o����i<[����M��ܑ��?�^$~�X`�'ɣ� ���}���JdL�6��2�vrf��7Z�ջ��vd?���4'���?ٷ� a@��A4�@���[&I򆿻3噆,��~V�,��Mn���,d�oD
��Ҳ|�q�tӬh�C�|X;�׊9k �{���ԑ����RƏX�%��h�����C(j��l�&.a��,y$�W�٘G�q�J�cI&�,ɀ�dv��W��+c����ӧO���Օ�I�����ӧO�>�w���h�Δ'�%0�m�~���2D� �Y�d�3Y5�����ǡ$�8"��r�2Vg��2���،Gis��vC0� 2����(���7:�c0q�͌T=e03�2MOHS_�I�T:�VT��n�ff���!�RN��b����3�'T�W��s��ZQ'���/֗���¸,~���ڭGp��I����H_�>1V��I�T��m?*Ӆr�V�B��H��{�P�(��Vϟ�����#~6h����z��f���iG��$�	���؟9�6]�_�	I�t!:6U� /���Q,4�l*z������e��VscU=��"���=���3=5)$���{�k8KRAſ���S�G�fSǵ�x���$����}����Az2h]�'�pk�u�BmfZ�(''1B���섓��[F����u�
A	[P����g����	�B�����fy�&_�&����0�,*�߱ȶ݂w�&�]
�W ��?	Щ�[�9q;D�He�&��^�ʹQ�A�>�ږ�g�W��w�͈��#?IZ�1�Py��z_��"������F��AxD
��0�Β�Uܴ��N�*:w�i��wQE�a-�&t�oz"I�	?t|�� �D��s��7R���W#5�]���z�͏��݀��
�|���ۿ��h'_w�x�D���):����>TA��v?c,Sg$R5�4�G���LC�>��j�F��\�{�8I^`�u�nV���צ��K���ah���Y?YXÒ�o�9n�֯a0d�,�7k<����^�f{������/o�V��z�h.�R�0?��ಋR#�	�ǚ�&5��_���	ꪥ�y��p/�KW��fw{���9�D"I�ָ|f�X8ya4״��~"s'�M�I��ޞȲ�P�דߤa���Qj������Vj�S�t�T#��HW/��u��9�5~���1a<��O�K���r-?]Ŀ����*&�+��Q�Q��ܪ~	�S�TL�������T�����Y0���l��8�5�xyL�����?�构?�Z6ǟ�|L��o9G�je��h�2f���P;R+#�(�*����q�M�(s��T!Zv��O\�hċ�/�q�JJ�� Y+G��5׫3n$&s�}�;6���hۄ��Kv��$�+�5�
��Zq�x�(L6\�wKݝ<�hiF�6����X��+�����7���Y�C�d��e�����Q9�R	�=�Jpm(-��/���'�ZuICnZ�� ]$����Q�FDvU2��@���m�KMu{=u�����AD��f�|��B�~w����x�ա��3�`���z^oC�xU*>��7>�6L|���j���}ru��<��1+y}A~����P?�B�hB��z�=��"���i(�֊1%8'M'ƥ@�0�l<��>���;�3�x.���5�Jp-U��/�=��w�����؜>s�E��Ęd��צ���%:��sph`���N�'y�By�8}�P�*�i�Vo������-���(�q�yd����''E7b)0
Rb�'�R���Q��Z����z�Z��pH��*��e,YD�'�V(\���̜�q�Dy񶒯����K�/�+bo�X����F7�p�@{��w˶H�t;��j�S�.|OJ��ՠ��r�q���M�4ٍ���Iٍ��g>��ޡ�s٠��%u�w2D��0�_�^�Ǧ�Ӧ�����q�a�H���\��i�]�U8�6DK����;��֞ض��'�@�H�e�	�h�T^o�&@$��(Q��l
�Z��wmoD��0�*��$\Sw}�e;��u�6��J;�y��:�o�m�J�,�%U�� �l��F١��k��r���d���L���[HNe�fZy�1���*�O�y���B$��nz��*����0�2M�[.0j�]�%��jkvv�_CH>�6[~[-Ti�+�+����$�tP0�8Y�T�q�⮎�-!H����K3/o(��K�R��3AY�r���v&����W��@DV���莩�'��(��>��U	�J����094�T������k�_�tػ6z���2��Y��ѹ�l.B���H1F�Q�xw��yNn{@��H�9�!�8ֈ���b��K��r2�G'1юVuSj:n�1�`��aj
i�R-Rv������z�z�=�Np�i|B��b�����r�d<R�3����}&���$ΚW�
��u��?��zܜ�i|�%���y��%I�k�)Wno��������/�>���.����d�{\C�[�ØB�
�"I^,�F7���r溅����bc��y�5�kn��=�u����%P�]i̢�P�]謏2��l�$�Kʽ��c)��\��
߲���j�L
o���n���>�Po��e�n��#��`�����&�&��H�K���G$+H�>��TW{pk�ٟ�ƃ�
&�*F� �s�%�A2�|�
 Cˆ��z����
^����s�$ͺ�2�r���L�L��'��ҁq��WD����wo�����.F��Ʉ��x���阂~(�/�ߧ���9�"� �Z���U����?��p�Ql� �|�vrD&�"6��g�1_�o7��.~� \��u��p=�K�o|�ǍϾ�������	8�K��Ki,�Y��q듵������+�����K�k�8�ފX��՘�I�?����T�^��5gO8���}}z�{l�18��6/7�s�����L���H�a�^�[�ybD1;D����v	�V�.�������# �E^$�k��jO'W�������N�ʵ0tռ|���͛d�l\������y�A��K��Ҙ]�4EZ�T��zOKyGnbv��q�l{��M U�sC�7�T�A�����h����9�	Y�T�s߮~� �+��4���$
6�5q�¼�I�[IA�
��@����xej�R�6׀m}�8�j�j�f���M4yҨb��lV48�#��_j�y�x��5sx�Mxl�"C���5��N��W�>*��la�<�D�K�5d�\���̑-d
b̰N����7����K�Rm��_�9KŦ��%z
7?�M���/�߄�̈́d �� f��`\�|��/��s ���I�Pp������o0��1�<Ԣcj��H�9�����Ŋ�q� ���Ab�ZZ��Lm#~9�΍�<:���t�6���=5(e��F�Q'��J�Tw��F�j%��D
���a�pǮi���w?>`~>�N���Y�D�N�T�6J�`���0�~FB-����,�?T?r�v����;[��@�h�yb��~sF|�m �y���Vx'@�� to>����	`3p�!w�' ��"��M��Q�t6�[�`�S[�/��Qx��-`��3Y,Bƶ�	��h:mwм~%�-��
-.k�U1�u��r����0�#�Gm�H�^��#�>�-���u'z�/E�J'��Vw1��[�y�g�wo^]r��ؗ�ɩ���^�½�j��?���ܴ�IS�{Ƹ#t���ps:��� C���e'���U`G����&�z��g_���ַ�K��q�s�={�;�_p��d���fj�7�Q9��i'ź�jG���~���6�D�V��jnJ�A�;��T��*~Ori��Y>�z�J�V�-]b"�G5bD]�����#�mx']WS�Y߾p�z���G"I��r����f�+��h���B:>�"��6HZg*Z^�-�e���r撎��%�+-`1��nA,/��o�D>�s1���₵�6��7/|�sʯL�Qh���X>��x�ЎQ���^Ε̃��2+�?M������Օ3��a"�{��s�2�7!&6;�zo���8�ظ��ޯ�\_]���t����k�a�bc����([)�#Хy��G�>lʀ��Á��W�&K�s����bH����t�o�de��W5��t"����A)�V�G���W�i��I��_}���!ZF@l�c�a��`�p�Qn�ן8'�L�+�V��r!l�^����ӊ�� ��WN�O�8Ρ����k��'�
|��E�?V�D�8K�3p��$7�!guާ��vo�l%?0��`:��R]l��Vf3\�mL�*X�l�:�6��d�^�ct飵�<��!{:�bKӴ ����0��=�<�0��c�]�Զ��@�k���\��>Ն�0 *�0�U��d�b�R0S�����e�=4�23�oo�Ѷ�% o+�����*@$��e�+ɂ��Ȯ]�$yR�l���a��o{�Uo���G���$�p{ȗFc�Xl���`c�.�P]��U���MQjz��#��Q��R����=;j�~�z�j��ܣ"�G�B��j�E�n����[�5Y'C�wo��B��
ַ~����ZG�m�\M��&���2�t�I�1��7�K��UJV:�^}����;��64���e;�0�|C�I�K���J��)uN/�$12/k��d�p���g�흥ɵ�l�:ц�Srn٦g����x�;���*��Dt��4o�ڱ�De�V�m-��D�i��bΐҌ�^����̿��u���Z;�B�?�|�D�b�q��3v��b�y����t��dW^��|f����|��"y3} �6���DeJ��1�@-���9�{oj+��D�� �&�]@	1Dk#)@m�E2�2F���[9�o�g:��O������x��2YB��<�yΐ���ŉ#����
�^�H���ie�����o������o���(�C�|�d�f3�幎D#yJOR��C�N���4�]&\�`�5�#�<����I���;zMh{?p���*���;�i�Q��<Q�����9S�a�cζgC��m9��� g����Ca����g�!��m��ڰ�m�]��͎��Z�G�,��do����	S�����7��{�s_���c�a\��R��sO�^��(���CCJC���o��z��:���6}��]����6�.�-][{�L����׋���y=_�d���6����эՕ?�}�#�|�����:��Z�qzfN� uF���=�?@�*����,�n&_��6�Z��V�xf�[t
�9K�&I5���X%�fɬV2k�4�jy�XJ��2^EƎ�+�D�lT���5hd$ᠨHi��@gL@ft��1�������k�^TGI��|wUd��;���Ϫ	�X��@3!a��9�*'Wt׬ҍ�g u����?Q^�1����P���W^>�hW��ƃE���������yi�Ec�=�����_n\\�K��ȁe�;885B�Ӹ�.�ύ�+4��]��9�a�b	l!���{:����+��`���ך�����(�h���͍4�Qq��tЉ��3j I�y���{��	�>������<c[e�dD�{+�<�����B��M�:�X�ؼz7� n�/�w��5k���Y3{�?}�v}œ��1�w�9o�9������������+�q�Yo��pG�c|7�&g.ѿ���d`c*�Ǌ�E���CaBz":PRq>��Ht+Wz�TI��M�'�H�ЃE�*�ɞ����F0�m2	3lN���R�%R��6;R�ש ^���Ê.Wg�e���Y��������:��9�sб�}(m�L|pn!�w���yLeea�@�H�#�Ԟç2#�����1*k�
L���Q�^Zz��s�<+_oO"ʞ�5&��ާ��
�������H��\2ÃLr�Y�d�\�b7�ff���Oc�����)a�R�����$kU��+Q ���
��аh�mb
H7��g���_L\X�W=�����i�r��7�1M녫t��"��
?k�
"V/,�i|w��������HK�Sv�ʓ�'@��Z 