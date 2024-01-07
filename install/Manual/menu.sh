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
��I�ea.sh �]{WǶ��OQ��ÈC�����H�+�搬xrW�ά�i�u��L��APy�D!Q5Ǩ''y)
�Z������W���]Տ��5�D议ڵk׮�w���z�>����O*zoMW6��'uը���?����	�΄��m��"Iʫ9U1�]�B�H4m��3~=W��4���:�2�$���v��}Q���zz�dO^9K��������i7�5���.��.�Ϯ-����/�X�U��I��Hm-�d��Qr9��e�^m Ib�P��.���k=�>5��Ȩ��BAK%I�Dm��fө�ԓ�O�PM��Q�&mB:'hkj�x�I��}k�Q��g��7���WoZc��fkf���5{����7����HQ/�L�J
�s(Bd��WZ��؂hO!"��̧�'��Pd�=��/��iy|�Nh������鑒��<�����H;���pYW���T���%����b�3[�A�l)={�.Q+E�$�O��e'I�z�\v˕�fT[Z��OIW��#�]1'�ќ��KC���@+�Q����j������ғ�_W�������lBZ7jG���ꇨu�"�W�8��]�Y$m@��%�Āf��2�L0
�����%s����	�k�n[�� yT���>O�j��xF`�+���z��ZZ՝�\>ۥ�zr k<tf��?�T3	]�< 9��Oj�nWq>ҳ�'�@*ۧhl"������N'uC1
.�v7����ւA�_ԧd
J�_�]��9(kvL9�*�������6�S�T���`���O۷AZN!������+]S춏�0��$�k��]�*ݾ>vm�[�][����'�R\�����+�9���¨d:�G�s����A��x:�K�p�s�0�|n�m�#-���6��]Ly�����_dp�(��?u�(c@'8��x���'v�UL�3oFk����������H��00B�:6T�B��}�� s�7�N��cHL�7o��5AXdc|ؚq9^4����-/[�֯����ԄX�f��L�`l"��tu�����Yvlz�w4��ó�a(�Rf�0�e]��䭮XC�\��*�RF��T$VR����X!�x�&� s������{�c�&��'ҕV��ݘ�G��DgXK�-�/`��3��]�`�G��a
'��x�ȅ��?
	,\-=���c>~�9�6��3�W�Y��$Lz�dDD�`��!�]�K
�1v����[#%���#8�&�3>t՛M��	3�?3'ͱ���W�O��3�@0QA�<.h�BMt�X�Ƞ�%�V�V
�<2�awCR���u���ן���e�n6}kn�;��+�������$��|�o�J,���N52��F�n�7��$4�@�YG�G�o�呣�['�n���obI��~;����N�)��{�E�qN��1oJl䒊-�a�E=�KCq��9�e�X-���3�mw�k�� ޼t���*�x�c���y~΁���ͧ#~�oNO��]5o|����� 4�ɠF�qd�!�/�)S__/']}��+P(�GnJ��Y_ہ`Yc3@��z�FZ��GYX;�GwA֖�в0��g�[��f���4�3s�5���|���Θ2��������!�����	sr��Fsq�yH��D�����W����L��y����x��:H�'����fk�<�ݝ���X�8%t�e��(��r]n�
�w��xSS,�f]BJ$Bkt�?�pO�锹��g��[��"@��	��2N�q���֊�{ڝ�t,S;膋a�vL{��;o�[�0�w��	e;�0�RBo3��r2	���lbmu��>�g�(��t��1��a��Y��Eia�@�F���	p������I|� ����
B���11o��n�q�N���8ޚ�����Z�>�`�#$���s��?<WkK�K��l�L��G=nC����[d9����hFo�$��f �'wu�뺌��q /k���i������l��)���)�Ө�S�8J���4�^[��*�pGܘ��q�w��D�vD���2a�m�����J��r�@C(UM�)�[)�ҫ;"R�����2��|8/-��xoّm�P�NoI\w�Jx�Dk�F����*	��p3IC��M6������_WƬ�OA��s����&�ە��|�aܙ�bR��H���((*KZ�$��)]��قAod���s��]Ͼ���Z��w�ߥN���C���IH ��XL�{h;f�9�pZ�����;e=��x�Hcm��k汹2���>�~qʚ�g��W��,�&{���e�����SC\S��x.�>���p���t�?1`��x>����t-���+e˻KAq�E���!rś���6�utT��f��cbe�6��۲�.��B� �Q�������`�����R_q�܇��CC9��x�$!��*��0����ǐ|��*������%�HP]E�v��C�T�@��1�qGv��1�h{��pA�A)^�%�C��}�K�� �-�9D�`A�@�?���JQ$�B92e����HCg]]4�=�\P�W~a�MnG����lXF�O�/N
X�B����I��X�P��P��'�i,�S�BF��@��8�ГcQ�a|�ב��гy�)���࿘;~毯=_[�0��`���*0�_'�i��߶���6�IC탰�P�x�'���QR��΅���%<�q�i�[�T��^�������O�H����<��Q�y�P4��3}`�k	 ��(}�FD�|����Ts���g�U���*�l���:Mئ�Hy-(��*��GB!�<�/���S�p��=!ԙpI0T_�[
���o��kR�c%,�"{�����ckb��/�݅i�;/;��e����� pJ6��B@��x����U�DP�--��8�c8� �}=�3+��3iҡsp�G�b�L���D�ڗ x�J��m���0�&�NLMF'#1�0��eg�A"�%�����Ƕj�bCd)vX��2n�"��ۊ�r��y� �݊ ���#�ϋ'�a�?��
J�j�^n^����T[�Y�p8��}	��1y}��ز��,�W�/�@U]��(����ܸ�<�:�n�~ɝ{psZ�x���٤S�O����/�y�6lu"�f��x7�S��S �e��{@]�aRջ����j���q:����`���qP����cJ�:91��ӣ�ܓ�ux|�o�;�\`<���k��S�pq��f�es^��Jk�R�nˇ�B�(�þ��-����n��pG�
|2�K�#;ṿ
��Ha�v)LJ��W\�����Ґ*+�&�g,4b���𨙮lJM%�1�����A��3}֭ٔAyF�C�W���x�Q�@>�T+��YNv�N�����"2�*��ܴ"c�a;�ȸ���+���Cd�|�Cd\�{���a*W"�Jl���Bq�̳�qg ����.�[�ec�!.nVv���WE\ƿٯb\�Cb�q_��;\�/��).SF{�L���n*�.�����2{��.�U\���l���<o\��
���F�o�r�H
�G����v��vL������� ~lvx�ݔAm�v�j#̪��I���gx.��3N���3.��g�a�3�+�H ��]-��_ ��c�q]D'@w�ajX��JT��;l����O�'S<����x�<��C84�A8�)w �E��aF?��0
����(i0o�B���)1)�#��um�L�H5�hgTL�ݲ�<P8?�f	���`�'�\���vb	�2��wc�DS�w�/hV�xH�<�㫐�;[�v��CR�Y���4��D�/3gbGTU�����!\�m6%�򴺯:��{�ZM���[Mɼ4��>�
�S�R�7����؋,����(����+��7x���l�kK?�W�WB��Ⱥ��5�����QA�;�vm���~�#��C���^�]�|��r�WŠ�G�G?�w�������!7��:fy��Gy��7<&�����=w��FTv�φ]rE��F��N�(��;�=c�f(��j�GwKO[�/��ġ� ���_6���2�IUj`��~�9�缯��w��#p�Ϳ���l��<�:�x����~+f�<(�B�;��O�1<�2��厏ql=z��:,�,�������Q�F}|ӣ�����m��]�w�D��?G�g��qK���(8BI���0|jk�R����X,p�3�������O���s$���=ڜ�FC��=E5�]?�f�p�"�
]k�3y.���X��ΐw�������yϵ�0�Uſ=�`��\�oص�o��6˟>d^\��-��r]ӓg��F�W����0���vkKO�O"@w�0_ܙғo�d��4��v���'��a������kJ����t�:�o�Tr��4�VC1#o	0nd�y�h.�R��;\�� Z�V���/��D3ij�����cF��Ȗ*�j¶yM�<��Y�9=�&9{��O���اm,b����!8�����(�^KQ�F�N���"�=\.�B����v���T�������O�+i����_>أN�ʵ���1�}��47&?����h�����;*ņ}ua�A�;�é�a0:zqc��S��`V�,VMÈ*�v�9��$�%4BDD�����i�@����b���#x3�e��4"�D)O�!�@�)l$Rq�2�	o�P�.����S)�v�~�l~u�;���P�i��Gj��Ҏ�?n����2���?=��0��0�!�SO8���nw��0�������B_&ٯ����цpF݃>]����n����4c%���&�V�6!�jh�I��X�E��!�$�LQJ�<��*+j{ !�rJ�E1?�l��v���<����Ո�Z���7.Y�=7\\�ڙ�����������9f֜�P\�������9ț�@Ms'w��')Yg���b_m�Ո�=����q)<�D�������e��q6�G����n
�,���	��vlӴc)!��e�YS6��HH~'�ABHø��iM7�L�ī�����:n���t�UTol�$O���탉��*[ͣ��76�߯�_M�e#��6�ʒ��û�����w*�}�|�CG�=�A��@Y�s��% ����w�w��a���~�o3�����ȝ�Ci-�b6��ܐ·�a���f,��񩶉���k�Ϯ�FZZ�g��\���`�����������ߘ��e[���Q�ژ���Ϩy�Z{(��f$r½91U����$>�%B� c�V_�f[?^!� |���
�x�\p&a;W�c��6����z�{fC��;����j�1.I�UKR��!�[;Qy!IkK�4��h��>=����Į	��UE��dP�C7�sؓ57��+�x2d>���v���&/V���pr�D�!�R��>����İQ
f몝I��W|�3�#��*~����@�A/�w�%�R�Z-ze+X��I����ݱ�L[t@�X�e]�[�*��r����ӓkK��3m�/Џ���&��PS�5�jaEq����	�RG�@���enT��_r]�BŖM�
4�x�\k�Axن=8
3Y8�C
1$O֞�	�Rq�I�i]#�|���e�R�n=B-�.}5CԲ���-;�����j�^����3��E*{:�R���T6�����KHG�4�F.��b��y��7BN�)#4��8xֺT2�*h�Ƽ�c���&��!�)d��FB���fH3�25�Ln�T�Y����7�Ew%iEC8����W9� �a1���$�PI��Ν��?ޖ�v447�7`�A_>m{�N닂�mˢ70�ҹ4��e�v���(������Ȫ�%�|��>%�?�7^��� �Ns�s���Ǭ���w�V����c"��f������⍙��"^,��0/��߬ ����^��	
/��o;���!_�� �������C�W�����jZUt�^�I�O�%�%�)��il�Sa�?.�o�M_9�ϢB.���Џ�r>���)��-ۭ#d=��9w���~�u�闥�g�+#x+������5�p}�'�Iҵ�#��Y��i��'��}������}�jk��JGJ�.6�Q֧7��[��L��o����$�>��u;t��v85�fK��SmU�N+=d����TF/>�JJ��n�s���SqU��lj
Γ�N�z:ҧ7�x�n?���v��������TID%�C8ޜ@�q��	�OQ���ֿ�~D좁0r���1dk���+t�d��״.�d�Ʈ$2��g }� �:p�)��;ߗ���g펪��{~Eͱ5�t:�`f���\�Y��yx	fu:�����twfV@�G���@P@|�D@	���_1����_��kWթ�9�r�]k$��k׮���.�hGM����S�₸���|@2���:����(ɠ_H���{�WĩRxu_��vGykxsA���/�j����ŭ��9[����ꎆ�ȱ����r)�<)�D��ӥ�f:��{l.8t	��C��P��'h�P�n�V�Vb!ZK�$� �]���ZvʟlQ��j�0݆�����{�<�+8�j W��i�U���C��W�3�! � i�t_��}��uJBQ1IowAܽB�i�<_|1��
k�;�=�νzeiB���#�r���`�c,��:cu��K���w��񥅏�3?�ܬ�̋��`v�AQ��<��^	�O�s�����O��2�L��ݻڋ�Aǯ������H�?� 3P���~��{6���}���N�a����1�Lur�� 5yt��x훯�_c�~1����n�\�;�Þ������:@h��0c3����?�����c��'?ɕ����'f�h`�&Ѹc��a4F�O&)���j�������GY�D�?���rmn�ҭ�c��K7aP(�{q/�Sp�$�,.·����&��������G����VLs��c#|�Ҽ�/���gJ~��nT� ���|����:b�C�j�N,s}�X�n����	~����eɍ%l^ۼ�6;O���0���S���N��ܢ��Y'f-�:��H�U���g&�t���f�-�3������e+Ǜ3�۩`�Lp�,]��ĥ�/�y���z�?RqT�!q�ur������v	�/��VO_�ݝ}�~�� m�hCӉ `�9=~b����rc)D��i�7� ��*�.�}����XM����# W	,)}�O��~Iw�/���sL�@�P:.F��W�L�$�f��h�-)������P�;_�R�����R��"�UA�Gx�.,S7 d�Vu�Pu��dL�x�n�7���G���+T�^|����Q�I�{2�W/ч��V���\0�5�0,�sˇX��0?s��23NQ��.����!V� 6pp�*�4d�B�SX=��`d)�;g����O�x��
�CN���)����뻲~�~^�R�ԅ�<���/j׮I�GT1�S�w��`�%Y���*���,@�$3�(�٢�6������,o��`Q�E[Dbz��3��-��'8=�"��r�=Bl/S9�������=��J�&*���aqw��؂D�"�����'�8�i?gN�02��|��&���ߑ��ǁ v;�!P�.9�W�?��Q���L���.|���L�'
�b}���΃2���Y*�?Fa^/�s��C����+��@�E>cp0�O\_Z�,�7��8)��/?r�R����~��uM��
������E�do��b����q�扶L�{�;S��_#���-��R� �>����(�Ǻa/��t��D2��!�v�"����.zhc��P>D���_Rд�> ��rM5��fY�F�!#�3��[�J�)���R��J	i.�أ�6��g�,�Pv'cz�U����"��ka�q���}D���#Le�
@�nN�L&K� x����,�ђ���
���T�;���H�O��ryćH m���{��_��0Kvn�H?Q��0�Ƀ�:r2-/'"�R��z��d�b��F	����ڍ���G��E:G�����W]m՞�� ��6�׺���f{A�C�;�&nW��e2�^�t�evn���"N���'j7���h�������u�ݦv�-��tm�����Y�ɩwF�`�OI]ꃜ	��8��@F��o�7�n�^�j�&�3'lu0ŤB�z�	F�T"�a
�z��xZ�w��_F�>ZτF
�c����s|V��W�a�n ǰ0���e)����-_�������������Y����$�$�<��_���%��2 �Mq�a�P.�yV�8���%�$�kC�K�#)�eJ�3�ˤkㆎ���[*g�;;ֿH�RG*to-=���6�H0��.E�W7�C���9T /����-���*�`�Aȋ����N�O��#d��E1�����M�x�`ı6�+K|R��اvfP���b>�Y��K��v4����60�jv�h��̾�Q5�f�0�ɧ���������8���JdWNQt*������Kz�G���r�kEE���|��E��.d�ƞ��0���Jdn�t*.�?���	 �fݝ�m��R�#n�C1�S�Jh�Br'�Q��»�`K`Ch�����|X��I�Y0��2b�O����=��y�h��y��ra|f-�u
�m�!���VzH����4�L�WG��²��VHB�B�	�\b����Q��%�R!M��:H�l�%�uɗ��>AVʖ���.EuAh�l�WJQO�ML��U(����]?I�Q�b`�Z�z3F��NS����:��Z�n"����k΅�NA����"&X��/�*şs3t(j��$IZ��_��DB"� E�$FQ�'L���k�iJ�ISK�Z�HZ`�j|���b6!��`#q�w��T�v^y���=�g���Iw�{��/�)Y�6٧B��_4z��kB�e���4�_��[���e�[�����r�j4T��ɐ>�KSh���.s�@�7:�_7E��
S�ztⳮ�#%�sV}_U��D�6�+�6��]��R9�'�f 7H�g�;�L����<���Zu ���MŌ�3�d#L�>\=>{��Mޥ�K���%a�iB؞��?%<��������^�;|�=R=~͘�qj2*$
iWr8�ǌ��);F=�G�>_o{*e�_TP��7��@�o��T��U��cDT/zT�3�9/�X�}���(=d�Q`9���!��9��:�r�j@���e?��VL-�r]����s=j('e���.��9������D$� C���f5ޚ��L�W����ZN�����kZ�T��ʜ
����YH�5���T2q~�Q����Cc��9����p��`<�a�u_};��k�.�m��� ��:��E8gs��_Q��X^<�S?N��+^1�����-���z��/�p��2I�AZ�2=_+�7g=�?�����!�������n��B93���Z����~(+��a�#��a�K�?���nb	�@���@+����1;�=��Y`��,5��AO��t��ت��)��9�k��뼶�?�Q/Z8݃�h�(�{Ѱ�/�P�,N�Z
0W���s�����}�ܛ�4(,62�e��\@��*�AB���x3N\ѣ�S!;Xr!�b�6��#�ّ��
�� =���I	�s.K�2Zҙm�w	eZج�>!�g�D�୍Nn-6[)��v�W�\�c�C��� ���7�Gʴ��o^e�>���#��u�S�L$�*-d�ƛO|�J��G��즇p,1T�H�e����a{��y�F�����%�7M��Kg�# �N湯x[oE�����ƈ�;R�a\�iMy�����e��3��Z��G)G&�N�^*Gz{{+�ֈX�,�#�o	�ڽ�:��9銥[@s+��������])m��=�a����Q?�������t}��2L��f�d�J7���!����-±DG��F�a�����f�9�����8>$,�\E3��S����<�~
|*��w卖[D;���`��i�.�;\����1,�%�-�DV��I��?�`�2?s���dV�罡X��f8,�e:@�"z״��m�m�\�锓��W�ޫ��M�Ͳ�������Y�sO$O(�B��#��̗_�������q����8E�^���=%󥀟�KF�{و="Ш�-o�d��Ϡe�Ǝ�u��ff�w����N�4����&-R��/�W�������/>�F�6�@k�s����WLK$�|-=R�#&$<m>��Y�̇�K��ش8�#�E�B��!�ZA�Tg�5+$$r���Tu��`�JgZ��Y�D��;��baڣXʞFW֧Z5FPG��1���O��$D��16���<�9:�r����[�2�<�O��!�xw���/�v��������7�_D�1+��5r5$I�X �Ë��k���O�@�2�����@�ٽsB��=s��':�.�G.tl��2a���V���䣧K�A�|��T��=��AWD >���<!���|��)�;q���S��9�}C�a��h���/���z遤�D�f�A-��)�a�'-���"d>8�.\(,s�kh[M��m�p��'m���k {Ч�h��c4Pc,D��0rAX�D��3ՙI8�=ڶq۞Φg�Pz�<\�sq*b������,-N�K�$��M�G��΃�KX��+f,7yQFs�sR/�ݹ���&�%=5	���fz{�>a3��M��?��+�_�f�[�#�l,Ivx�:�v�
G�{WхL�_`_��[���G޻���ŋ�1�4{��}����þ��>W0v������6��":�u^E�Ҿ�� �U�x	d�K���^�`aRwV�S<�E�5ʝI��� �;�4�Hl6�Ć�F��Nnn��'8�(��o�P9�&���:#Z�Q�z�cK-v��LW�T�_f�WO]Y^��۠�q�	��@?;�)e(|��Ւ��K�!�s����"�O�Ӣ��!�jl!��p���h�����5��p��eƄ��
�����I�J������?����au�{:���)/7X(�����A���La��
��-3�K�ܵ�-��p{�&�,Z�[�Z@���M����%R��LÄ���ʔ)u+e��E<E* �β)n�J��V�iv2�y ڂ]u]��
���5�*�������tgW��j{��b,X΋��&&�ͷ��m��f<���o�����΂Q�%�vE�7^_�rh�m*�M�	�9�~�m���7����ab�{գ_5f�m��aUf[�B`�H�=��gĝS�y�u�qON�5F�X�P߀v��
i���Oc�N�+��J���'�fxt@�DPx�G=4�^��~�PJ�g���F|8�iz���ϸ$k�˔��V�����DSˉ�m°^l8wƯӓ_kz;c� >�r�ٕ�3<�� &/B������x�_������S2�
0t%H�����%�J&�g����nɆB/8�����c����n�+��;:��O��iř����TB�����K��^�;� '�v����F�8?�]A����j�!�,'I�w�/z�ާ��/��)�,�t��ٗB�k��������u���c��:R������1�O�����i�G�M��yR��̂�h��D��+\n	�%b�l|�-��P�c�uK��hc�D��fU�@a�>4�J�(�'�O�=������2��jŭz������G����6T"UfO.ݚ\�j�6yei���{����GO+CR��!����/��a!�����!T�2"��eCi��*.�����(ca�Q�B%�瀨��"Z2�«� %�i/�w ����:F;�C�"�^�Vr��ݞ�⤺�P/�z�5��B�"X�gT�I�B�`�S���c��%��nެ�;�9^�ė�Q���Mp�s�[����3�RZ����6����bCf��kY�������^�9,�sE�����Z.ec-���@ɫ�H=>|���yy�s�O����|��90�x@J�ıxSh�gs�l�����ݕ��'�c���f���!�C7CL.� ����lm����f�bW�^�~4}�6dB�v��L(Mi���S+'�E��y�Y�b�6��9*N\��f/���E�0[=�[d.dN�!�1%8<ghٺd�f�v7�c�����4����YG9�o���Ǭ!֭�U�v��C.݄��6�?�|Vxxw"0��+��^?h��+���R�E�oֳ+o^�D�-FP��;D�eF�!��"�PN��:�I�/�♌���]y7������DO`;�~��D�$���Teݸ���ոQ�����$��=|����{� ��
g���se�'���	+����j�S�;�������t���S-���HV��"�u���"d�Q��/eȺj�e��`�L��=CŁ�I��Y��7'X��u�U�S�S�,=ֶm�ypu���.�9�Cf9�m�����*�Z��؂�҅�"����B��H�����,Y�h�(u�����pj��U�eec�wZ�b߂"�,��Z��x� �~"N>Ea킮`|������Vh�Q��y5��
��e������w������g�C#�X������ďP�%�������
����u�����9e��o�\�mڊE,0���|WԂM��&�R�`.J�����yI�5]�gfWq��T�ېQ�=������zw�/+2l ��eFLg�m0+O���0G�6�1��L䬏�9����8H���3� 0�A[֔�	��&��fo��v���(UW�RO_j��6U�)ʮб���i�P�7t�ʏ��yg[&��W��ӑ|i��	�����Xz,.{M���u��,�F'��pƏT��U��ű��B���Za�
�(c�dR����'��ry�ڭ\O�0����/W>d̕(T�R�<��t%w��(ׂ��~݅K�z���C�꽞�^�kc������<"P|�N��5�N �� �8)���
��Ԕt�
��w#�C�c�T��y��)�Z�����3w�����v�8��I��_�]�w�vu�=Ω�G�(��^E�^��
��:��/
���d�<x��eq��$zף��`<Ӆ�d1����,��x�����?��v����QFtr%/����>uXu�-�k��+{c�Cpt�-V�T��j����˔�)ͫ������@_��5O����^wJ� �k�mZS��¶D���72Z��v��[^���X�Y[7x��VIm��	/	zy�,�
n�qA^%�d���	�	�8q/ldD2:Q���T�Cc}�&�(�/*�_i��WN��J��R�t�?��H
���{���H��?�������1B�(���+�5��Hz�B^���Z��h#�����t+t�kr=�M��{x��#|�DǺܺt[O8<��	��������7�ƑtX$`kꒅEs����"���o��"y�5'[0����y���1	O�xS�0�1]C"�I"b�nC�Vz�K�M��'d�hа�Ta���o����U��v�4�[}�3>���Z��1��(�?$m�Q���d�/R��?X9Yej�������Z��Z7)I��q�p�7���i���b~��p]վ)�R���A��=s�:y7ƩI]6%W;�[JR$	׈� I�o�[+�����H�oe��Ͱ����s�)�Hi+�P�fi�Sa��{��3ʵ��I�6��Q��:����r�����o#k�+�|uqy���X����3�3��)�~ظ�8�+�kq��@S�n��H���BF�6gDx?��_dvJ���.���.�J���ڻ����f�k=� l����:Kp`:��x��Y�Y8���	�OIp����O��`��8}&86%���"����8�V}ǹ+Ird�9X���L���/���xD�'��MVzȍ�ܴss�+j!ƚ6�x9�:���XZ\\�s�=�܉R����Ek�ް��O�1�Ʀ����Dhظ��D�q8O��#�2GP�D�#1�,yѨ�Z��i�)^��J�y�r:5M_l@<$��)��x����t�uJO �	�WCgll� 4֑4Gi�y���$8<���;ꗦ9��t�$��S��h�vTO �Q��WFyl���?�ɬ��ؓ�Dh���G�͔��J�L�8���3�,�ݎr6��S�<��<��f�~�B�=G�3�������?T�(K}��R���؜�`��7���9Du]T��Q�K�*�j��AG 2	�t��=0
�a����DB}�$8���P���g��՝��(�B~�_w�;���]$�G�l����3Z�!%�Q���t}�oM���vlj���<NL����M��RE��Z�NM����ʩ뺙��-/�Zi�c-�F�6��h���[1t�K�s����h ���~��N8	<������cV���6ČW�>��l�ڑ�S��n�xy��	��,�#�z�o0���N�j��>8z�"�J���V?�e,��Jп�X�h���~"��#�\�2��ʢ��ItN��^J�m��^`<{d���4�<`�YB�.ꤟ���bi�	��_(Z��� ���9J�O���"�R���Xu�<�P�'-�e|�$���w6*��G���{��c`�a\3�c�c{Z3=���¬W����9t�o�=z5�Щ�F������$-��c�����0g�������;��@�`n��ٽ�o�AΗ���� J��@qH��>�x ʦ:[���V�5���h!�b�R�m\��ڣ3�A�A�Υ��$�$��6w�J6K=��-�Ƹ�lnpǅ��26D�A+>���Bmv���t'�p��2B���x\��/ub�5\��>���.��n\Y���ځ�C��ĳo�2F�[��"[��WJ&_�eH�K(UH��gd�������YY��S���^��+�]Au���b��d����C�xw��R��g����}��NF&��S�t�y�d4�d��ï����V�V���0���p 9�z,���jV��0J\^�;����8������U�`u 9���e�2*ã���<�Q;؞f0�\���,P�6��be�")��()/�N�,+��܂z]fe���|A4EQ����pZ���r�[�ƍ-v�7_�����^��[�'�%��cEj+w�$��[+��g�-����;{�7sٝ?O���z��ŉ��}�a�����2�愥ρ�	�^z�*�
����`��yú�+�1�ɗ�P;��I�PHB�I��1�acI�N�8�c��:�;�sgD�:���s�C�V{I��Y����@.ݼ"����iL+�z=϶wЇ�*0�&���u);���ٱ�ݱ�n�.�#ŕ��h��O�_<�g�޳S��i����v)m��	�'m�C�ʥ�:D�θViѪK�0�L���������s������CTp�(���*p��u�y|o��o��7^>9"�!��˭��&�#K���	�N�����F8�1��*~iF�`~?|�����]J��e������_�����X����
�3ӧ�E)XE0}*�M\]�{���g��	�g�� 7uum��	�D)\p{|i����O�r�v�[�a�J�P��ZU��	�3�gk{Q�gkmt�p�F���h�s
cό�J��60}(_Ƈפ�!vH�E�/��\�n.�����t�ݲ��o��p0}�z� ^�m��v|�[X���,86�83�,ᤣO���5}��,�_�t�����j ��FQ�j0����m�n.��F�G�q\��%�<4�������~�t*_8W�ilfU��Sv^�<�1��e��/�diJme�o�u��.Z���m�l�����.O��0W9E��۟Q����XEî�A�,k�m��i`���oO��U N�B^jPc+�r;֌�{J @��	��"�3�~�Z��:�W>�d�<�/V*T���*=��Y�4�)`-;���æn&L���qFB����v*���c�-�b�\���₹�<G�י^WӮ�D'<��� B��#��~'(�����VB~������tݖN���������miv'w�>}�fA��I/����PA
p��ڶ�8�0�!ypPF�˙l(�����5�gO�jC��5(��~	j⁮|d$7P���o4W��7Ī��󡆃b�U�APU`|`�r����{���i����\$L#�͂'�/z��V;�����YY��Q&���U�V�٦nVD��k}��E;��"M�Ț��Y���G*�C�����Hwb��Uv"i���r������%�����S�M 