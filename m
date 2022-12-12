Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AF764A9DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 22:58:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWFqR3yTzz3c6d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 08:57:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=2a03:4000:10:469::; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
X-Greylist: delayed 353 seconds by postgrey-1.36 at boromir; Tue, 13 Dec 2022 08:57:23 AEDT
Received: from lug-owl.de (lug-owl.de [IPv6:2a03:4000:10:469::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWFpq03vtz308b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 08:57:22 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id DFC8F42065; Mon, 12 Dec 2022 22:51:17 +0100 (CET)
Date: Mon, 12 Dec 2022 22:51:17 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xsj6ekjpchf7ijvi"
Content-Disposition: inline
X-Operating-System: Linux chamaeleon 5.14.0-0.bpo.2-amd64 
X-gpg-fingerprint: 250D 3BCF 7127 0D8C A444  A961 1DBD 5E75 8399 E1BB
X-gpg-key: wwwkeys.de.pgp.net
X-Echelon-Enable: howto poison arsenous mail psychological biological nuclear
 warfare test the bombastical terror of flooding the spy listeners explosion
 sex drugs and rock'n'roll
X-TKUeV: howto poison arsenous mail psychological biological nuclear warfare
 test the bombastical terror of flooding the spy listeners explosion sex
 drugs and rock'n'roll
X-message-flag: Please send plain text messages only. Do not send HTML
 emails. Thank you. 
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--xsj6ekjpchf7ijvi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Is anybody else routinely building current Binutils + GCC, to try to
build all the Linux defconfigs?  For PPC, a good number of those fail,
and I probably don't understand PPC well enough to propose patches. Or
did I pick wrongly targeted toolchains? Most of the time, my suspicion
is that we're not giving the correct -m<cpu> flags in
=2E/arch/powerpc/boot/?  (My setup for doing test builds is fairly automate=
d, I
can easily throw in patches for testing.)

64-bit.config
	  powerpc64-linux-gcc -Wp,-MD,arch/powerpc/boot/.opal-calls.o.d -D__ASSEMB=
LY__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing =
-O2 -msoft-float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-bu=
iltin -fPIC -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/gen=
erated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/=
generated/uapi -I./include/uapi -I./include/generated/uapi -include ./inclu=
de/linux/compiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=
=3Dpowerpc -isystem /var/lib/laminar/run/linux-powerpc-64-bit.config/12/too=
lchain/bin/../lib/gcc/powerpc64-linux/13.0.0/include -mbig-endian -nostdinc=
 -c -o arch/powerpc/boot/opal-calls.o arch/powerpc/boot/opal-calls.S
	arch/powerpc/boot/opal-calls.S: Assembler messages:
	arch/powerpc/boot/opal-calls.S:20: Error: unrecognized opcode: `ld'
	arch/powerpc/boot/opal-calls.S:21: Error: unrecognized opcode: `ld'
	arch/powerpc/boot/opal-calls.S:32: Error: unrecognized opcode: `std'
	arch/powerpc/boot/opal-calls.S:49: Error: unrecognized opcode: `ld'
	arch/powerpc/boot/opal-calls.S:50: Error: unrecognized opcode: `ld'
	arch/powerpc/boot/opal-calls.S:52: Error: unrecognized opcode: `hrfid'
	arch/powerpc/boot/opal-calls.S:55: Error: unrecognized opcode: `tdi'
	arch/powerpc/boot/opal-calls.S:58: Error: unrecognized opcode: `ld'
	make[1]: *** [arch/powerpc/boot/Makefile:232: arch/powerpc/boot/opal-calls=
=2Eo] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

	=3D=3D> Why "-m32 -mcpu=3Dpowerpc"? Binutils/GCC are for --target=3Dpowerp=
c64-linux

85xx-64bit.config
	  powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/kernel/vdso/.gettimeofday-64.o=
=2Ed -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated =
 -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
ed/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linu=
x/compiler-version.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./a=
rch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=3D./=3D -D__ASSEMBLY__ =
-fno-PIE -m64 -Wl,-a64 -mabi=3Delfv1 -Wa,-me500 -Wa,-me500mc -mabi=3Delfv1 =
-mbig-endian    -Wl,-soname=3Dlinux-vdso64.so.1 -D__VDSO64__ -s -c -o arch/=
powerpc/kernel/vdso/gettimeofday-64.o arch/powerpc/kernel/vdso/gettimeofday=
=2ES
	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
ld'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
ld'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
ld'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
ld'
	make[1]: *** [arch/powerpc/kernel/vdso/Makefile:76: arch/powerpc/kernel/vd=
so/gettimeofday-64.o] Error 1
	make: *** [arch/powerpc/Makefile:387: vdso_prepare] Error 2

85xx-hw.config
	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.epapr_hcalls.o.d -nostdi=
nc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include=
 -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./=
include/uapi -I./include/generated/uapi -include ./include/linux/compiler-v=
ersion.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerpc =
-fmacro-prefix-map=3D./=3D -D__ASSEMBLY__ -fno-PIE -m32 -Wl,-a32 -mcpu=3Dpo=
werpc -mbig-endian    -c -o arch/powerpc/kernel/epapr_hcalls.o arch/powerpc=
/kernel/epapr_hcalls.S=20
	arch/powerpc/kernel/epapr_hcalls.S: Assembler messages:
	arch/powerpc/kernel/epapr_hcalls.S:24: Error: unrecognized opcode: `wrteei'
	make[3]: *** [scripts/Makefile.build:382: arch/powerpc/kernel/epapr_hcalls=
=2Eo] Error 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
	make: *** [Makefile:1992: .] Error 2

asp8347_defconfig
	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.pmc.o.d -nostdinc -I./ar=
ch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch=
/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/u=
api -I./include/generated/uapi -include ./include/linux/compiler-version.h =
-include ./include/linux/kconfig.h -include ./include/linux/compiler_types.=
h -D__KERNEL__ -I ./arch/powerpc -fmacro-prefix-map=3D./=3D -Wall -Wundef -=
Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common =
-fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dim=
plicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 -mbig-en=
dian -m32 -msoft-float -pipe -ffixed-r2 -mmultiple -mno-readonly-in-sdata -=
mcpu=3Dpowerpc -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fno=
-asynchronous-unwind-tables -mno-string -mbig-endian -mstack-protector-guar=
d=3Dtls -mstack-protector-guard-reg=3Dr2 -fno-delete-null-pointer-checks -W=
no-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-o=
f-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=3D1024 =
-fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unused=
-const-variable -Wno-dangling-pointer -fomit-frame-pointer -ftrivial-auto-v=
ar-init=3Dzero -fno-stack-clash-protection -Wdeclaration-after-statement -W=
vla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-st=
ringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larg=
er-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-stack-check -f=
conserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -Wno-packed-not-aligned -mstack-protector-guard-offs=
et=3D544 -Werror    -DKBUILD_MODFILE=3D'"arch/powerpc/kernel/pmc"' -DKBUILD=
_BASENAME=3D'"pmc"' -DKBUILD_MODNAME=3D'"pmc"' -D__KBUILD_MODNAME=3Dkmod_pm=
c -c -o arch/powerpc/kernel/pmc.o arch/powerpc/kernel/pmc.c =20
	{standard input}: Assembler messages:
	{standard input}:26: Error: unrecognized opcode: `mfpmr'
	{standard input}:32: Error: unrecognized opcode: `mtpmr'
	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/kernel/pmc.o] Error=
 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
	make: *** [Makefile:1992: .] Error 2

bamboo_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-bamboo_defconfig/12/toolchain/bin=
/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector =
-include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./ar=
ch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arch=
/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

cell_defconfig
	  powerpc64-linux-gcc -Wp,-MD,arch/powerpc/boot/.pseries-head.o.d -D__ASSE=
MBLY__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasin=
g -O2 -msoft-float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-=
builtin -fPIC -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/g=
enerated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/includ=
e/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./inc=
lude/linux/compiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=
=3Dpowerpc -isystem /var/lib/laminar/run/linux-powerpc-cell_defconfig/12/to=
olchain/bin/../lib/gcc/powerpc64-linux/13.0.0/include -mbig-endian -nostdin=
c -c -o arch/powerpc/boot/pseries-head.o arch/powerpc/boot/pseries-head.S
	arch/powerpc/boot/pseries-head.S: Assembler messages:
	arch/powerpc/boot/pseries-head.S:8: Error: unrecognized opcode: `tdi'
	make[1]: *** [arch/powerpc/boot/Makefile:232: arch/powerpc/boot/pseries-he=
ad.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

ebony_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-ebony_defconfig/12/toolchain/bin/=
=2E./lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector=
 -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./a=
rch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arc=
h/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

ge_imp3a_defconfig
	  powerpc-linux-gcc -Wp,-MMD,drivers/ata/.libahci.o.d -nostdinc -I./arch/p=
owerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/pow=
erpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi =
-I./include/generated/uapi -include ./include/linux/compiler-version.h -inc=
lude ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D=
__KERNEL__ -I ./arch/powerpc -fmacro-prefix-map=3D./=3D -Wall -Wundef -Werr=
or=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fsh=
ort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplic=
it-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 -mbig-endian=
 -m32 -msoft-float -pipe -ffixed-r2 -mmultiple -mno-readonly-in-sdata -mcpu=
=3D8540 -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fno-asynch=
ronous-unwind-tables -mno-string -Wa,-me500 -mbig-endian -mstack-protector-=
guard=3Dtls -mstack-protector-guard-reg=3Dr2 -fno-delete-null-pointer-check=
s -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addre=
ss-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=3D1=
024 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-un=
used-const-variable -Wno-dangling-pointer -fomit-frame-pointer -ftrivial-au=
to-var-init=3Dzero -fno-stack-clash-protection -Wdeclaration-after-statemen=
t -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wn=
o-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-=
larger-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-stack-chec=
k -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types=
 -Werror=3Ddesignated-init -Wno-packed-not-aligned -mstack-protector-guard-=
offset=3D792    -DKBUILD_MODFILE=3D'"drivers/ata/libahci"' -DKBUILD_BASENAM=
E=3D'"libahci"' -DKBUILD_MODNAME=3D'"libahci"' -D__KBUILD_MODNAME=3Dkmod_li=
bahci -c -o drivers/ata/libahci.o drivers/ata/libahci.c =20
	In file included from <command-line>:
	drivers/ata/libahci.c: In function 'ahci_led_store':
	././include/linux/compiler_types.h:357:45: error: call to '__compiletime_a=
ssert_297' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) >=
 sizeof(long)
	  357 |         _compiletime_assert(condition, msg, __compiletime_assert_,=
 __COUNTER__)
	      |                                             ^
	././include/linux/compiler_types.h:338:25: note: in definition of macro '_=
_compiletime_assert'
	  338 |                         prefix ## suffix();                       =
      \
	      |                         ^~~~~~
	././include/linux/compiler_types.h:357:9: note: in expansion of macro '_co=
mpiletime_assert'
	  357 |         _compiletime_assert(condition, msg, __compiletime_assert_,=
 __COUNTER__)
	      |         ^~~~~~~~~~~~~~~~~~~
	./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
	   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), ms=
g)
	      |                                     ^~~~~~~~~~~~~~~~~~
	./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
	   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condi=
tion)
	      |         ^~~~~~~~~~~~~~~~
	./include/linux/nospec.h:58:9: note: in expansion of macro 'BUILD_BUG_ON'
	   58 |         BUILD_BUG_ON(sizeof(_s) > sizeof(long));                  =
      \
	      |         ^~~~~~~~~~~~
	drivers/ata/libahci.c:1198:23: note: in expansion of macro 'array_index_no=
