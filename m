Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4364B15A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 09:42:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWX7D6WtTz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 19:42:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=188.68.32.151; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
X-Greylist: delayed 39038 seconds by postgrey-1.36 at boromir; Tue, 13 Dec 2022 19:42:02 AEDT
Received: from lug-owl.de (lug-owl.de [188.68.32.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWX6f4pG7z3bWb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 19:42:02 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id DED2B42065; Tue, 13 Dec 2022 09:41:59 +0100 (CET)
Date: Tue, 13 Dec 2022 09:41:59 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221213084159.ozxwohsq7q2yuko3@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <87bko8j73z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="axj77vpf7o6rgutp"
Content-Disposition: inline
In-Reply-To: <87bko8j73z.fsf@mpe.ellerman.id.au>
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


--axj77vpf7o6rgutp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, 2022-12-13 14:49:20 +1100, Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
> Jan-Benedict Glaw <jbglaw@lug-owl.de> writes:
> > Is anybody else routinely building current Binutils + GCC, to try to
> > build all the Linux defconfigs?
>=20
> I did for several years, but eventually stopped because it was taking
> too much time I needed to spend on other things.

I've got one system at my hands to let it build stuff all day. So I'm
trying to extend that as far as possible.

> > For PPC, a good number of those fail,
> > and I probably don't understand PPC well enough to propose patches. Or
> > did I pick wrongly targeted toolchains? Most of the time, my suspicion
> > is that we're not giving the correct -m<cpu> flags in
> > ./arch/powerpc/boot/?  (My setup for doing test builds is fairly automa=
ted, I
> > can easily throw in patches for testing.)
>=20
> All the results against <something>.config are invalid or at least
> dubious. Those files are not standalone defconfigs, they're fragments of
> defconfigs that are assembled together by arch/powerpc/Makefile using
> merge_config.sh.
>=20
> So your script should exclude all files that end in ".config".

Thanks!  Will just drop those.

> To find the names of the generated configs you can use something like:
>=20
>  $ awk '/PHONY \+=3D .*config/ {print $3}' arch/powerpc/Makefile

=2E..and integrate these instead. Thanks a lot!

> > 64-bit.config
> > 	  powerpc64-linux-gcc -Wp,-MD,arch/powerpc/boot/.opal-calls.o.d -D__AS=
SEMBLY__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-alias=
ing -O2 -msoft-float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fn=
o-builtin -fPIC -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include=
/generated  -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/incl=
ude/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./i=
nclude/linux/compiler-version.h -include ./include/linux/kconfig.h -m32 -mc=
pu=3Dpowerpc -isystem /var/lib/laminar/run/linux-powerpc-64-bit.config/12/t=
oolchain/bin/../lib/gcc/powerpc64-linux/13.0.0/include -mbig-endian -nostdi=
nc -c -o arch/powerpc/boot/opal-calls.o arch/powerpc/boot/opal-calls.S
> > 	arch/powerpc/boot/opal-calls.S: Assembler messages:
> > 	arch/powerpc/boot/opal-calls.S:20: Error: unrecognized opcode: `ld'
> > 	arch/powerpc/boot/opal-calls.S:21: Error: unrecognized opcode: `ld'
> > 	arch/powerpc/boot/opal-calls.S:32: Error: unrecognized opcode: `std'
> > 	arch/powerpc/boot/opal-calls.S:49: Error: unrecognized opcode: `ld'
> > 	arch/powerpc/boot/opal-calls.S:50: Error: unrecognized opcode: `ld'
> > 	arch/powerpc/boot/opal-calls.S:52: Error: unrecognized opcode: `hrfid'
> > 	arch/powerpc/boot/opal-calls.S:55: Error: unrecognized opcode: `tdi'
> > 	arch/powerpc/boot/opal-calls.S:58: Error: unrecognized opcode: `ld'
> > 	make[1]: *** [arch/powerpc/boot/Makefile:232: arch/powerpc/boot/opal-c=
alls.o] Error 1
> > 	make: *** [arch/powerpc/Makefile:247: zImage] Error 2
>=20
> ...
>=20
> > bamboo_defconfig
> > 	  powerpc-linux-gcc -Wp,-MD,arch/powerpc/boot/.treeboot-akebono.o.d -W=
all -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -O2 -ms=
oft-float -mno-altivec -mno-vsx   -pipe -fomit-frame-pointer -fno-builtin -=
fPIC -nostdinc -I./arch/powerpc/include -I./arch/powerpc/include/generated =
 -I./include -I./arch/powerpc/include/uapi -I./arch/powerpc/include/generat=
ed/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linu=
x/compiler-version.h -include ./include/linux/kconfig.h -m32 -mcpu=3Dpowerp=
c -isystem /var/lib/laminar/run/linux-powerpc-bamboo_defconfig/12/toolchain=
/bin/../lib/gcc/powerpc-linux/13.0.0/include -mbig-endian -fno-stack-protec=
tor -include ./include/linux/compiler_attributes.h -I./arch/powerpc/boot -I=
=2E/arch/powerpc/boot -mcpu=3D405 -c -o arch/powerpc/boot/treeboot-akebono.=
o arch/powerpc/boot/treeboot-akebono.c
> > 	{standard input}: Assembler messages:
> > 	{standard input}:94: Error: unrecognized opcode: `mtdcrx'
> > 	{standard input}:101: Error: unrecognized opcode: `mfdcrx'
> > 	{standard input}:107: Error: unrecognized opcode: `mtdcrx'
> > 	{standard input}:306: Error: unrecognized opcode: `mfdcrx'
> > 	make[1]: *** [arch/powerpc/boot/Makefile:229: arch/powerpc/boot/treebo=
ot-akebono.o] Error 1
> > 	make: *** [arch/powerpc/Makefile:247: zImage] Error 2
>=20
> Both treeboot-akebono.c and treeboot-currituck.c are for 476 so should
> probably be built with -mcpu=3D476. eg:
>=20
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index d32d95aea5d6..acb6eddace8f 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -88,8 +88,8 @@ $(obj)/cuboot-taishan.o: BOOTCFLAGS +=3D -mcpu=3D440
>  $(obj)/cuboot-katmai.o: BOOTCFLAGS +=3D -mcpu=3D440
>  $(obj)/cuboot-acadia.o: BOOTCFLAGS +=3D -mcpu=3D405
>  $(obj)/treeboot-iss4xx.o: BOOTCFLAGS +=3D -mcpu=3D405
> -$(obj)/treeboot-currituck.o: BOOTCFLAGS +=3D -mcpu=3D405
> -$(obj)/treeboot-akebono.o: BOOTCFLAGS +=3D -mcpu=3D405
> +$(obj)/treeboot-currituck.o: BOOTCFLAGS +=3D -mcpu=3D476
> +$(obj)/treeboot-akebono.o: BOOTCFLAGS +=3D -mcpu=3D476
> =20
>  # The pre-boot decompressors pull in a lot of kernel headers and other s=
ource
>  # files. This creates a bit of a dependency headache since we need to co=
py

I'll update my scripts to pick up this different config set and drop
in this patch.

MfG, JBG

--=20

--axj77vpf7o6rgutp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5g61QAKCRAdvV51g5nh
u+ZkAJ9hY3zwP1CAs0OcFBwoVgh/Ntb7wQCfYk8ja5b5FCMplL2o70TaYJO4hrc=
=FXOL
-----END PGP SIGNATURE-----

--axj77vpf7o6rgutp--
