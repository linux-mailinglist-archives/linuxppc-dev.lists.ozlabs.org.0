Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6E64CC98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 15:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXJ8D1fL3z3cGr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 01:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=2a03:4000:10:469::; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
Received: from lug-owl.de (lug-owl.de [IPv6:2a03:4000:10:469::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXJ7d1Rphz3bfG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 01:45:33 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id E2AB842048; Wed, 14 Dec 2022 15:45:25 +0100 (CET)
Date: Wed, 14 Dec 2022 15:45:25 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Mass-building defconfigs: many fail with assembler errors
Message-ID: <20221214144525.pecvb4cmnvth6n62@lug-owl.de>
References: <20221212215117.aa7255t7qd6yefk4@lug-owl.de>
 <87bko8j73z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="csi6qmya5wnwjslg"
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


--csi6qmya5wnwjslg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-12-13 14:49:20 +1100, Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
[...]
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

With this patch applied, it seems this fixes these asm-related builds:

linux-powerpc-bamboo_defconfig
linux-powerpc-cell_defconfig
linux-powerpc-ebony_defconfig
linux-powerpc-katmai_defconfig
linux-powerpc-ppc44x_defconfig
linux-powerpc-rainier_defconfig
linux-powerpc-sam440ep_defconfig
linux-powerpc-sequoia_defconfig
linux-powerpc-taishan_defconfig

=2E..while three remain unresolved:

linux-powerpc-asp8347_defconfig
linux-powerpc-mvme5100_defconfig
linux-powerpc-ppc64e_defconfig

Of course I cannot verify the resulting kernel binaries, but I guess
you'd push this patch.

  The PR for the ICE is being actively worked on, just started a GCC
build with the suggested patch.

MfG, JBG

--=20

--csi6qmya5wnwjslg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY5nhggAKCRAdvV51g5nh
uyxRAJ451Xxg+/b1R9/WhcHd5e/O3Y+YPwCfbt0y4R7UqXv5iin9SxT3yGUISs0=
=Llvo
-----END PGP SIGNATURE-----

--csi6qmya5wnwjslg--