spec'
	 1198 |                 pmp =3D array_index_nospec(pmp, EM_MAX_SLOTS);
	      |                       ^~~~~~~~~~~~~~~~~~
	make[3]: *** [scripts/Makefile.build:250: drivers/ata/libahci.o] Error 1
	make[2]: *** [scripts/Makefile.build:500: drivers/ata] Error 2
	make[1]: *** [scripts/Makefile.build:500: drivers] Error 2
	make: *** [Makefile:1992: .] Error 2

	=3D=3D> That's probably an unrelated issue, seen similarly for other build=
s.

guest.config
	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.epapr_hcalls.o.d -nostdi=
nc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include=
 -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./=
include/uapi -I./include/generated/uapi -include ./include/linux/compiler-v=
ersion.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerpc =
-fmacro-prefix-map=3D./=3D -D__ASSEMBLY__ -fno-PIE -m32 -Wl,-a32 -mcpu=3Dpo=
werpc -mbig-endian    -c -o arch/powerpc/kernel/epapr_hcalls.o arch/powerpc=
/kernel/epapr_hcalls.S=20
	arch/powerpc/kernel/epapr_hcalls.S: Assembler messages:
	arch/powerpc/kernel/epapr_hcalls.S:24: Error: unrecognized opcode: `wrteei'
	make[3]: *** [scripts/Makefile.build:382: arch/powerpc/kernel/epapr_hcalls=
=2Eo] Error 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
	make: *** [Makefile:1992: .] Error 2

katmai_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-katmai_defconfig/12/toolchain/bin=
/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector =
-include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./ar=
ch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arch=
/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

mvme5100_defconfig
	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.epapr_hcalls.o.d -nostdi=
nc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include=
 -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./=
include/uapi -I./include/generated/uapi -include ./include/linux/compiler-v=
ersion.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerpc =
-fmacro-prefix-map=3D./=3D -D__ASSEMBLY__ -fno-PIE -m32 -Wl,-a32 -mcpu=3Dpo=
werpc -mbig-endian    -c -o arch/powerpc/kernel/epapr_hcalls.o arch/powerpc=
/kernel/epapr_hcalls.S=20
	arch/powerpc/kernel/epapr_hcalls.S: Assembler messages:
	arch/powerpc/kernel/epapr_hcalls.S:24: Error: unrecognized opcode: `wrteei'
	make[3]: *** [scripts/Makefile.build:382: arch/powerpc/kernel/epapr_hcalls=
=2Eo] Error 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
	make: *** [Makefile:1992: .] Error 2

