Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E197D69F72A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:53:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMK0w5BNnz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F9FnSipH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F9FnSipH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJxK4wjhz3g28
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:50:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5F696147A;
	Wed, 22 Feb 2023 14:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4EDC433EF;
	Wed, 22 Feb 2023 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677077441;
	bh=jECYUd++ya4ZsTEPgf+A4rG4QEZxORJ8FxqhcduO8rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9FnSipHjdSvaLOQeeDh5U9J3OpPg9y5rhPajM5/U+Cp3uL7ggJ33uDUPrBW8wXtY
	 dxwQS5jPa6FBJztre9QhvYkYot55Fi8CX2LTPH6nKb+QaHFgtOU9M94nC8CFjUXJJk
	 Yrk5Al9cxSObZat0W7cNiwTRi09vzMWVed3iGUEwaBlZsQp3G8A4wy0pZA0r8P+zZQ
	 nf/G9mJBt+b+VjZs23yAMChRURMV6ZV9x9c29+LU/iN+ivvlqI0bsnepYkWdruSqUk
	 UBrwNLpVtvZi/yBsTrEcL97dRHQq2n108wme856Mnn7rCYBhc/3AiIvpn2rvGr83Ea
	 x8V/LWk7+cOPg==
Date: Wed, 22 Feb 2023 14:50:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/3] riscv: Set dma_default_coherent to true
Message-ID: <Y/YrvDBJcYUQt4WC@spud>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-3-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mMMYT62i9d1eIRHl"
Content-Disposition: inline
In-Reply-To: <20230222133712.8079-3-jiaxun.yang@flygoat.com>
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mMMYT62i9d1eIRHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 01:37:11PM +0000, Jiaxun Yang wrote:
> For riscv our assumption is unless a device states it is non-coherent,
> we take it to be DMA coherent.
>=20
> For devicetree probed devices that have been true since very begining
> with OF_DMA_DEFAULT_COHERENT selected.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/riscv/kernel/setup.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 376d2827e736..34b371180976 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_init_cbom_blocksize();
>  	riscv_fill_hwcap();
>  	apply_boot_alternatives();
> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +	dma_default_coherent =3D true;
> +#endif

Do we really need to add ifdeffery for this here?
It's always coherent by default, so why do we need to say set it in
setup_arch() when we know that, regardless of options, it is true?

Cheers,
Conor.

>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>  	    riscv_isa_extension_available(NULL, ZICBOM))
>  		riscv_noncoherent_supported();
> --=20
> 2.37.1 (Apple Git-137.1)
>=20

--mMMYT62i9d1eIRHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/YruQAKCRB4tDGHoIJi
0oqOAQClwxhHez3G5Ku8YKYt1QD25AwhnbdgPYGZX4nrg3jkDAEA0YEX+g+BVk6l
KwiIMBd6nPQZSCwfvdaJvG++kv81mQU=
=pBfa
-----END PGP SIGNATURE-----

--mMMYT62i9d1eIRHl--
