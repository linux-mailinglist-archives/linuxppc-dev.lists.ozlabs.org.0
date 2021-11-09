Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882644AEE8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 14:40:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpTcp2Fl1z3bbx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 00:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=UYUzHUBw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpTc84PwCz2xCn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 00:39:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=UYUzHUBw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HpTc517clz4xbc;
 Wed, 10 Nov 2021 00:39:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1636465174;
 bh=EB45jjDPR8bRPHUY2PFX+Xr70gTyQt9MZRx3eiXmAIE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UYUzHUBwCzbEUDYBBJPvspkA0no75gujDtj/VnpVB83w9PIDCp+8WlRSCDfB3+FjC
 jr4ixhq62/fOJ4luvb+apdga9o0Kop0lCs8fJuu4cO9IRxewVM2B3qpUVB59M2rL+W
 PwAXNO3ftt+VrTc+WnXOMvubdR2e2bX1k8SvPAEWK8ku7LhwdHj0OCCA/P0d0WpVrC
 HUiRPuGcoQEflXEhkeSYDpAYBRCYXTPHzyvjHjq1Z0pWZbQV6jk85Q4HfjbgvGDnGP
 vS5NB8Ggklr4l/xCoN+WiwlAD++eT//K0YZ3RDQlxcuwVm7fJQvwmTdsmBt0n46gdC
 mQK4ds9RCQ7mw==
Date: Wed, 10 Nov 2021 00:39:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: powerpc: mcu_mpc8349emitx.c:189:13: error: unused variable
 'ret' [-Werror=unused-variable]
Message-ID: <20211110003932.51a605ef@canb.auug.org.au>
In-Reply-To: <CA+G9fYvviLKpT7a-1ZDmVp8YN8cCG0ixLpxv2uSubtsw-CkZCQ@mail.gmail.com>
References: <CA+G9fYvviLKpT7a-1ZDmVp8YN8cCG0ixLpxv2uSubtsw-CkZCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dtUNaDO71cbSSM4a5=2bJ82";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?= =?UTF-8?B?Zw==?=
 <u.kleine-koenig@pengutronix.de>, open list <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/dtUNaDO71cbSSM4a5=2bJ82
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Tue, 9 Nov 2021 18:37:48 +0530 Naresh Kamboju <naresh.kamboju@linaro.org=
> wrote:
>
> [Please ignore this email if it is already reported ]
>=20
> Regression found on powerpc gcc-8/9/10 and gcc-11 built with ppc6xx_defco=
nfig
> Following build warnings / errors reported on linux next 20211109.
>=20
> metadata:
>     git_describe: next-20211109
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_short_log: c8109c2ba35e (\"Add linux-next specific files for 2021=
1109\")
>     target_arch: powerpc
>     toolchain: gcc-11
>=20
> build error :
> --------------
> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-W=
cpp]
> arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c: In function 'mcu_remove':
> arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c:189:13: error: unused
> variable 'ret' [-Werror=3Dunused-variable]
>   189 |         int ret;
>       |             ^~~
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:288:
> arch/powerpc/platforms/83xx/mcu_mpc8349emitx.o] Error 1
> make[4]: Target '__build' not remade because of errors.
> make[3]: *** [scripts/Makefile.build:571: arch/powerpc/platforms/83xx] Er=
ror 2
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> build link:
> -----------
> https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/build.log
>=20
> build config:
> -------------
> https://builds.tuxbuild.com/20fICxLPRCpcISasoGwKGICBELv/config
>=20
> # To install tuxmake on your system globally
> # sudo pip3 install -U tuxmake
> tuxmake --runtime podman --target-arch powerpc --toolchain gcc-11
> --kconfig ppc6xx_defconfig
>=20
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org

Caused by commit

  5d354dc35ebb ("powerpc/83xx/mpc8349emitx: Make mcu_gpiochip_remove() retu=
rn void")

that is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dtUNaDO71cbSSM4a5=2bJ82
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGKehQACgkQAVBC80lX
0Gw2jwgAi+V3loC+NLTzrpFxCXSjNprWeoVXI3ToJaT0/vQ/cMsIZb6mONSXQbwd
7yYuZ5imLl49d1LYfx4HImyUzvIukxyrrB8loOe4ZhAmns5k6uOBk3bw75TRupBj
YmxeGZWoL4cv9ZmVD1ukSQlXiCDqZ1/lKDCah8Jh/dHEAbO4Ax27MukiEWLZuk+b
3l86jBtgAk2JbohUnCB5ms4JKCwCV7K0tvL9AFUEIwgjegXbEEQA9vdUP6KSQWpe
zwtiRAGdIeq+UTZjNIbexze+p2OGUv2x0hPHv2dh63mbkUiCXQ1WZQtWU/QyadIr
xN6KBQXdJ3/4fNfpJAWsBzfxa/Tj7Q==
=70cK
-----END PGP SIGNATURE-----

--Sig_/dtUNaDO71cbSSM4a5=2bJ82--