powernv_defconfig
	  powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/lib/.sstep.o.d -nostdinc -I./a=
rch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arc=
h/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/=
uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h=
 -include ./include/linux/kconfig.h -include ./include/linux/compiler_types=
=2Eh -D__KERNEL__ -I ./arch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=
=3D./=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-securi=
ty -std=3Dgnu11 -mlittle-endian -m64 -msoft-float -pipe -mtraceback=3Dno -m=
abi=3Delfv2 -mcmodel=3Dmedium -mno-pointers-to-nested-functions -mcpu=3Dpow=
er8 -mtune=3Dpower10 -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mm=
a -fno-asynchronous-unwind-tables -mno-string -Wa,-maltivec -Wa,-mpower4 -W=
a,-many -mno-strict-align -mlittle-endian -mstack-protector-guard=3Dtls -ms=
tack-protector-guard-reg=3Dr13 -fno-delete-null-pointer-checks -Wno-frame-a=
ddress -Wno-format-truncation -Wno-format-overflow -Wno-address-of-packed-m=
ember -O2 -fno-allow-store-data-races -Wframe-larger-than=3D2048 -fstack-pr=
otector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-var=
iable -Wno-dangling-pointer -ftrivial-auto-var-init=3Dzero -fno-stack-clash=
-protection -pg -mprofile-kernel -Wdeclaration-after-statement -Wvla -Wno-p=
ointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-ove=
rflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than -W=
implicit-fallthrough=3D5 -fno-strict-overflow -fno-stack-check -fconserve-s=
tack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddes=
ignated-init -Wno-packed-not-aligned -mstack-protector-guard-offset=3D3184 =
-Werror    -DKBUILD_MODFILE=3D'"arch/powerpc/lib/sstep"' -DKBUILD_BASENAME=
=3D'"sstep"' -DKBUILD_MODNAME=3D'"sstep"' -D__KBUILD_MODNAME=3Dkmod_sstep -=
c -o arch/powerpc/lib/sstep.o arch/powerpc/lib/sstep.c =20
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside =
array bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  286 |                 up[0] =3D byterev_8(up[3]);
	      |                         ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' =
