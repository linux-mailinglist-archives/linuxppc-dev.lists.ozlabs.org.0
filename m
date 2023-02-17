Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7BC69A51A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 06:33:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ0q032f9z3f3P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 16:33:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=V3KuSH6Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ0p12QQ0z3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 16:32:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=V3KuSH6Q;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PJ0nw4CYSz4x5X;
	Fri, 17 Feb 2023 16:32:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1676611974;
	bh=MTH4pKybGLngklRt06A6O2Qb24M4K3nqvvz+3btccuM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V3KuSH6Qi7FBjEW7K/o0QJgg7XBNNImwA48fIwdGCgkye8i2D9Np4T8l/ZH52VdDM
	 Frf5qe++2I5I2QuY4PYkSkE8H/5QOynsXYsQ70er0Lwp3+ccKKtFr2H+aOZZ54Bxje
	 ueGlQIv4xw3bl93J+TBvJ9oLPABJQ1loNA5biEXLmxD9QHTjccpieZAGx/UdwineGi
	 O5hW+k4EC/5sXEafXbSFYP9eJzqOjKESTW23oclqLrCTJO9J1J3QNS+PK2Q3Vh+TnQ
	 zvASTLv/BH/iKtXWuDXScatBhzB9uiEljNsEIIPgEuIwCjVryej0MPHTHW/MaOm5nF
	 Sl9p8OvVgkERQ==
Date: Fri, 17 Feb 2023 16:32:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH] powerpc/64: Fix unannotated intra-function call warning
Message-ID: <20230217163249.17ac772e@canb.auug.org.au>
In-Reply-To: <20230217043226.1020041-1-sv@linux.ibm.com>
References: <20230217043226.1020041-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dvoy=KVDhWeF+Yd5cfVS4TJ";
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
Cc: peterz@infradead.org, Nicholas Piggin <npiggin@gmail.com>, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/dvoy=KVDhWeF+Yd5cfVS4TJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 Feb 2023 10:02:26 +0530 Sathvika Vasireddy <sv@linux.ibm.com> wr=
ote:
>
> objtool throws the following warning:
>   arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128:
>   unannotated intra-function call
>=20
> Fix the warning by annotating start_initialization_book3s symbol with the
> SYM_FUNC_START_LOCAL and SYM_FUNC_END macros.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  arch/powerpc/kernel/head_64.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index 3a7266fa8a18..1febb56ebaeb 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -472,7 +472,7 @@ SYM_FUNC_START_LOCAL(__mmu_off)
>  	b	.	/* prevent speculative execution */
>  SYM_FUNC_END(__mmu_off)
> =20
> -start_initialization_book3s:
> +SYM_FUNC_START_LOCAL(start_initialization_book3s)
>  	mflr	r25
> =20
>  	/* Setup some critical 970 SPRs before switching MMU off */
> @@ -494,6 +494,7 @@ start_initialization_book3s:
> =20
>  	mtlr	r25
>  	blr
> +SYM_FUNC_END(start_initialization_book3s)
>  #endif
> =20
>  /*
> --=20
> 2.31.1
>=20

That at least makes the warning go away for me.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes:  58f24eea5278 ("powerpc/64s: Refactor initialisation after prom")

--=20
Cheers,
Stephen Rothwell

--Sig_/dvoy=KVDhWeF+Yd5cfVS4TJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPvEYEACgkQAVBC80lX
0GzFYQf8CF9SQSWF3NRfhGQW6nIr+zpVu23zV/zBcHcv2AeshBrTvZbraJvMRsJJ
2ogdiLQng55bDLJyiZKeSFteXDSft4Nt1KO9MLuTvmKx2vB82DRqIWxk9m3IQhH1
UsqvDLRq9XrXgDBpIGggfj4Mj7effFxmQXAZoZ3VrqrfgWUHW1naYHMvQs2fd2D/
oN91TnoaTGdaF26VLBgtwsZF8O4BpFPOVFxNIT55/O+etzqIDZfxExsD1OcYIhap
0VYurrvHnIJPutWxCczNWrdNT3wbElhEhdIO+VCfzhIdc1aVLe8I/qlcbTL/Dx3q
ZXVPg0SMRIERJ4WynmqORp2XVrR4Iw==
=jVXZ
-----END PGP SIGNATURE-----

--Sig_/dvoy=KVDhWeF+Yd5cfVS4TJ--
