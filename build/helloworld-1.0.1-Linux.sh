#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --prefix=dir      directory in which to install
  --include-subdir  include the helloworld-1.0.1-Linux subdirectory
  --exclude-subdir  exclude the helloworld-1.0.1-Linux subdirectory
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "HELLO Installer Version: 1.0.1, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage 
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version 
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
An An Shuai License! Can you understand?
Just use without doing anything!

____cpack__here_doc____
    echo
    echo "Do you accept the license? [yN]: "
    read line leftover
    case ${line} in
      y* | Y*)
        cpack_license_accepted=TRUE;;
      *)
        echo "License not accepted. Exiting ..."
        exit 1;;
    esac
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the HELLO will be installed in:"
    echo "  \"${toplevel}/helloworld-1.0.1-Linux\""
    echo "Do you want to include the subdirectory helloworld-1.0.1-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/helloworld-1.0.1-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

tail $use_new_tail_syntax +144 "$0" | gunzip | (cd "${toplevel}" && tar xf -) || cpack_echo_exit "Problem unpacking the helloworld-1.0.1-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;

� 凐\ �=	x�Ǳ�˲-��>�q�/_�c���MB�#K�l�,��47	4$i��h�6I��%iJKBIIӤ�A��}/}4mZxM�6	M��ffwI�%p�5}�}���ٝ��ݝݝ�]������������46��:�k���3���53���5GmC=����'��BP�-=�ҝ,]�C��$���{��7�"U���裡�.U������FC}-��|�1>���[���&E��il�X�;�����5�L��ʉ6��-��1;}*"���{4מ �&�o5%���Ʊ�=U�Pfk��	�Nb��,��"�3y�S��6�'_�v�_*��}H([y
�cKV�e��Q.�2����]�i�����)+=L�[XL�W췧�[�V�e�?����}=[~���__{�Yi�ٳ�]��׍���ޱ��i��n2t�v&[.�iJ���#��Ǥ�w��+)�Q��Øh?9��ʰ�YM~"�ÄŚ�K��j��|����B�Q~1������jwo0��u��*S}_��^ Lm�\�z����G�P�f0�u���OK���](����ѥ�j��k���a-�Գ�D�a�	�&W�)za��j`��qE\ �+�T�S��Ȓ�m��ڪڪ�i\f%�Ob�e�q-�Y��i��_��bp3�w���D�����aF\i�9�O�����7��8|�8?��o��f\�����q�֋߶�^��6��Z/�I?����X���x�B 9>y|�sB�=�t��qx&��8*��A��i�3���?"غk�4�cW:���ӎ��x���c��"��Y+�޺��!o޸E��?��x���]�˹k�$�U�r��S��Ӵ�G[�><�Uy��'�FJ@�f!,���Fy���d,��֋�6bh-ȋ�^5�<��58�
�M���噖	�\<�E�����ܐ�"�?�"�\�	�k��o翗7��X�U���{y�-G?�)0��mݯ��? ��H~�C�!L;t��8�c�:��ю�ٔ�i���u��_�2�a> kP(�U9��)����L�n��/h��"[�b[�Ҽ��v6�l�i3&M`��˦�<�Il����s36� ���5�H?��zN=��SϿ�#��݆ŉ\G\+�t�0G@�׊������rQ�)eJm�!��O����QQ�k�$�1Y��e���fX"���	�J�zrOAγ�G%`Oz"�>sb9�h5��2��
A\ĥ^���W��E��}���G����+B�P��K��g٧��"Q{}U]UMeC�b�������*�cO���8jjf�
&@�Qh����ä3lQ�a��L&���,�P�H���@�����{����]'E�ה[��'0 ����a/`B��b\�)��B2�^��o�ʓ�L�L�d��F(#3�[�&���y���� h�\��/M��ʞ��� ��䆅�J�&��Y0����+#)ԥ�q<'d�I��@�Ƕ\����W�{��Z��u��Z��h$���ᐛ1�ls���k5I=�>oy��E�g�L .���ǎ
�L��%+�ڛ�Ow8�^�����Z@��u��=s�*�����p�3�;%�J��f����{Se_(��PX�	��D5������b!-���`������+��'&<i���dx�n��i��Jěu���O��C">C�+��L�>%�-�K�ݗ��,�?)>�M��I\���$�����e��<�;)>_�G�#��#?&�d����-���H���E"�X�����9_2��)�e)�S�Ǥ����nif�7�s(m�ް��$�;Z��|����E$?�9<:(<��r�\F�C���R�+U}��<�oX��c���R����W?#�����xc�y�>����D?�)��'(��9J�}�F%����r�Q���R�_�$��AI��y��|��n%���})�}2��C�p$��V���.mnW��ut�*�ퟪ�^Ս��a���n���W=0��UWt����}~-�y��g�%'��Y�
���Z �¼!W��z���[�%.F[�	�q���.n_��EmY�w}��"��̕V�5�sE�N�	�W�C;�0�-�BD�v�.Y�j���ŋ;Z:������ӡq_�o4�&��;ʘ�t�o��pg:~���c�}d�;N���Ϊ�[z#�.���=2 '�
�������y�z\�V�� N#!�ү�¾` !�BZH�P���y�"�`��;��6�T�*�G�l�'�q�ĜR�7�CTW���Pρ�P�aU��z�W N�v�+��Q_�ԓ��BZ���}M�����>Y�Ƥ��L>Fw�`�#���$�S�;d܃������=J,_S����B��~��r�(����ZN�K�L�rC�M��񵡌K?NB;��_aC�>�ߓp�!c����K�PB�F��$��,�]!>r>����?l��~�~C���7��~�J����.7���54�Q�.���$����N���K��q*�;��_������d|/G��������o�^��ێ���(��ܑ~�-9�1�K�N.�}?������/2�/����x|j��%�������/�����Hg��!����O�I�o�_o	�q�I~�+� ��D&>��7�5��5����ɓ�[���kFpx�I�G��Q�N�?QI��*��G
~	1�d{|���ʐ�1�����pxP�A;�;�P�mM��!A������~�����~N��Nr�����q����5����#�T���8~O�����&�q'=�wkV"4���/���¯�p�0zW�8�wH��:U���u����aK�����"�EJ�����'~�a��L�%K
f>���7�NS��X���	
3;��DpZ������o_0�q�k�׍�ήwm';��e[�M���T��R���M��47~r
|��;Xr�T����$x��hD�')�?��O�\%�հ���_N^�_���� ��#�~��.�������ι�z���!��s�
��m���Q#!�/ns���nF�+�s��p$��z�ܝjKG��z��K��{x��jgp7��ʎ�?ܲzq{G�Cm!D�����յ�*�-����OUuE�A�̪��=}:?4	Q�I�O��p���׭SgT�Ś�D�:q{�!�Sg*���G��i�ra00}��;�i�ZP�u"}��\�Qx΀���?�GD@��J���Oq��0�8o�Z����9�x�yά8|�y��8|�y��8|I�s���9��ũq��5[M>'/�����n������Z����OK���Z��ʏ��iGUy������C�)·�Z�|(���2�q>��L:��̓�]�9��;�������!v�%�|����CeN~>�;�·��m ه$;~x��O�o��}�<N�g[w�z�� ���Y�*�q�';��.��%Z���?%�E�!p^�Bv=�A�!AW��9,������>d����{�fbgJ[�^�������|�T�������;�N�@��J�;� �8�9���5���!('�A����s�@z[|�i`:��8(OQ|��S�PO=���>r^���#��#�K����" ���E\?�'&S9�I?Q�`���<� ��}���{�/_L����}U����S��k�Lėd$��.�Ku��5Qpy�O�~K���_�c:�'�CI����P�o�@��_�w9(3_NQ����y�#��2O�n����&�ays-�ܴ,�.�0���w�i��G"�j2�]�	|�W�G`�8<��v�,�n p���|#��#p��n�9��>&p���W��O���	�~�;����z��=���;��76x`;��n!����?	<����<~�o-"�Ĺ�]>
��:�� �����x�IO�J�{�	<=���8�C��+��^�>E��ox��[��Gs	���������K�x�Y���fQ�e��t�YJ;�˓�6ZA�d��+�Wn!8Y�M|_ �L<!bn� �������u,p���B�yU :_t�^����9������5��M��d*��%v��� q3�UO�=����d��$<���01�2;�\�^9�Wt6�r�+�q����z9.�%�/@i+Ԡ0M&�5MOv�;�L�=y7r�{�����uĕe�|zZB�$�� 	@�D)y���|�0̔]i�[sJ�މ��;	�+�;� ��:7
d#�0+���|ފ��?O���26_���nL=����F���Y�@B�sWAJ���R`mOE�d�h�2c�> (|��ъ��.���`�D���g�J��>*S���S �D���ܧR˭3�ܑ��"����Q����*�`#$�-Y���i��f�Q,Gn�^Q�"z��/�� nyu;�[h��{ ��M��>j�c̣��7F��,�Y�5[�.9��Y>����'&���ŤT/fԇ��h��%bc��Y��"��4l�'��ݫ�j$.7{(=�Q�p?�Xq@F���S��4�0*a)W&q��ѐ
�(��s��ICy��إ��*�1�AD��bICt�q�k�S��B�j`iR������\z�e��\�8�[��,N��9+�l�ϔ��a�)��QN�v�u�hx�@���~C`�&��	��"��;	�w�A�M`�|B6/%�h-����C��#m�İ4���	��.+$�j�5s��}
����.���V �۠#����6>�?��@=��o ��1_|��Eo��C��CpY�k\�M�K��6��"p�����M�f�ge�[�ܺ��m�n�I�����}�j�{Fv��ԆЬ�aG��#��,�Т��*�`zN׌|��	�I�st�!��M�w!����t��z��l�� 4�@��@�G��j�_#�e/�~H`�.~��%�I.-'py�+���O`� ��w���ײ�����3�F���9��m���N�O�t��Ñ2a��	����.�㜀����D�[�؅��i�;��5��D�L��5B����նO����#�Ȅ`[:��@�4���6鐉��m�GA�l�g����'��Nx����L��u,��mX�� �>i�"�)n����oD�?�Lؙ�bg����^4	!��Bȟ-��PCs
y����	��(��7i-��l�堆\��B�vۙ&%��Z
�m.�K0��~�ںLho�!�m��e,�a��#�gߋ�/��cҹ���z\���˦OC����+އ2�+S���_�Gs3[G�*���<f����m�Y*ܠ!['��W�շ��1{e�a��y�Yq*lSyl{կ��<Ɣ*�e󊨩�=��(�檛A��^�T�
���h~�V�3���ګfaiD�Y�"��<}�����ǖV����EŔ�W��}I���T\��k�99��� *0l���L���3W���o�16��H����D�t��1�#�e\�& ����l�q���w��=<f���m/�X*�K�>˯�pv"�O�����S��Һ����{ʿ� f⎆��g�T��Wx�������8��x�@'�f��y�b�a=��|� LQ����W��B�ϨA��'8:ڡ��Wu�R��T����Z\�����3~
miZ� .�3�����f�/�~iN��m����^�"�ry�i50q���>������B7)���4�Bu���Y�@�F᪮`6�����Ճ���յ9�wC��F��o� ���1�UO��S���� M����e�� ��(3gY��`�/��^���J\�+�F*E&�magB��z��p���(����"�=ܜ(�0�$T��&Q-�H�}y�Z_.��J��jEW�0��Gc��f��R��4��瘄�ɺ
���m�E]��$nG��qbnm�^��ft��!�Zѻ{X���=�<����(��Ж�z �n�1�[U�E�p��5���v�3�U�1��Z�{��O0\c�����b���.����Q&S0�Z�7�A����`&�����Ȭ����̀*�P� ��z�QM�E!7��0��P$R��ٔ=0�ֿ�U4R�R�׷�
�
�G@3�o��*i�㑹�%��+�C� ��?²MSp�zS��ɊN���wa	�S��L]A�G�m�R
 ���;��j*����@u8+��+�=t�B'�C�%�ȵX���b�Ӫ�6�+d���d�l�Y�a��b�c��s��h!�{�k�]An#��n�Q��fZJ:~�"
�Y���8{
���u�<�Y���l���J:y�X�(Y?���`G���ώ�}�%�fh�y�ץ��A|ɹ\��77^�E1e������((�y'��Q�R�nS��,���	�o#?��s���ޗ6��9��3�����y�OA[�|D�p�*�8��\��29�"vmAL��8�����ǒ�&�:_�B��.YKI7�I(es�� (�Ji�ӊ�r�2=���T����v>�����[ȍ��B�p�ι+�GT���a u��D~�H� `�I�����եP(>C�܇������v��,��+i�t�Lb�W��*ia�.� NWB�\A�闣7��wRRB"q'0g���ΛP��Ćʌi7�P\<��\�m�8Q�NB�$3�t�>3�N���'"�s��P�g��*	R�-E�I�"듔�!)+%�c)r��)�c���)Jn�b}�����>���Q2�r�
Ś��)0�4C�r�v
���xiW�zK�ca�M�q�f=+�..�"�AaKav^�eM��b�y��s��!�D�;�t��t�N2]=P��+i�Zq۠�*����;1\h=�.݅�+��.���XoB�Wc�nU��Z�٦ZoUzv�V���hP'��q�W��l�;�.���Ռ5�V�~���<9�oB�k�p;��P8e��(ٴ�O��|�^��:*Q�O��J~������,��Qf��#�xAA�����7A��OQ�X�q�:��D�LG����]	��k����<��`?�Og�+��5��=�bU�-I���!X�Cf7�i03�D�/i%�%CU��C;�����dR��Β5��;�Cҋ�nk)}��^K�
�sh�➼�<��p\J�M1t��8�~����!S����٪ @�}���a-�T�O�?k`�!�2�
ľ��<�Wh��+�ˈ������s'�����o���>R�VA~Y���#�����%�[I�2kӱ���|~���>��ï�Ћ�A1m�G�\3F,�sd��O��# 
p�?߂[��-��\@^K~fK���e��و���̦��l�74[r���cp��p5Ԣl�y�����d��߅F-�B�%�P6{{�*���	�DZ���7���
�Hۈ�*l��)[@rw �B��U,k&�x*����A��$�V���z�v%��_��&��A�eg�\�D*;�$���l=�Ģ�K�s�����NS��$���)�+��D�q������v���2�N���rS���b�|<U��F��V��{�=��v��=�/��d��/��8��/�H��/�b��/V!o_܀�K��`3�.�e��
�?z9�
�A�F��yp��Q���+8�l�j�[+A���1�a}i:1�i��6�t���	S���>ݺ*<�\�a�F�0��:�1|���Q��ᳬ��n�m]�r>��]���z֌����и'�=Q��X�!$�v�X2�c@��@㌙J}e�c���ρ�1�Pp'(~�����|KgZʻ�Z��e�����i.i���C�*+�o�}�C�03�|�w������h������½@Qޛ_N��������z��b� E�'�4ݎ�o�.(�"^�˱�۝��X����F-�$� &��?
`�؋A��9&H�N�|�'<�)�Zl���!�1�d�Y�7Є5N"��Aӕ�g��n��
ħ^��ÌV�^Gyaj��y�q����u&l���Z0,��i�Vܚϡ�I���P#��:�6� l�!T���'��7x��y��r���$}�t�D�'&��o`��X}�r�	�
��_�LAy?M���0<��W9��l^�e��j�Ya�+ܼӿ���MH����{�`�L��|U���]v]u�(�OJ�o �C7I�����+AO��j}LvNܾ�ۏj�J�ø�%z�v��OY1>I��T^�+8�-K��e* �(-!�5㢩�a�V�%���W|7����vh�q�p�Ys�\�����Rd]s%n;�P�"���nō�}��q��!�,��8,V<�Tty��<O��F��Z}�V����x�-��Vx/Z� l�>ȡpVZ������d��sq����INh�p5Gw��ma/Ա���B�2�6F��ha���b؏q���؜�0Xl� �h��C�и��ǩ=_�~k�����������	�I2�?kPL�m	�"�)�A��/�xi����cL�H�DO�T�J Tk�	��6Q����${��]�$�Pa��H��j��mQ�٪�0O�L{G��5����ٟ�#o��R�8"�'%hf��~h¯�x��P�re���ף��d6�	I�	h��=�>�I�O��� ~�&���Y�}T!�^&���[po����u��e���$L{>�q�|z��a���z��ǽ|�|!t5����{���R�a�/0�[�B%?EA�D�
Y��Z6�YɬD;�f�A���?Qn�X��n����@d�ø���|�k����X����;wX��~����9�s��=%(θ�����u�@�����P#ft毁��&���Y�؅9�[�u�C��T?��W!4JR��]
��Q�zQ���!�*X0���?m;s��Cq[�~�'P��������\��vN&X����>�b׸��]�6S�ײ�mi3��k��,�4��=�A�tf�M2ZL�ΖQk�~��ͬ���攺K=H����
�p����8�-�8�΋G�fKt~"u,a��Y���x��M�B�U��m�́$�wT���K1����Y����c��/`�|�ĺ��1���j�ȱ:]zY^��@�e��11S\���x3��@x�T(j"`�D诓) �t
�)��z���TQ�tY�i����~�P4cӋu�Z(BE�,��rU���' ��PB��A�6Tu�Ci�+��W�D�rx�g������(�ౌ��6�.;l�c��tS�
�I(�1`�:���z��ܸ�3GQ�H-s�Cߪ9�bw'�G�H��L68������:,e�I�EPK,���A��|�ђ��ԺP����N�N��D�~o#�by���
4�+�>��uU���:��\)�5ź�i��j���
���4�����!�V�0�u���Q+�Qǖ�:�ϟ)����A��g� t�sD����T����OVGáj_��z�j�����IP�]�H8?�Ԡ6�U�}��`ew �����j�d	x�S<�G����n��\��R�����/��Ś>�C<���*!�����?�	U���v(�;���!
�cdK�&~ĈTH����Qp�#��������(X����
o	G�^U��T�{F!h��ي�C}!ͣy}ͣ�D�m@u�1/hS@A	D{��X� G�B0����9x_W��@'i@<�� '�p���W�!^9!�j'(�����P�^�z �p��s:u���5�@F)گ��|��
T�)�Y�e��gV��Lf%�k6e����D�i�2g�:z���,
�S��p�ѠF�n6�r��S�a����9�_: �>��*�`��R���^�v��$aM����'������5��05�E��^���RA3��&�E��ݧ�^������D�3W/se�^u�ǵ�8���Ɔ?p5�x��U,9*��k���������W��������Zw��G��#�@��kyWMKK}���Z�)�ק����X�w �v���^U�蘑���Z�;jT	B;�\�0Ua �h�*C�=8H��j�2荫8اz���x#�ק�!����ñ��SQ��~	\���{�Jj	i^w0
Cz�x�sԨ�cj�!��qGC!-�ޢ���v��^Wh�
3`���^ȯ?��DC��#�n�*�$��co����B3��t���rEt� ��!u@ƃ��L]ŵu��8�Uj|-��k����-`�~(*)�|����rG�`��������e'�C��.�Klc5����PW�sE��RZjr_����j��i�}���8j�����xx�<TR�/ ��7WXxwk��S�t��L;�Y��TsNW0诰GBQmެY4`h��n�M��k��`:b���6*�io�m�+T�7�f�zg��n�K��N�_�
=���� 󂐾 4f3�uB_��7Q�3<���X Tm�w��N	wJC�b��$����e���m9�����aG@��Y�I xP�����c��Ѱ�`Y��]b������/n[N�����q�8�!b���`E\5�]57Tߏ��'2��839Lm�3ѿ���M����g�#����B���D�oaH�Q
�;����Ǜ'�x�u�&,�u�<ddQ�x>j��2Č��a]a/'ް�_ر :{d�C.�0=�()�A�E��L��;�3�m4���0���w�����!S��u�e�#�><�n�;��_oH�B���|�݀/�����#��%W�0���~��RICp�~�S�%�S��Cg�<��D��%nB��v��;u�F�O7��MÚ�� 6H*C#��Q�7���d��vs4�V.B;G-��ja���XU�L8	�q.H=s�i�r��d.�nI��[�Ö֥#و���NR��~�HIX?zx����v�P��6���A����P0��L�?�)��;�-�n���{�ZN���[wi1�%t8N<};���E疦��h�7�IF�>c�eahI�3�ÜM�.�8����ro���>��2�gjw0��m�������1W�;�hW��P����lX�s�m`�SO����]Ћ�x����zL���91�} �ο諣S��G<��舉��	��>��Ţ���Z�O!�,	A���% R�EzT����N��h�ڦ�V��Y8y'���I�j��enZ��7����*��>i�h@�������+X���������3/�����H{�B�7���	_X�~a��H�Z/�Lw���`z���:����f��'|}ELO[q���^����)z�/6�$3d�hC�
0����d�����JzX���-��O7����k��Lp�I�s��D�oa#vU\�	�>�3?�R\"V��1wP/\~>�tQ��Ř��4��2�s���S��?��ƅ�6���{WhߵЕ��t/nR���\�-x;�H,l򵶶9~���5[�)"ӣ�<������*'4�ݽ����럯��/Ӯ���*�,��^,m����Nl��Svy<�`f��A�)u�7����=R��3� ������ ����C̀�||bb��gFt��}]�M�����	i��?�p�6��D� ��ݹ!�+_Z'���hb'�m�p��l��ʃ&��.Q�`6pn	�� �W	8�� ��zwqݏ�6#�1o����p��ͷM���jO0�
G7�/�ԡ������ �u�ho�� �L�h&���b~��r��6i�ɝfOh_F��a��>�b�T�6o��0�E��a��p�O�;	Ke�B��c�0U`���W�F�">��=a��M�a���V�ޖ&93	c	���{<j'߷NާqsD����ѫ�E�m��^����t4R��8�Z"^]�W���	�}��\=Ch��Fp��W�Z�ݤ��V�M�!־W����E���BQ���0:]݉1nx;dc�ej
��j��v h�OkPP������hX��N��%�gXB��>̡��Г�	���{��B��t�~�D|�~�O">S�(o��J��o�������!�%����D|�{;��SI�y�}���|v,)~�~�S"~�~�S"����_��~!|ϖ��1_���[C���C�;���{�8�|�k��o՛|�������6���[�{����b��æ��C�Q��A����`S���kD�2���<�yY�k<t\���/b��-�{���MY��)Jr=�rj�`C�K��?�&��{z���o#�:.��א2�3�%���_Oq�S��R��'�N
�BS���MFMA�)����4%�W������dJ~��R�����i��[v�%�?���b��r��d{i����Ϫs{���K��s�����d)�o{Z��ɮ��7V'��Y��Lܩk��ufq�R'��� �D�c�m�Y'�`�lk!��2V�p����k��|��A��������W����ml�گv����6G�������7��n�ϗ�u�q�`|��\H(��4����u��N����1��M�/$�����nr"ᆸ�'��^��D���떙W�O�^7��ѡ��d�u����_64����&�(	?�{ݤ�+��e��w��?�{ER���_��$��@o��c,�p��������=��^8��88����X�_/��m��x�_�;b��8�ϟ�pr=�_�Ι"	_7���t�7�r��4���f�~�s�����߱$�O�^����':��¥+���&��SN�?"I#�3�8F�q)�����c�~��v��\��s���7�/�{�n��$�W�؏O�p�0l��;\���pM�9\lHL��S�?�#���y���46֧z�_Z���ju��n�A������o���
��s������XM-o����G#���fƩ���#��Ӳ������y��7\���O�w�w�8�ꬬ�����߮����"v�:mvV���8���}������|>�d�FM����4��kO���S]�U]mo���<��-v��=�;fVΨt4UA*Zo �ynmY�|��ڗ/RW�ٱ��ӡ�fM�K�g@z]���0�Ħ����"��-IHQ2m��D-��y���I���V���s�9���=� �� �  