of size 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside =
array bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  287 |                 up[3] =3D tmp;
	      |                 ~~~~~~^~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' =
of size 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array=
 bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  288 |                 tmp =3D byterev_8(up[2]);
	      |                       ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of siz=
e 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array=
 bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  289 |                 up[2] =3D byterev_8(up[1]);
	      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of siz=
e 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside =
array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=
=3D]
	  286 |                 up[0] =3D byterev_8(up[3]);
	      |                         ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside =
array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=
=3D]
	  287 |                 up[3] =3D tmp;
	      |                 ~~~~~~^~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array=
 bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=3D]
	  288 |                 tmp =3D byterev_8(up[2]);
	      |                       ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array=
 bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=3D]
	  289 |                 up[2] =3D byterev_8(up[1]);
	      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	cc1: all warnings being treated as errors
	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/lib/sstep.o] Error 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/lib] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
	make: *** [Makefile:1992: .] Error 2

ppc44x_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-ppc44x_defconfig/12/toolchain/bin=
/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector =
-include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./ar=
ch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arch=
/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

ppc64_defconfig
	  powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/lib/.sstep.o.d -nostdinc -I./a=
rch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arc=
h/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/=
uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h=
 -include ./include/linux/kconfig.h -include ./include/linux/compiler_types=
=2Eh -D__KERNEL__ -I ./arch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=
=3D./=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-securi=
ty -std=3Dgnu11 -mbig-endian -m64 -msoft-float -pipe -mtraceback=3Dno -mabi=
=3Delfv1 -mcall-aixdesc -mcmodel=3Dmedium -mno-pointers-to-nested-functions=
 -mcpu=3Dpower4 -mtune=3Dpower10 -mno-prefixed -mno-pcrel -mno-altivec -mno=
