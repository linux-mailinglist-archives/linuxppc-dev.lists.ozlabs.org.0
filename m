Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B4464AE72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 04:50:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWPf02Pydz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 14:50:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o01DC711;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWPd520mXz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 14:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o01DC711;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NWPd0736pz4xVH;
	Tue, 13 Dec 2022 14:49:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1670903365;
	bh=9494SkRD/VvidYuUcER3qWqJFR2t/EvhcpogQ4CbiGA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=o01DC711LzjTiNloSsyDxwlcti1uYqUfmO0Q39z/lHLpCzf5DRzZOQtgV6bda4v+i
	 yrh+i/wOXwCUZVQYJFcCSrB26Gt45BNThBi2Ax5bcGkMyDZ2gVKBvAUq61aDd9D2iq
	 2uniIyNFAKp+2q3o/mwKKp7HB9UlaRz7xz0lOERpq4yxdcYSNL4NZATM+Ndt2JvD+9
	 gDh5K/bi5xj5I8CxfpVb9Ys+0jxjm0Vn14K4GbhcD06LOP5bzfmEv1jr3FZfdq/Q93
	 3gZPsupmuYjHUHo7zfrtCYi//egM5jAMIGXs1ad3EpsrchIAt3FKBG3andXUrk6j4q
	 BxfhWptldrXFg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Mass-building defconfigs: many fail with assembler errors
In-Reply-To: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
Date: Tue, 13 Dec 2022 14:49:20 +1100
Message-ID: <87bko8j73z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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

Jan-Benedict Glaw <jbglaw@lug-owl.de> writes:
> Hi!
>
> Is anybody else routinely building current Binutils + GCC, to try to
> build all the Linux defconfigs?

I did for several years, but eventually stopped because it was taking
too much time I needed to spend on other things.

> For PPC, a good number of those fail,
> and I probably don't understand PPC well enough to propose patches. Or
> did I pick wrongly targeted toolchains? Most of the time, my suspicion
> is that we're not giving the correct -m<cpu> flags in
> ./arch/powerpc/boot/?  (My setup for doing test builds is fairly automate=
d, I
> can easily throw in patches for testing.)

All the results against <something>.config are invalid or at least
dubious. Those files are not standalone defconfigs, they're fragments of
defconfigs that are assembled together by arch/powerpc/Makefile using
merge_config.sh.

So your script should exclude all files that end in ".config".

To find the names of the generated configs you can use something like:

 $ awk '/PHONY \+=3D .*config/ {print $3}' arch/powerpc/Makefile

> 64-bit.config
> 	  powerpc64-linux-gcc -Wp,-MD,arch/powerpc/boot/.opal-calls.o.d -D__ASSE=
MBLY__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasin=
g -O2 -msoft-float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-=
builtin -fPIC -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/g=
enerated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/includ=
e/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./inc=
lude/linux/compiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=
=3Dpowerpc -isystem /var/lib/laminar/run/linux-powerpc-64-bit.config/12/too=
lchain/bin/../lib/gcc/powerpc64-linux/13.0.0/include -mbig-endian -nostdinc=
 -c -o arch/powerpc/boot/opal-calls.o arch/powerpc/boot/opal-calls.S
> 	arch/powerpc/boot/opal-calls.S: Assembler messages:
> 	arch/powerpc/boot/opal-calls.S:20: Error: unrecognized opcode: `ld'
> 	arch/powerpc/boot/opal-calls.S:21: Error: unrecognized opcode: `ld'
> 	arch/powerpc/boot/opal-calls.S:32: Error: unrecognized opcode: `std'
> 	arch/powerpc/boot/opal-calls.S:49: Error: unrecognized opcode: `ld'
> 	arch/powerpc/boot/opal-calls.S:50: Error: unrecognized opcode: `ld'
> 	arch/powerpc/boot/opal-calls.S:52: Error: unrecognized opcode: `hrfid'
> 	arch/powerpc/boot/opal-calls.S:55: Error: unrecognized opcode: `tdi'
> 	arch/powerpc/boot/opal-calls.S:58: Error: unrecognized opcode: `ld'
> 	make[1]: *** [arch/powerpc/boot/Makefile:232: arch/powerpc/boot/opal-cal=
ls.o] Error 1
> 	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

...

> bamboo_defconfig
> 	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -Wal=
l -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -msof=
t-float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -fP=
IC -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -=
I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated=
/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/=
compiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerpc =
-isystem /var/lib/laminar/run/linux-powerpc-bamboo_defconfig/12/toolchain/b=
in/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protecto=
r -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I./=
arch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.o ar=
ch/powerpc/boot/treeboot-akebono.c
> 	{standard input}: Assembler messages:
> 	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
> 	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
> 	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
> 	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
> 	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treeboot=
-akebono.o] Error 1
> 	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

Both treeboot-akebono.c and treeboot-currituck.c are for 476 so should
probably be built with -mcpu=3D476. eg:

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index d32d95aea5d6..acb6eddace8f 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -88,8 +88,8 @@ $(obj)/cuboot-taishan.o: BOOTCFLAGS +=3D -mcpu=3D440
 $(obj)/cuboot-katmai.o: BOOTCFLAGS +=3D -mcpu=3D440
 $(obj)/cuboot-acadia.o: BOOTCFLAGS +=3D -mcpu=3D405
 $(obj)/treeboot-iss4xx.o: BOOTCFLAGS +=3D -mcpu=3D405
