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
�Y��emenu.sh �=kWW���'�Ʀ��A�ܙgn�M�+�̝���UtP�����.E�Hp&F'J�ި1/q�$��X���K5ͧ���ϫ�Tթ�A@3�D�:�}��g���9�`V��n�&��?��kv6gVKv&���B�,i������8)/C�vv��� ŝ�b�y�r�+~�7�
�Y� ��V���3� mG˚=�Z��X�K*E�ԪUQfN+�FI-U�Z	%+�P�k����j�Z(��_�L�>�2*�j�v������ lE�����p�̣��(P�^�;�
�3�Y�1T�vނ���l�j䳤E����,�%��h�t|ǐ^�+��g9 ���G�2����,��ԟ|�Lު�~�����K�����]�r�ʩ?����j��[93Ӆ(� ��ԠYA��F&ݍ����˶�D��M�F�"��'�:>QY����O��L��EJ�Њ)�q�V���ʛ%�^V� D�T��,Rg�^�P2((����Q7����;��6���L�4����G�W&&�3�3���'�7���5lD�E/�(�!rfi���r�3�[VvsJ^�	UXFi(�p+H˪�W�Fi�[d܎P-TC:�͢f����z�#Y�P�Z�fW=\9����@2nώ�U�Z��0�����}��ԑ��ݯ���/9G��0��g�5�H�أok'��_�������K�K�_�����B���ǵϮ���@��a�l��DP�ˏvI�`m�R��@�J[�@�:6��ֽ���Xx	y\J3�l9���K�W*�R��Ȭ\^e�*�S����`Rh��U�S�T	�0�0DCn�Ap�%\.�]����^7��a���Q�S� ��:�Y?�s�U(�j�_�T�k�C�$µI���(
��7���s� ������&PQ�(Qq#��S�_O�E��Uh���U�<�d:��ӻâ�w�݆��=?��������Q��j�T���g�[���!o�$��K6�C�xS(����B|��̭�S"B�B������Ƅ�{\a<m��AO�Z���Z,"R}%)�?��:�@���3:?	^����'ׅyK��B-ɽ��w�r�^�m��6S����/`%o�^	W��w~���Mс\R:�L��X@-(����B��:7�������<e&���q*�*OZ�HA���O--.�Nͬ\�[zѹ����"IR�� 4K߷'��h+FO���֦�6d*kg/�����fRl�g3O��J3FST�c/za�;s��w ���'|�e�g����ɵ�]!�,��܎
z�5��+��j[nrU%s(���HD�l�(�L��pEL�Q����;����sם�� f]^<�LM�,⒫W!H���]���.�}���o{�4���!�d"��!R��!�E���ܫ`�W�?�����R^�E�}9�� �X�48�'��ԫAX��i}n΍��dh��4h����ڇ_���h�*/���ʓ�"ɝ*1R'�^
��R�� �C:��a4l�e�KU+�HjȰ��ؗ��6kЧ��G,KŽU�Q�F	\�BA}�}*�~�2K�)�U<�Ć24����JCFi4j���(�u�DلI��A�Z�	����R��8-�FLW�(�$یYr|��r�j-��Lv�s��Y�t7.ȴ�Z-�أ�����yKQw�fզ7**ǥ,�� %�#(� 0���?z����H+��Hy��_�V6���uɷ�Lg��K��n��k-g때��G{����d�,�Hw��eJ�`�dF킕��+���e�Ԓ�(�R�7� &7p��$U��Mᶠ��)tt �Bj�����#c/��)>U��V*���6C�$�.f�0������PA�]O�O"
��F��	��0H06m�DB Lh�|�*�t�,���gs$0�")j��>�G}|�GcJ�<\���d|��C��ŕ8�������YE�%�7����O$|��(Jq�*Lk>�^�R%k���ƅ SUB��������=3�Ւ�N���Ÿ�P�������l-�����q��&�5P�֋`"m=��!�*]� �/���V���"���:���[� ��I��C==��?��������q� ǋ ��Q$`a��%���Ԯ�G��Z�,kĬl lkX˛#��;FЦZ@��}�� ��g-�U�=�%��q��'�ty{���^���k��>Hx�\�y^�Q�E= Ϳ@�ԁ�r��Qʗ�{+����޵?2`⡘��@����R��ca)�ރ�"�J�yz@�CT�K �EI��B��q�7����"Q��$[��ઌ�y�Rc�5��,��'�*��J"qދ��,"�����S��v=� �K��?/q�/�twK���(�l����T롙�8��~v
��|d
j5*�����{�_p�ꖖ����c�G�>�}`������][���q����aL�@�Dh��[vԽX�խ�V����|<����qK��Sw��}};աx*~#ܟ��v�����\��v���	����j�Z�:���/Jm.�/�������ˢ��t���E:�F��?�#k4��/�"�Th8m�y#ڎ�5�҈`���V��D������P����SO*��cA/�̼��}� �yΔ�E3oП��	�4凹l#�C�w#P|��ռ��b�=��r�x���D�<��%Q�8X�(�m�qQ�r;�D�3�ų��]f��x��(�g�GK��F��#��@l~�Ň)���b;�_c��L��oG��Q�v�/�����x�yG�"��7��(�Ӱ�7BoA4|1�E>�,��4s�?� �sْ�8X���n���I^K��RS��ܠ�L���
E�>%�K�KSd!�[\bG��[�<#t1�� ��tiV"*�%�k�B>���^��8�@ =�1�V �x=�����r�쪑kLDx-�ZҌ�:���Z7��4	>� ?ZJ�6�ذ� ? b��Ѐ���
���p��ul~D���������,�TǳN����̺�1�.��fMT�Ϛ�������ke���\Z��(y�)���x�����Gܸ�� m��(xss,�y���s"�sA*�)���nB#�:A��Y6��ڽ�O^cc���ƃ��MB.�[�x�v�������P���v��B��s+��D=D����GK:7/���M���	n��8|^ ����1���^�`=��b�$峮�2D�-�$�
_5�rJ?��"Ghc��+�`�ɉ��ds��d<���2S��H�9������B<��"�!�_:cJ��[[�T�_��DB*�,�Ci|4��G#��\p�4��M�/����3/���R[���
���[���k�xm�m������m��`а�ǵ�A_�rK��x7[D���EK6Z�J�/���W���o����?�o���6�1U���&��m��n/Z�hh��0�#Bdς(�8�x'�>t�{OH=�NW���F���F�G?�u���E�A�a�QܻV�,��1���.U�p�.����*���MUhS�2@����#)^��ƛkN,�ؐUhU[S�j	��'��(��UߗN��u��N����U���XX�/����!���$��!�!��ʞg���k�H�'�`�3�WP�iy�@�=����}ʝ��K]֜:7�Q}3JD��Ð��V��_H�$I��n��N����]=O�:���N�c��Eu�*�������y�1���B�W6p��5L�,T��숑��3l��(�A\\�:��ާ=���lb'�hNn�����}F��"b���'���}Eؼ�%����|F���`�D!ü�CƖq���1:�c��:���[H���ݭr �&�x�Kז
�X��e��kۻ�vu���.~��s�;wr��p��Ί���@��2~��A/�*x�^�s�W��mEç����w-2�Yd���`\0,[/e1L�,���ƅ[�v�~��z�3�+��ˏ���-�k�Jז١;7�����W���\ҭ;�u0�<R1m��K�z��5��`6Vɀ�? W�z�&Xl��7�\[d���fr/n�E̞2'�`�ťv���EB)��]���,�i�w3ˬ)����]r�-��F��n�%����0�H3-��K�:,�*��xGY�I(������WÑI�(vw�G�8� I18�#������@�-I�y��*BOi#�K�`���,�q��zoW�
�L��Зc�"ZQ�Y�z�|��*Db�W,�D3�8���-8/._9Ew���irl�2�P���_�p+�v� ;��`��h%��8gʎ���Vض�XkPf:���9�Z�)����{�S��4����Sc�V�;>[�#J��h�_B��b,����cW��i��&��_�lh/xċݗX>�=2�JݱM�R1�cm�en����猭6Ћ��p�>�z]��.��O�'�齞�J����"�7Ƽ�_��%��q�okd���mi���'`�7�4�ߑk��Fzr]ᡛ�:������%�.hx��ݼy���E3�7�J�ČLFٳ�3ҟ�E�o��##>�o@4�4��i�t"Zk����]:�&w�|V�g�%M�&Q����FX��-��Q;k�Y|�x4��L��u)���c[b���8v6��3^��/�dہ:�P'^>���ۇ����;;{۱U�^�ჼ�G/��&:�Q��1�v�Vu;�����:�Ww�v�\�0~��ڧ��o�i�M����U��J�=�+ڈo�dE/蚥��ᄂ~�X1~.]1M[���V�Q���������V��w_8�w��S�/&���;����|V��s~o&�R����v�Ǖ����.֟�\Z��;��'.8OO.7�<�L�R�l��	����?=���=��k��ם�i-���s����9>�G���c7��g�<�#@0�g��Z1P���_ɖb�%�Z����ͮ�%�A���1m�<��k҃�>�?d�
p�����/YU���r(��?U��O����g�)c��
IXz��*v�.ܧ���P.�,g�$G��{�E��w8���Ob��{q�5���]��=����wo|$�g8��������F��$6v����Ba,5p臜���E?ɦ=i=~̬��P���j��TAJ�%ߔϕH�&��V�'�8ۛ0GSZ��bY��*��\�`V� �:�8h��
��Ŝ]@4�ͦ �!o�}��[�B-��8���B���gW�0���ך`�U�Z���픖+b����a��XUP���I|ր��N .i���,�Di���w+hFC������A#����ܓ���w��T�s�ҙ�+�O��~�<�Xz�������k�ƦI;��n��r�%!�Hl��*b✽\�qz.�j-�  Q�@Ӵ��єY����|5�W4��怞*鶤>��5�_�qw��g�|������J����jjz��D��/j�_ ��}([?�=T�	s�<s61��9{o��i?A��Q�G=>0	�O7��������f�08���\�/�`2�&F_#�SM�1e�d�6�-�����������G��K"2.����q�>�������i�=��t�}��ɹy�,����s�´�wA�{v�9w���s�E�勩��33��#;20�/����,h�K��N�� �Mw�*���#�P;w�����/�k�9�f�Ihg���9��/�<x#�]ڼv��~�����L`�# m��L��+�@����H9ki�s�@�����T��)�:(p���)Út�;3��t����5(��|t͹z0«8yg���?{jg/��0���^2ש	�3�O!������}v��d�9��s��s�<xhI�co���'u�؊�c~� �@Q�8�x�&��v�(�e�����ЉQu�s�4%>�����ˋ��+B3��On.=�X
�Ρ����dQ@�sh��ߜd� dJ`k��O�r6�|Lʧ���*^�rL�X@��}���͓l���NL�����s��/��h��9�7�3��w)���7bQG[�� 6Ԩ8�S��a��ӣ�H�߿��o�o朙/@`pTP�?�v��ٚ���������(�)�|]�����S��p8�&9C�UX?��� ���-�{��U������ׂ$�ʭ�(j��ё�q�n�k���!X����jSU骊���zD@�؎�"�(��v�8b���L��|�/���u���[!��/��=�}��g�}���Kx�L0��+�_��Tu?�9�p��)�a����h)���+�y���׍�o>\��[�rP0�tѻF�"���G)�-гޱ>�Q5��|!�n�2���lK,kT5�dM���7;��:�x��w^x��Ozm0�z�=�)io�b�t$(&��xD�t��x�kEu*U��:S�OM��\G��n	�����h�3���i�h��+ŁhW�i�j�p8�5�,򳳚_�K/���~Jol��ukz	t���c٫N��ŽS�,�Y)�v}	E�NI�i������*���+^>���?�s$���D:H�0�lj��R�6T��R7؎J&�	���F��M�ֻ,����8�b#,:a�G��Ds���9�'Y�q��Vl���Ӗ��.����Z͠Vj�l�:<��ː�듦PJ�k�ع��>hA5"tYRfP��"s�h5ܩ�<���~jFj6[J%��t�H�C�o��v1���H�j���}�CL��K�܏(�Ono�7V=��Δ��t#;�F�X"�\���b�Z�����n}T� �fs* z�,#�~586��[G0 ҹ�w�f�X+'�=�9�n��a�����-[�u��A�"�\k�-a�u���U����R?δ����I6�npt���j��`�^d7/(��lw`�]-�����𹔨��Τ\��Li��T�/a��� ���h�@)' �!J�V޿�?JT�XG��K'�W�nq��OV��D(8����kwA���>|��GϢ��k����4�K�Q�j���H��G�<�o�z9hb:R<�D#��d ��4��F�8��<�$JQ���ｇҴ �3�����?��l�i�H�^FO<���YE�K��_A��Al��G�pAC��T��C���͝�,hI�sRf9��6,[n��UY}M��u�}��AM�S�����=�ǽ�^`���J~�́K|�d	2q����W���Ԍ���������\!?r��u�hk���$��K�k�u�ҕI$�I�	C}A��N<@���kP�M���,\���A���q�rH)# :�9�5�0�2��5�>m�6�E�y�t��ڷ?������]l�u�!��\�%m�	��"��p3ݏf���O>9�]V�,��S+�,�Ly�����N"2c�3zgs��(�U'���iVhC{ˍ���`I����B���k��9rݝ�"���	9>���j�<K� �_y�W]_�.�Ͷ-N�f��%y��zI�%���X�v���= S�L��4fڰxT�b�2_u�5�s���p��hl \�*��.:�t=, �@>���;�23���p����~��_��}�n�:�P@R�CH
}��\<����C��a�)�vΜl/\���F��2aGUM��S*�B�6�ё�A,˂T�C�&����O��7`j�S9,�_���0 ���$Q �!�����^`2���ČUezP+o�T�=������'*�C�2�`VΗ�V�bs�.k�?ʍ0#�.�)�B�~$�h��f�nzZ:?E;�h��u=d�5��:i�}���v�s�<fGDtS��D���Μ+���s�R����������O�?�Nu5�Μ��Vc*��N�	KK���W��������Q��c�8�ZA�P��
�m�����>�b>��j�� eQ��	b_�H��K�'h�w��6hZu���?^]�;�y���Ko
�W��=�7Y�A�6�»s���g`�=7�>�Ծ���;���b�H��ߴ;f�A�&�l�>��}���6%C�.?)+k�rΡB�ܹ��ĵ��y�Y����s-�8�mBk��H�0�,�a���U~38bm�|�Z(�H����$b�WZ&����V>+g�=���V8H���8*�6r��p��G������Q5)p�����YoxhD�,�{S��M5��x��PO���٦A= F� ������S�(���=D�I��H`�Õ�& jw��7)�<W~�y~����ƌi�y��c����+^���9'�Ȧ��=M\g̻�͡w������7�[��ض�wYe�����Ӻ��}ݣE�ܺP�ݟ�-�"�!�*&��c�����{_�k�y4q����7EӶEV*���L(At�R�>�Ͽ����*Ai��(V����t�o�j�7��,KT_���J�A��+�J�-�����0�$"�E��ID���������	y0߫�װ�W��:�0���g����e�'n��,�T{�[���� ^S�t�k�5F��'ݠ�x<�F�����8���%@n�Du��Z�DՂzA�xh"�l��y��/1btv]�
�'&k��@tE�zdS��Zc���Ŭ�$�
,7���g��phKB�š!��/�P\� �l�>�Jh�f��l���I�����r�Gl����7�^D���D��T�;Z�R3�*�	IS�&��M�	(˕9Lse�B���e�G��P���=��3�)&��~AZt�\'2_�����g�����:C�z�9��U����5Gvg2C$	Pq�5j��䑠Q�t̛M�٦��b�Y|�X~��(��pdy!�"}E��c�t	�'DR�0b�ԮI2-YC�h�ag�E���v�/V6,�Ǚ�2ʄYS�
&GX��b�U�H�y-Ys� +P?˃4c20�o,N����P(�����p��2#�`"�U�Y:�nG��*��b�C�1�و�ӄ���}0��e����nr�J{$�Gb{$�Gb{$V"�!�#��>j�(3�3}1�9�SР�$���i�Z�Tc�(�U�&�f����iu0��r��^^����,�4������Unߖ��za�F&`��b�)a�Cc��$£�� �86&�	����qOL,B��\�j�l�a_w���������Z��6����F#����p#�#��<������x��*�\�8Q(WA�Uo���eJ/Je�}�$	�>4���`J��}��Z
����f}b����>���Y��L|2gD�ûf#|+�9�O�a��2m�n~�|�jS$�6/�A\Y����m��E,����LsO̍�Q�5�ԕ�����VO��d���s�����l���ЯZ����-�MI�Pf��'Ǧ
�B3�B��KR��)a2��R|=k�,�XJ�;y#�V8�Z���JN<�%�E�A�3.�jTg����O�>��|�[9b]$��eE�bX�
1��yO�$��R�v���>ŋ�5��'XyRi��VP9�X�����5��X�XJy�T�s|�@<`=l����f?DP_��R��Z0�j�h)�kj�R$��@c�V�6貁1R�`5��R���y���wW?;�����T��u��ߵ�)��x{~��^t�޾r�:G�VJ����e���Y���8�7=km��%oA#d*�*�nc�o��P�R�EFf�	4�^;ׯvޘ���
���7iȥ����}�W�7,�1�C/C �Յ+��ZP���|�\������E���}��t�l���^�N��%�C>��(�r�
ڨ[�z�O�*m|b��y�Խ�W.]��o���:7N��ݍ�5ը)z,#���ǳ4�sh(e=+�GD�(w��~/�;�[�&/�4�C��;�$C0�b��}���YK�
q����c%\���j��0G ڷs�kJ� n��EXd5�Lwy(u�.^�OS�p)D!RY�;���wQ���tY/�]{ac(���44I]S�mJH��%xX(��)�Ry���͜�{�!9�=�C��S��1�"i�?�'�Z/WQ�'P����,�{xg�ߝ�)�Z�.尡��wl�2����$�9#���2w+��K�K£F%O�q������}����&̅�E�--�o�^��k"�4dׁ)��ޕ��d�����#5=����oy�Ԍ2�,S릌����?�L�\I�e�7a-aixL�#�oդ����O[``saj am�_{�d�-HƁQ$�E�=�f�+a�ϭ�քQ�iL2e4О��}����-�%f����W>f�:�g��҃�*َ�&|]b��U?�s�>2�b��Ϧ�Sx�[^_��6q�f���W��:1�L!fb��)r�P8t>\y9�v뷮L�ۺ)?�ww\xy_��,<tL�QOI��&@^��/=�񠳍o0zb��Ao��M�������ǼЯK&lc��I�����ң	o9aB�n � �����Kyq�e����6~�C�י�l�Frg�����ٺ��<�kz춦�j�Z1������_�gJo�M�즫G7�$�%�z*��^q�B��ܸ$�u�( '^�I�9��ʽ<���Gz`����QߊT�������#�5�sxH�)eȷ��$rNo~"g��ِ(�L�&jd	sF!�\^uRH
��Q
|��#�>0�U#)]0�E
�y�߿��ٙ�<��0����ԡf�109��C�Ey:��He��y�T���W=P�g�T�γ
;w"�]*3T������ ��
�2���{�!�$Ϸ�S�}�<�H+�E��=Q$%5TG/�<B� �Yrz<drp����[,�d"B��a�e�Hܥl�>b�y�}]�������o==��Ċ�ɱ������Z�q�nw*ۯ_�$�C"-(HU�C_�?p��1�PV����=��L�a8�
�8��ؐߣa���2�����	t�Fuˡ~�0�^��Ьx$x�[lvw{�r��b�x����C�e{M���=�nA[��3ܥ���$��@�cs��CAzG�A?6߷m���;��p�5	�,�/��I`_o���.�3�@���[GfY����Q$nX�*j������d��+�o�����r>��(�X]��|���[ok9�0j	J]�{]xZ��7hIh����I`Z�����Ch;wz)��ـ�}���f&�Ie�����%ȟpr����������tey�=j�*�	����ٺ.�i���r��;�|�~�H{���GWX(�5������E�b�;��3j����dX� �3�V��DQP:�x)���!2��Ud����1 G�U.�X������������a�맛���ۂ�ʛ���O�X �#�BU�� �;� ��YC��!�	���b?!0��6�0������~���m@B|hE���I0����1�@�����&��_�l&-P�H���1�X��$�;M��	��Ls����? z����Vz��C+���� %�IK=i�'-�����ԓ�z��OKZ����=��z{���ޭ~��cIX
���$�BzF��Jk�x�d9�,!w���4${��\p�d�޹*����2I�j�T�r��(L��f����c[F(��W��q�� `c(C�F;x�7�b%O�Q��a�t��f�_�֙M�D��n���& {�`_�fm��������WW��؞�<��̠�A�1��κ#��ԕP��=�����	u��L�
ęG[ �S���W>u�o@�6>���s��r�л��H��^���}�m�gJe��'���.N:cf�G}�L��`�aX8\��;]vl_�-����G��o�Ɖ��%����j����`���"���|8D�G��:�rGr�L>�_2���h���|����K��k��B���%j�`�zz����1X.�S���GP�G��n����\�']���|D9\�lN��.���)?R��:0�v�~�H��	������9�Vj)����z�զ�6d����S<iM��`֝�ʸ����|����;�����\��|Z��R YV.B�v>\l�����K4�h6���Y��\�t��;�R����з�b�\��sY�HlN��tz/K�U�[|�nĴ޾�dPk6'��P��~es�}V�C�V��K8�{Α\8��� �ĭ�K�=��t6����\��E�o)���)����W�`i�K0��߀ ���Փ_�ߺ*aE~O�!#d��n�&йw6*׳�ʔ��>�Ωsh��Y��F�$�1$�_������}��$�_���ם�ٺ�o&��޵ݻ��o����O������=Ol<Ŗ0	[�(��\�%�U��g������ ��:f�<H5������4j�p��k�"����d��"JYm�^B�I���^7�!w�aW�K�/x�7@Y��&�e����LMUʡ�/��[�Ӭ�� ᮒ�8f�9N��^���׿~�yL�N΋sEX���g1�4��9<R��0���Am��&�C�Ez�'3�>h[A�.WNMB����1]#YF�>�4a
�W�j��VZ(ӧPC>D-�a>�N��R���o��D���V&9PG5��UI2{��8	Vh����,b\����|�L�V?;C��	��F�A�7c��dC�A+^H{o�w�^K�8�Ձ�pl��_�xgd=7i�L�Qu�|��6N�"�ӎV���CzER�>Q��!���@��		�Z=�X���� �y���-� ����oҞ��8�A�C���"�rS���#����a>��4��Q4A�A,���4��"V���F����tA�/I-a,T�=�1�.���u��b�Pk���t]�����1�G[X���k��%f��L	������ FO��.��zX�jp�Cc`(x4(��Q@��̢�=L��Zر���u\���"T(�"E��f��'�kBa�9�_�����ou.��rx��.}�c�V��Z8�x�),�B���WG���:�:���e��M�34ϴhT(�BMI���2���z� "���xs��@X������T�|�ء��~ӠTЂZy�����VАgJ
��hh���Y9_�[ϥ��������rzG5��1paO��#�F屐ӈ���hG����v�$BD�<H�Fl���N�a6�s�<��//w��.6�b�|fg���f7&H�?X]�ݞ?��~��A�q]���Ԭ���RP��`0
kR�舞Ab?�����(\�J#��x|���bT�*.|���&�F83�h���рc�0��p3ݏf���O>9`�
��pO{Fg�;�� 1���.��;�}
޿L�qC *H�*q�I`�?���D�;��Q:]i6��!���4�_+6���i"ha0��&1%K��v�`T�Y
-��7�t? �ЪUaۡ:޼�����U��e)����7��V-}��T�T�1��t|4��6�QE����eʋ�N�s�eڂٳ�RGq<`/BB�?�)��A��y�Z� +�N����V���#��5ɜU����x�f4���.X��i���o����(� ��!��i���"\���5J~6�#�� �d(�!
��J�@���*�,3ֶ$<�7��A�2!�SQW \�iJ�Tǳ08 �@~�nQ����~]xi����{����3G�1����ʻozf�\��U��`��X�T���w3�Y�4�c��c���a��v"���6��4�A��s �C����'�c8��S0� �����aNj��sFC��<6J��D�Ok�S[椖9��C�"��Y�CV{�T^+��" �`�F�K���|���ŷ96��#��}�9���j'�Ļ���	���*��,�Oݠ��D�6<@�	�N��S�y4����x����J[�|C[�2�s�;���h�.�<�:�@g˷�=�ͷ��ۑ]�&������U���4|�O!�ÝS˷O���q����Kﴯ\�>�6��:D=��T�lCl-��W�����˷nS=g�uP��4;�p��!w��O�H�S�+�=Ӑ�g�C������ �NszaU�BSNcp�:%b�R@�\�F�	?��(�1�BO%4RC�<����S0wo}����if�Oć�V�Zhai3�a	a�֘*��QO��
���������D���78��g5QJ��v�Wu<��=;���ѓ�M�#M���z*��Y��D2:jbzFk��Z	KÂc��xx �~���Y�te�c��w�g�R73h1�kM5jZ�]�}Q��Q\��S�,�d��h��'xp5}hS��D�-�Y�?���xi	O1��
U#�8�?���,�h�<�Q�G���+S=����*�`N�s�fOZ��J+�[% �`��ɲ���'셿����Oܠ,�۟�F���q%���Nf�Z�Sӥ��߄�����9���%�q_]���x���{w?ֹt�}g>~�\x%�ld}���_v�L}�!�$ Y!�vN�a�V��q2,�9Q���1{�SOp�	N=����L�d[JN�����K�IZ_�),��].�ͱ�� �Ȕ=�@C��?h=�4]Fc^��1�vn���9������Qa$��:S�|p�R��,qo���׹��$�x$���+�m#א�#�G�\ �5FԺ#Rݑ����h��Hb�N�z($�����]�
;�W/� ����<��ߢ)��~���s�3'�����sy�����]<�O)�~����uf�gd�z r^yϢ}gny�O����m�y�prqL�z_�����X|���Ó���S��S����ΥS`�`u��((�Z�O�u����ʕ%K=��r��9��"�򭹵����D�@-�a#�؆����y����VG��{�H����ғB~\)�b�F:W��E����YCerv 