-vsx -mno-mma -fno-asynchronous-unwind-tables -mno-string -Wa,-maltivec -Wa=
,-mpower4 -Wa,-many -mabi=3Delfv1 -mcall-aixdesc -mbig-endian -mstack-prote=
ctor-guard=3Dtls -mstack-protector-guard-reg=3Dr13 -fno-delete-null-pointer=
-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno=
-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-th=
an=3D2048 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -=
Wno-unused-const-variable -Wno-dangling-pointer -ftrivial-auto-var-init=3Dz=
ero -fno-stack-clash-protection -pg -Wdeclaration-after-statement -Wvla -Wn=
o-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-=
overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than=
 -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-stack-check -fconserv=
e-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3D=
designated-init -Wno-packed-not-aligned -mstack-protector-guard-offset=3D31=
92 -Werror    -DKBUILD_MODFILE=3D'"arch/powerpc/lib/sstep"' -DKBUILD_BASENA=
ME=3D'"sstep"' -DKBUILD_MODNAME=3D'"sstep"' -D__KBUILD_MODNAME=3Dkmod_sstep=
 -c -o arch/powerpc/lib/sstep.o arch/powerpc/lib/sstep.c =20
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside =
array bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  286 |                 up[0] =3D byterev_8(up[3]);
	      |                         ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' =
of size 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside =
array bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  287 |                 up[3] =3D tmp;
	      |                 ~~~~~~^~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' =
of size 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array=
 bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  288 |                 tmp =3D byterev_8(up[2]);
	      |                       ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of siz=
e 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array=
 bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  289 |                 up[2] =3D byterev_8(up[1]);
	      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of siz=
e 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside =
array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=
=3D]
	  286 |                 up[0] =3D byterev_8(up[3]);
	      |                         ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside =
array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=
=3D]
	  287 |                 up[3] =3D tmp;
	      |                 ~~~~~~^~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array=
 bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=3D]
	  288 |                 tmp =3D byterev_8(up[2]);
	      |                       ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array=
 bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=3D]
	  289 |                 up[2] =3D byterev_8(up[1]);
	      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	cc1: all warnings being treated as errors
	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/lib/sstep.o] Error 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/lib] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
	make: *** [Makefile:1992: .] Error 2

ppc64e_defconfig
	  powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/kernel/vdso/.gettimeofday-64.o=
=2Ed -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated =
 -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
