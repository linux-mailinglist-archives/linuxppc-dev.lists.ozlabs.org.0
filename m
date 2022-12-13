Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF5964B2EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 11:01:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWYt52M0Nz3cjW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 21:01:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=188.68.32.151; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
Received: from lug-owl.de (lug-owl.de [188.68.32.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWYsX18zkz3bXW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 21:00:47 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id 23C8342065; Tue, 13 Dec 2022 11:00:45 +0100 (CET)
Date: Tue, 13 Dec 2022 11:00:45 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221213100045.xebrbdcniwpopbnq@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <20221213002613.GG25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tin5ddckx2t7mlff"
Content-Disposition: inline
In-Reply-To: <20221213002613.GG25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--tin5ddckx2t7mlff
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Segher!

On Mon, 2022-12-12 18:26:13 -0600, Segher Boessenkool <segher@kernel.crashi=
ng.org> wrote:
> On Mon, Dec 12, 2022 at 10:51:17PM +0100, Jan-Benedict Glaw wrote:
[...]
> > For PPC, a good number of those fail,
> > and I probably don't understand PPC well enough to propose patches. Or
> > did I pick wrongly targeted toolchains? Most of the time, my suspicion
> > is that we're not giving the correct -m<cpu> flags in
> > ./arch/powerpc/boot/?  (My setup for doing test builds is fairly automa=
ted, I
> > can easily throw in patches for testing.)
>=20
> Many of those use a 32-bit toolchain with a 64-bit kernel, or they
> require some e500 specific config but not getting it (or the other way
> around).
>=20
> > 64-bit.config
>=20
> > 	=3D=3D> Why "-m32 -mcpu=3Dpowerpc"? Binutils/GCC are for --target=3Dpo=
werpc64-linux
>=20
> Something in your config is forcing that.

That's a configuration that should not have been built. As Michael
wrote, it's just a fragment for a defconfig, I queued it for a build
but that was plain wrong. (As well as other *.config files.)

> > 	Compiler ICEs (during GIMPLE pass: ccp) in align.c:
> >=20
> > 	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.align.o.d -nostdinc =
-I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include -I=
=2E/arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./i=
nclude/uapi -I./include/generated/uapi -include ./include/linux/compiler-ve=
rsion.h -include ./include/linux/kconfig.h -include ./include/linux/compile=
r_types.h -D__KERNEL__ -I ./arch/powerpc -fmacro-prefix-map=3D./=3D -Wall -=
Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno=
-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Wer=
ror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 =
-mbig-endian -m32 -msoft-float -pipe -ffixed-r2 -mmultiple -mno-readonly-in=
-sdata -mcpu=3D440 -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma =
-fno-asynchronous-unwind-tables -mno-string -Wa,-m440 -mbig-endian -mstack-=
protector-guard=3Dtls -mstack-protector-guard-reg=3Dr2 -fno-delete-null-poi=
nter-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow =
-Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-large=
r-than=3D1024 -fstack-protector-strong -Wno-main -Wno-unused-but-set-variab=
le -Wno-unused-const-variable -Wno-dangling-pointer -fomit-frame-pointer -f=
trivial-auto-var-init=3Dzero -fno-stack-clash-protection -Wdeclaration-afte=
r-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-stringop-trun=
cation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -Wno-a=
lloc-size-larger-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-=
stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-poi=
nter-types -Werror=3Ddesignated-init -Wno-packed-not-aligned -g -mstack-pro=
tector-guard-offset=3D1080 -Werror    -DKBUILD_MODFILE=3D'"arch/powerpc/ker=
nel/align"' -DKBUILD_BASENAME=3D'"align"' -DKBUILD_MODNAME=3D'"align"' -D__=
KBUILD_MODNAME=3Dkmod_align -c -o arch/powerpc/kernel/align.o arch/powerpc/=
kernel/align.c =20
> > 	during GIMPLE pass: ccp
> > 	arch/powerpc/kernel/align.c: In function '__copy_inst_from_kernel_nofa=
ult':
> > 	arch/powerpc/kernel/align.c:364:1: internal compiler error: in maybe_r=
egister_def, at tree-into-ssa.cc:1948
> > 	  364 | }
> > 	      | ^
> > 	0x19d8886 internal_error(char const*, ...)
> > 	   ???:0
> > 	0x7bb4fe fancy_abort(char const*, int, char const*)
> > 	   ???:0
> > 	0x1791bfe dom_walker::walk(basic_block_def*)
> > 	   ???:0
> > 	0xe94ec0 update_ssa(unsigned int)
> > 	   ???:0
> > 	0x103d6b9 execute_update_addresses_taken()
> > 	   ???:0
> > 	Please submit a full bug report, with preprocessed source (by using -f=
report-bug).
> > 	Please include the complete backtrace with any bug report.
> > 	See <https://gcc.gnu.org/bugs/> for instructions.
> > 	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/kernel/align.o]=
 Error 1
> > 	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error 2
> > 	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
> > 	make: *** [Makefile:1992: .] Error 2
> >=20
> > 	=3D=3D> Should probably open a PR for this.
>=20
> Yes please!

I'll wait until the current build loop finishes. Looking at
__copy_inst_from_kernel_nofault(), it uses an asm goto, which I had
issues with and there was already a fix for it
(7676235f690e624b7ed41a22b22ce8ccfac1492f,
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107997) which might fix
all of those.

Thanks,
  Jan-Benedict

--=20

--tin5ddckx2t7mlff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5hNSgAKCRAdvV51g5nh
u+AfAJsH2fcG+55NQ2WGkrRliJAwSM9H+ACfUfKclrypjMPSHsh/mA0aF0QQlQE=
=v9Ok
-----END PGP SIGNATURE-----

--tin5ddckx2t7mlff--