-$(obj)/treeboot-currituck.o: BOOTCFLAGS +=3D -mcpu=3D405
-$(obj)/treeboot-akebono.o: BOOTCFLAGS +=3D -mcpu=3D405
+$(obj)/treeboot-currituck.o: BOOTCFLAGS +=3D -mcpu=3D476
+$(obj)/treeboot-akebono.o: BOOTCFLAGS +=3D -mcpu=3D476
=20
 # The pre-boot decompressors pull in a lot of kernel headers and other sou=
rce
 # files. This creates a bit of a dependency headache since we need to copy


> cell_defconfig
> 	  powerpc64-linux-gcc -Wp,-MD,arch/powerpc/boot/.pseries-head.o.d -D__AS=
SEMBLY__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -O2 -msoft-float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fn=
o-builtin -fPIC -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include=
/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/incl=
ude/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./i=
nclude/linux/compiler-version.h -include ./include/linux/kconfig.h -m32 -mc=
pu=3Dpowerpc -isystem /var/lib/laminar/run/linux-powerpc-cell_defconfig/12/=
toolchain/bin/../lib/gcc/powerpc64-linux/13.0.0/include -mbig-endian -nostd=
inc -c -o arch/powerpc/boot/pseries-head.o arch/powerpc/boot/pseries-head.S
> 	arch/powerpc/boot/pseries-head.S: Assembler messages:
> 	arch/powerpc/boot/pseries-head.S:8: Error: unrecognized opcode: `tdi'
> 	make[1]: *** [arch/powerpc/boot/Makefile:232: arch/powerpc/boot/pseries-=
head.o] Error 1
> 	make: *** [arch/powerpc/Makefile:247: zImage] Error 2

I guess it's complaining about tdi in 32-bit code.

Except that tdi is in the FIXUP_ENDIAN macro. Not sure how we fix that.

> powernv_defconfig
> 	  powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/lib/.sstep.o.d -nostdinc -I.=
/arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./a=
rch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./includ=
e/uapi -I./include/generated/uapi -include ./include/linux/compiler-version=
.h -include ./include/linux/kconfig.h -include ./include/linux/compiler_typ=
es.h -D__KERNEL__ -I ./arch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=
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
c -o arch/powerpc/lib/sstep.o arch/powerpc/lib/sstep.c=20=20
> 	In function 'do_byte_reverse',
> 	    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
> 	    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
> 	arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outsid=
e array bounds of 'union <anonymous>[1]' [-Werror=3Darray-bounds=3D]
> 	  286 |                 up[0] =3D byterev_8(up[3]);
> 	      |                         ^~~~~~~~~~~~~~~~

I've seen this one before, prior to array-bounds being disabled upstream.

The code is not actually buggy AFAICS, but it is quite complicated and reli=
es on
the caller passing the correct size array to match the nb argument,
which is fairly fragile.

I'd be happy for it to be rewritten.

> ppc64e_defconfig
> 	  powerpc64-linux-gcc -Wp,-MMD,arch/powerpc/kernel/vdso/.gettimeofday-64=
.o.d -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated =
 -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
ed/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linu=
x/compiler-version.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./a=
rch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=3D./=3D -D__ASSEMBLY__ =
-fno-PIE -m64 -Wl,-a64 -mabi=3Delfv1 -Wa,-me500 -Wa,-me500mc -mabi=3Delfv1 =
-mbig-endian    -Wl,-soname=3Dlinux-vdso64.so.1 -D__VDSO64__ -s -c -o arch/=
powerpc/kernel/vdso/gettimeofday-64.o arch/powerpc/kernel/vdso/gettimeofday=
.S
> 	arch/powerpc/kernel/vdso/gettimeofday.S: Assembler messages:
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: =
`stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: =
`stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: =
`std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: =
`std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: =
`ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:72: Error: unrecognized opcode: =
`ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: =
`stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: =
`stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: =
`std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: =
`std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: =
`ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:82: Error: unrecognized opcode: =
`ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode:=
 `stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode:=
 `stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode:=
 `std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode:=
 `std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode:=
 `ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:104: Error: unrecognized opcode:=
 `ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode:=
 `stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode:=
 `stdu'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode:=
 `std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode:=
 `std'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode:=
 `ld'
> 	arch/powerpc/kernel/vdso/gettimeofday.S:115: Error: unrecognized opcode:=
 `ld'
> 	make[1]: *** [arch/powerpc/kernel/vdso/Makefile:76: arch/powerpc/kernel/=
vdso/gettimeofday-64.o] Error 1
> 	make: *** [arch/powerpc/Makefile:387: vdso_prepare] Error 2


I'm guessing but possibly fixed by:
  http://patchwork.ozlabs.org/project/linuxppc-dev/patch/3fd60c2d8a28668a42=
b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu/

cheers