ed/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linu=
x/compiler-version.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./a=
rch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=3D./=3D -D__ASSEMBLY__ =
-fno-PIE -m64 -Wl,-a64 -mabi=3Delfv1 -Wa,-me500 -Wa,-me500mc -mabi=3Delfv1 =
-mbig-endian    -Wl,-soname=3Dlinux-vdso64.so.1 -D__VDSO64__ -s -c -o arch/=
powerpc/kernel/vdso/gettimeofday-64.o arch/powerpc/kernel/vdso/gettimeofday=
=2ES
	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
tdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `s=
td'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: `l=
d'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
ld'
	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode: `=
ld'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
stdu'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
std'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
ld'
	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode: `=
ld'
	make[1]: *** [arch/powerpc/kernel/vdso/Makefile:76: arch/powerpc/kernel/vd=
so/gettimeofday-64.o] Error 1
	make: *** [arch/powerpc/Makefile:387: vdso_prepare] Error 2

pseries_defconfig
	  powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/lib/.sstep.o.d -nostdinc -I./a=
rch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./arc=
h/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/=
uapi -I./include/generated/uapi -include ./include/linux/compiler-version.h=
 -include ./include/linux/kconfig.h -include ./include/linux/compiler_types=
=2Eh -D__KERNEL__ -I ./arch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=
=3D./=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-stri=
ct-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-=
declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-securi=
ty -std=3Dgnu11 -mbig-endian -m64 -msoft-float -pipe -mtraceback=3Dno -mabi=
=3Delfv1 -mcall-aixdesc -mcmodel=3Dmedium -mno-pointers-to-nested-functions=
 -mcpu=3Dpower4 -mtune=3Dpower10 -mno-prefixed -mno-pcrel -mno-altivec -mno=
-vsx -mno-mma -fno-asynchronous-unwind-tables -mno-string -Wa,-maltivec -Wa=
,-mpower4 -Wa,-many -mabi=3Delfv1 -mcall-aixdesc -mbig-endian -mstack-prote=
ctor-guard=3Dtls -mstack-protector-guard-reg=3Dr13 -fno-delete-null-pointer=
-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno=
-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-th=
an=3D2048 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -=
Wno-unused-const-variable -Wno-dangling-pointer -ftrivial-auto-var-init=3Dz=
ero -fno-stack-clash-protection -pg -Wdeclaration-after-statement -Wvla -Wn=
o-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno-stringop-=
overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-larger-than=
 -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-stack-check -fconserv=
e-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3D=
designated-init -Wno-packed-not-aligned -mstack-protector-guard-offset=3D31=
92 -Werror    -DKBUILD_MODFILE=3D'"arch/powerpc/lib/sstep"' -DKBUILD_BASENA=
ME=3D'"sstep"' -DKBUILD_MODNAME=3D'"sstep"' -D__KBUILD_MODNAME=3Dkmod_sstep=
 -c -o arch/powerpc/lib/sstep.o arch/powerpc/lib/sstep.c =20
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside =
array bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  286 |                 up[0] =3D byterev_8(up[3]);
	      |                         ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' =
of size 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside =
array bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  287 |                 up[3] =3D tmp;
	      |                 ~~~~~~^~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' =
of size 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array=
 bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  288 |                 tmp =3D byterev_8(up[2]);
	      |                       ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of siz=
e 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
	arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array=
 bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
	  289 |                 up[2] =3D byterev_8(up[1]);
	      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of siz=
e 16
	  708 |         } u;
	      |           ^
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside =
array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=
=3D]
	  286 |                 up[0] =3D byterev_8(up[3]);
	      |                         ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside =
array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=
=3D]
	  287 |                 up[3] =3D tmp;
	      |                 ~~~~~~^~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' =
of size 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array=
 bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=3D]
	  288 |                 tmp =3D byterev_8(up[2]);
	      |                       ^~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	In function 'do_byte_reverse',
	    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
	arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array=
 bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=3Darray-bounds=3D]
	  289 |                 up[2] =3D byterev_8(up[1]);
	      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	  681 |         } u =3D {};
	      |           ^
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of siz=
e 16
	cc1: all warnings being treated as errors
	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/lib/sstep.o] Error 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/lib] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2

adder875_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-rainier_defconfig/12/toolchain/bi=
n/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector=
 -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./a=
rch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arc=
h/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

