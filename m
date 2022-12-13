Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695364AC70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 01:27:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWK8R2HFmz3cd2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 11:27:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWK7q6pfwz2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 11:27:17 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BD0QDTo017108;
	Mon, 12 Dec 2022 18:26:13 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2BD0QDUN017102;
	Mon, 12 Dec 2022 18:26:13 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 12 Dec 2022 18:26:13 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221213002613.GG25951@gate.crashing.org>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Dec 12, 2022 at 10:51:17PM +0100, Jan-Benedict Glaw wrote:
> Is anybody else routinely building current Binutils + GCC, to try to
> build all the Linux defconfigs?

I do regularly build kernels for powerpc-linux, powerpc64-linux,
powerpc64le-linux; ppc6xx_defconfig and ppc64_defconfig and
ppc64le_defconfig.  Totally boring, but it frequently does not build.
Not as frequently as for the other Linux targets I build (32 total at
the moment).

> For PPC, a good number of those fail,
> and I probably don't understand PPC well enough to propose patches. Or
> did I pick wrongly targeted toolchains? Most of the time, my suspicion
> is that we're not giving the correct -m<cpu> flags in
> ./arch/powerpc/boot/?  (My setup for doing test builds is fairly automate=
d, I
> can easily throw in patches for testing.)

Many of those use a 32-bit toolchain with a 64-bit kernel, or they
require some e500 specific config but not getting it (or the other way
around).

> 64-bit.config

> 	=3D=3D> Why "-m32 -mcpu=3Dpowerpc"? Binutils/GCC are for --target=3Dpowe=
rpc64-linux

Something in your config is forcing that.

> 85xx-64bit.config
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

e500mc is a 32-bit core.  This cannot fly.

> 85xx-hw.config
> 	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.epapr_hcalls.o.d -nost=
dinc -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./inclu=
de -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I=
./include/uapi -I./include/generated/uapi -include ./include/linux/compiler=
-version.h -include ./include/linux/kconfig.h -D__KERNEL__ -I ./arch/powerp=
c -fmacro-prefix-map=3D./=3D -D__ASSEMBLY__ -fno-PIE -m32 -Wl,-a32 -mcpu=3D=
powerpc -mbig-endian    -c -o arch/powerpc/kernel/epapr_hcalls.o arch/power=
pc/kernel/epapr_hcalls.S=20
> 	arch/powerpc/kernel/epapr_hcalls.S: Assembler messages:
> 	arch/powerpc/kernel/epapr_hcalls.S:24: Error: unrecognized opcode: `wrte=
ei'

wrteei is a BookE instruction (not a PowerPC instruction), and something
specifically asked for just PowerPC.

> powernv_defconfig

> 	cc1: all warnings being treated as errors

Self-inflicted wound.  The warnings may reveal more, or they might show
something that GCC isn't as good at as you may want; all warnings have
false positives, that is why they are warnings and not errors.

> 	Compiler ICEs (during GIMPLE pass: ccp) in align.c:
>=20
> 	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.align.o.d -nostdinc -I=
./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I./=
arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./inclu=
de/uapi -I./include/generated/uapi -include ./include/linux/compiler-versio=
n.h -include ./include/linux/kconfig.h -include ./include/linux/compiler_ty=
pes.h -D__KERNEL__ -I ./arch/powerpc -fmacro-prefix-map=3D./=3D -Wall -Wund=
ef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-com=
mon -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=
=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 -mb=
ig-endian -m32 -msoft-float -pipe -ffixed-r2 -mmultiple -mno-readonly-in-sd=
ata -mcpu=3D440 -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -fn=
o-asynchronous-unwind-tables -mno-string -Wa,-m440 -mbig-endian -mstack-pro=
tector-guard=3Dtls -mstack-protector-guard-reg=3Dr2 -fno-delete-null-pointe=
r-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wn=
o-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-larger-t=
han=3D1024 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variable =
-Wno-unused-const-variable -Wno-dangling-pointer -fomit-frame-pointer -ftri=
vial-auto-var-init=3Dzero -fno-stack-clash-protection -Wdeclaration-after-s=
tatement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-truncat=
ion -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-allo=
c-size-larger-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-sta=
ck-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointe=
r-types -Werror=3Ddesignated-init -Wno-packed-not-aligned -g -mstack-protec=
tor-guard-offset=3D1080 -Werror    -DKBUILD_MODFILE=3D'"arch/powerpc/kernel=
/align"' -DKBUILD_BASENAME=3D'"align"' -DKBUILD_MODNAME=3D'"align"' -D__KBU=
ILD_MODNAME=3Dkmod_align -c -o arch/powerpc/kernel/align.o arch/powerpc/ker=
nel/align.c =20
> 	during GIMPLE pass: ccp
> 	arch/powerpc/kernel/align.c: In function '__copy_inst_from_kernel_nofaul=
t':
> 	arch/powerpc/kernel/align.c:364:1: internal compiler error: in maybe_reg=
ister_def, at tree-into-ssa.cc:1948
> 	  364 | }
> 	      | ^
> 	0x19d8886 internal_error(char const*, ...)
> 	   ???:0
> 	0x7bb4fe fancy_abort(char const*, int, char const*)
> 	   ???:0
> 	0x1791bfe dom_walker::walk(basic_block_def*)
> 	   ???:0
> 	0xe94ec0 update_ssa(unsigned int)
> 	   ???:0
> 	0x103d6b9 execute_update_addresses_taken()
> 	   ???:0
> 	Please submit a full bug report, with preprocessed source (by using -fre=
port-bug).
> 	Please include the complete backtrace with any bug report.
> 	See <https://gcc.gnu.org/bugs/> for instructions.
> 	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/kernel/align.o] E=
rror 1
> 	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error 2
> 	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
> 	make: *** [Makefile:1992: .] Error 2
>=20
> 	=3D=3D> Should probably open a PR for this.

Yes please!


Segher
