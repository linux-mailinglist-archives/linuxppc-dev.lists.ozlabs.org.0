Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E085B5BEFFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 00:21:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXGGN5fwYz3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 08:21:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=l3bD3Ibe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXGFl6Fflz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 08:20:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=l3bD3Ibe;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MXGFk3W7Kz4xGW;
	Wed, 21 Sep 2022 08:20:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1663712427;
	bh=e4x/7F4x3jtxWPQYW02kArFwt0baGQdR/h9YzM/rOD4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l3bD3IbeEH5ilclgSJSHygo/u1C4bkPIXSc3gfU4rQP2Wvd5ihJ+V7GHUvWDyAutZ
	 KuQXveucPc6oL4Tdf5GoeQXFP0ZDUMn2Kho4+dyLtoAJwTj3vyu2P7tr+MCzrnGmaQ
	 b5ezfE4+kNj6jtuD0qVK1ZD9IkvfmpsxsO6RRmYsNnsGeesabT+V5YnY0gWWq7LsAJ
	 K9IZex5f5lXZ/3tHR9ejeyAgA0XTsKU6Q/899yfIgoXqHn8EpqR9Q8QLss9k/hC3X+
	 oBFtfL4PKKwFmBO6dNFIcyYdcZONLdJjazsYorc4aszUrGRCmwudpTA2iSb1pLGd8L
	 e+o1TJdAfUg2A==
Date: Wed, 21 Sep 2022 08:20:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH] powerpc/64: don't refer nr_cpu_ids in asm code when
 it's undefined
Message-ID: <20220921082006.2235b7d2@canb.auug.org.au>
In-Reply-To: <20220920152935.1569605-1-yury.norov@gmail.com>
References: <20220920152935.1569605-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1cQ.H=BGhInvidNYFoNGEGJ";
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Alan Modra <amodra@au1.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/1cQ.H=BGhInvidNYFoNGEGJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yury,

On Tue, 20 Sep 2022 08:29:35 -0700 Yury Norov <yury.norov@gmail.com> wrote:
>

> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index cf2c08902c05..7cb97881635e 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -400,7 +400,11 @@ generic_secondary_common_init:
>  #else
>  	LOAD_REG_ADDR(r8, paca_ptrs)	/* Load paca_ptrs pointe	 */
>  	ld	r8,0(r8)		/* Get base vaddr of array	 */
> +#if (NR_CPUS =3D=3D 1) || defined(CONFIG_FORCE_NR_CPUS)
> +	LOAD_REG_IMMEDIATE(r7, NR_CPUS)
> +#else
>  	LOAD_REG_ADDR(r7, nr_cpu_ids)	/* Load nr_cpu_ids address       */
> +#endif
>  	lwz	r7,0(r7)		/* also the max paca allocated 	 */
>  	li	r5,0			/* logical cpu id                */
>  1:
> --=20
> 2.34.1
>=20

I don't know PPC assembly very well, but should the #endif be one line
lower so that the constant is not dereferenced in the non-#else case?=20

--=20
Cheers,
Stephen Rothwell

--Sig_/1cQ.H=BGhInvidNYFoNGEGJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMqPJYACgkQAVBC80lX
0Gwr3Af/UChWHeWYob9IqQw/8bJH2CgzIK17TDOUa16U/RWb1MPcCNItY3652WX6
0XQA4oqVJkODYSwsU25iTYv81MXo3HxjMsXattrhnUM0mfwe/UeM00OK9Nao7jIt
FhGAtWldTdBt7Gju45zxNtCsJkK+pYidhFgXF/5w2VZGie8oU3N5J1Pd53gOtNW4
Cyp/YVNaCKYmk6A4P4nx6lqieFMn+3KSqzcYy3U6foEpzsa6rmyDQQG3Ex251Ct0
WW6BOzh3aKM/eZLoClSCQcrfKw+Q28loIBrQReL9krg3btZTrAyWb++bVOFeTXxA
HwBhQceRlM/gkVoHBrFEoQzuN8eraA==
=MWuQ
-----END PGP SIGNATURE-----

--Sig_/1cQ.H=BGhInvidNYFoNGEGJ--