rainier_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-rainier_defconfig/12/toolchain/bi=
n/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector=
 -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./a=
rch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arc=
h/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

sam440ep_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-sam440ep_defconfig/12/toolchain/b=
in/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protecto=
r -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./=
arch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o ar=
ch/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

sequoia_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-sequoia_defconfig/12/toolchain/bi=
n/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector=
 -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./a=
rch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arc=
h/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

taishan_defconfig
	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wall =
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msoft-=
float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fPIC=
 -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I.=
/include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/u=
api -I./include/uapi -I./include/generated/uapi -include ./include/linux/co=
mpiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc -i=
system /var/lib/laminar/run/linux-powerpc-taishan_defconfig/12/toolchain/bi=
n/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protector=
 -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./a=
rch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o arc=
h/powerpc/boot/treeboot-akebono.c
	{standard input}: Assembler messages:
	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot-a=
kebono.o] Error 1
	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

xes_mpc85xx_defconfig
	  powerpc-linux-gcc -Wp,-MMD,drivers/ata/.libahci.o.d -nostdinc -I./arch/p=
owerpc/include -I./arch/powerpc/include/generated  -I./include -I./arch/pow=
erpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include/uapi =
-I./include/generated/uapi -include ./include/linux/compiler-version.h -inc=
lude ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D=
__KERNEL__ -I ./arch/powerpc -fmacro-prefix-map=3D./=3D -Wall -Wundef -Werr=
or=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fsh=
ort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplic=
it-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 -mbig-endian=
 -m32 -msoft-float -pipe -ffixed-r2 -mmultiple -mno-readonly-in-sdata -mcpu=
=3D8540 -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fno-asynch=
ronous-unwind-tables -mno-string -Wa,-me500 -mbig-endian -mstack-protector-=
guard=3Dtls -mstack-protector-guard-reg=3Dr2-fno-delete-null-pointer-checks=
 -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-addres=
s-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=3D10=
24 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wno-unu=
sed-const-variable -Wno-dangling-pointer -fomit-frame-pointer -ftrivial-aut=
o-var-init=3Dzero -fno-stack-clash-protection -Wdeclaration-after-statement=
 -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation -Wno=
-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-size-l=
arger-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-stack-check=
 -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Werror=3Ddesignated-init -Wno-packed-not-aligned -mstack-protector-guard-o=
ffset=3D768    -DKBUILD_MODFILE=3D'"drivers/ata/libahci"' -DKBUILD_BASENAME=
=3D'"libahci"' -DKBUILD_MODNAME=3D'"libahci"' -D__KBUILD_MODNAME=3Dkmod_lib=
ahci -c -o drivers/ata/libahci.o drivers/ata/libahci.c =20
	In file included from <command-line>:
	drivers/ata/libahci.c: In function 'ahci_led_store':
	././include/linux/compiler_types.h:357:45: error: call to '__compiletime_a=
ssert_295' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) >=
 sizeof(long)
	  357 |         _compiletime_assert(condition, msg, __compiletime_assert_,=
 __COUNTER__)
	      |                                             ^
	././include/linux/compiler_types.h:338:25: note: in definition of macro '_=
_compiletime_assert'
	  338 |                         prefix ## suffix();                       =
      \
	      |                         ^~~~~~
	././include/linux/compiler_types.h:357:9: note: in expansion of macro '_co=
mpiletime_assert'
	  357 |         _compiletime_assert(condition, msg, __compiletime_assert_,=
 __COUNTER__)
	      |         ^~~~~~~~~~~~~~~~~~~
	./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletim=
e_assert'
	   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), ms=
g)
	      |                                     ^~~~~~~~~~~~~~~~~~
	./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
	   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condi=
tion)
	      |         ^~~~~~~~~~~~~~~~
	./include/linux/nospec.h:58:9: note: in expansion of macro 'BUILD_BUG_ON'
	   58 |         BUILD_BUG_ON(sizeof(_s) > sizeof(long));                  =
      \
	      |         ^~~~~~~~~~~~
	drivers/ata/libahci.c:1198:23: note: in expansion of macro 'array_index_no=
