Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BAD64C56A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 10:01:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX8V52Mlgz3cMJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 20:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=188.68.32.151; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
Received: from lug-owl.de (lug-owl.de [188.68.32.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX8TW083Fz3bdn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 20:00:30 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id A6F5D4206E; Wed, 14 Dec 2022 10:00:25 +0100 (CET)
Date: Wed, 14 Dec 2022 10:00:25 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221214090025.f3k3juinxfhhnr6u@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <20221213002613.GG25951@gate.crashing.org>
 <20221213100045.xebrbdcniwpopbnq@lug-owl.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2yhttawkqvgtl3i"
Content-Disposition: inline
In-Reply-To: <20221213100045.xebrbdcniwpopbnq@lug-owl.de>
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


--p2yhttawkqvgtl3i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Segher!

On Tue, 2022-12-13 11:00:45 +0100, Jan-Benedict Glaw <jbglaw@lug-owl.de> wr=
ote:
> On Mon, 2022-12-12 18:26:13 -0600, Segher Boessenkool <segher@kernel.cras=
hing.org> wrote:
> > On Mon, Dec 12, 2022 at 10:51:17PM +0100, Jan-Benedict Glaw wrote:
> > > 	Compiler ICEs (during GIMPLE pass: ccp) in align.c:
> > >=20
> > > 	  powerpc-linux-gcc -Wp,-MMD,arch/powerpc/kernel/.align.o.d -nostdin=
c -I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include =
-I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I./i=
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
> > > 	during GIMPLE pass: ccp
> > > 	arch/powerpc/kernel/align.c: In function '__copy_inst_from_kernel_no=
fault':
> > > 	arch/powerpc/kernel/align.c:364:1: internal compiler error: in maybe=
_register_def, at tree-into-ssa.cc:1948
> > > 	  364 | }
> > > 	      | ^
> > > 	0x19d8886 internal_error(char const*, ...)
> > > 	   ???:0
> > > 	0x7bb4fe fancy_abort(char const*, int, char const*)
> > > 	   ???:0
> > > 	0x1791bfe dom_walker::walk(basic_block_def*)
> > > 	   ???:0
> > > 	0xe94ec0 update_ssa(unsigned int)
> > > 	   ???:0
> > > 	0x103d6b9 execute_update_addresses_taken()
> > > 	   ???:0
> > > 	Please submit a full bug report, with preprocessed source (by using =
-freport-bug).
> > > 	Please include the complete backtrace with any bug report.
> > > 	See <https://gcc.gnu.org/bugs/> for instructions.
> > > 	make[3]: *** [scripts/Makefile.build:250: arch/powerpc/kernel/align.=
o] Error 1
> > > 	make[2]: *** [scripts/Makefile.build:500: arch/powerpc/kernel] Error=
 2
> > > 	make[1]: *** [scripts/Makefile.build:500: arch/powerpc] Error 2
> > > 	make: *** [Makefile:1992: .] Error 2
> > >=20
> > > 	=3D=3D> Should probably open a PR for this.
> >=20
> > Yes please!

Submitted as https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108095:

typedef unsigned u32;
int __copy_inst_from_kernel_nofault_inst;
__copy_inst_from_kernel_nofault() {
  unsigned suffix;
  asm goto("" : "=3Dr"(*(u32 *)&suffix) : : : Efault);
  __copy_inst_from_kernel_nofault_inst =3D 0;
Efault:
}

ICEs with: `powerpc64-linux-gcc -Os -g -c -o align.o align.i` (Both
`-Os` and `-g` are needed to produce the ICE.)

MfG, JBG

--=20

--p2yhttawkqvgtl3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5mQpwAKCRAdvV51g5nh
u1j0AJ0agRqGneEKBhu96iyIB+oRPnBb1ACdF+AUm6e8oYtTMD900fpfiXv19fE=
=hMyh
-----END PGP SIGNATURE-----

--p2yhttawkqvgtl3i--