spec'
	 1198 |                 pmp =3D array_index_nospec(pmp, EM_MAX_SLOTS);
	      |                       ^~~~~~~~~~~~~~~~~~
	make[3]: *** [scripts/Makefile.build:250: drivers/ata/libahci.o] Error 1
	make[2]: *** [scripts/Makefile.build:500: drivers/ata] Error 2
	make[1]: *** [scripts/Makefile.build:500: drivers] Error 2
	make: *** [Makefile:1992: .] Error 2

currituck_defconfig
ep8248e_defconfig
ep88xc_defconfig
fsl-emb-nonhw.config
fsp2_defconfig
iss476-smp_defconfig
lite5200b_defconfig
mgcoge_defconfig
motionpro_defconfig
mpc5200_defconfig
mpc8272_ads_defconfig
mpc885_ads_defconfig
ppc6xx_defconfig
pq2fads_defconfig
ps3_defconfig
akebono_defconfig
tqm5200_defconfig
tqm8xx_defconfig
warp_defconfig
	Compiler ICEs (during GIMPLE pass: ccp) in align.c:

	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.align.o.d -nostdinc -I./=
arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./ar=
ch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./include=
/uapi -I./include/generated/uapi -include ./include/linux/compiler-version.=
h -include ./include/linux/kconfig.h -include ./include/linux/compiler_type=
s.h -D__KERNEL__ -I ./arch/powerpc -fmacro-prefix-map=3D./=3D -Wall -Wundef=
 -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-commo=
n -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3D=
implicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 -mbig-=
endian -m32 -msoft-float -pipe -ffixed-r2 -mmultiple -mno-readonly-in-sdata=
 -mcpu=3D440 -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fno-a=
synchronous-unwind-tables -mno-string -Wa,-m440 -mbig-endian -mstack-protec=
tor-guard=3Dtls -mstack-protector-guard-reg=3Dr2 -fno-delete-null-pointer-c=
hecks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-a=
ddress-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-than=
=3D1024 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable -Wn=
o-unused-const-variable -Wno-dangling-pointer -fomit-frame-pointer -ftrivia=
l-auto-var-init=3Dzero -fno-stack-clash-protection -Wdeclaration-after-stat=
ement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncation=
 -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-alloc-s=
ize-larger-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-stack-=
check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-t=
ypes -Werror=3Ddesignated-init -Wno-packed-not-aligned -g -mstack-protector=
-guard-offset=3D1080 -Werror    -DKBUILD_MODFILE=3D'"arch/powerpc/kernel/al=
ign"' -DKBUILD_BASENAME=3D'"align"' -DKBUILD_MODNAME=3D'"align"' -D__KBUILD=
_MODNAME=3Dkmod_align -c -o arch/powerpc/kernel/align.o arch/powerpc/kernel=
/align.c =20
	during GIMPLE pass: ccp
	arch/powerpc/kernel/align.c: In function '__copy_inst_from_kernel_nofault':
	arch/powerpc/kernel/align.c:364:1: internal compiler error: in maybe_regis=
ter_def, at tree-into-ssa.cc:1948
	  364 | }
	      | ^
	0x19d8886 internal_error(char const*, ...)
	   ???:0
	0x7bb4fe fancy_abort(char const*, int, char const*)
	   ???:0
	0x1791bfe dom_walker::walk(basic_block_def*)
	   ???:0
	0xe94ec0 update_ssa(unsigned int)
	   ???:0
	0x103d6b9 execute_update_addresses_taken()
	   ???:0
	Please submit a full bug report, with preprocessed source (by using -frepo=
rt-bug).
	Please include the complete backtrace with any bug report.
	See <https://gcc.gnu.org/bugs/> for instructions.
	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/kernel/align.o] Err=
or 1
	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error 2
	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
	make: *** [Makefile:1992: .] Error 2

	=3D=3D> Should probably open a PR for this.

Thanks for any pointers!

MfG, JBG

--=20

--xsj6ekjpchf7ijvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5eiUgAKCRAdvV51g5nh
uwL8AJ4pkyBvABgfXmXu3LzuklTjFHbQTACgiAUTfsULBcbY19odmBXzl8JhVvM=
=a5GX
-----END PGP SIGNATURE-----

--xsj6ekjpchf7ijvi--
