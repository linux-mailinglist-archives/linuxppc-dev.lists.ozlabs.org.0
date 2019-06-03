Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9432682
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 04:16:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HJZb1LjNzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 12:16:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HJXK4nkPzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 12:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="NKiwhnD/"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45HJXK2xG1z9s4V; Mon,  3 Jun 2019 12:14:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1559528065;
 bh=xCgkrpwLbkg9tDhWKofkOH6HMboontiaU70JSXUUlJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKiwhnD/+UJCJPOjt899/ThfTkjOS9RBFoujk36Q8RLAtoES107vOpxCBzeCOKkoi
 0P7tAWJGjxs38jA5QY2PYLVxXpytwF2tNB7kGAjjEQmN9aRWQkwx+Lyy5qD90A/h0v
 fRtk0TNa8QOVdwEXlCvOfpBs8y5qe7Arl/2Ylc08=
Date: Mon, 3 Jun 2019 12:03:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v3 1/3] powerpc/iommu: Allow bypass-only for DMA
Message-ID: <20190603020349.GB3411@umbus.fritz.box>
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <20190530070355.121802-2-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <20190530070355.121802-2-aik@ozlabs.ru>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 05:03:53PM +1000, Alexey Kardashevskiy wrote:
> POWER8 and newer support a bypass mode which maps all host memory to
> PCI buses so an IOMMU table is not always required. However if we fail to
> create such a table, the DMA setup fails and the kernel does not boot.
>=20
> This skips the 32bit DMA setup check if the bypass is can be selected.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>=20
> This minor thing helped me debugging next 2 patches so it can help
> somebody else too.
> ---
>  arch/powerpc/kernel/dma-iommu.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-io=
mmu.c
> index 09231ef06d01..809c1dc01edf 100644
> --- a/arch/powerpc/kernel/dma-iommu.c
> +++ b/arch/powerpc/kernel/dma-iommu.c
> @@ -118,18 +118,17 @@ int dma_iommu_dma_supported(struct device *dev, u64=
 mask)
>  {
>  	struct iommu_table *tbl =3D get_iommu_table_base(dev);
> =20
> -	if (!tbl) {
> -		dev_info(dev, "Warning: IOMMU dma not supported: mask 0x%08llx"
> -			", table unavailable\n", mask);
> -		return 0;
> -	}
> -
>  	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
>  		dev->archdata.iommu_bypass =3D true;
>  		dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
>  		return 1;
>  	}
> =20
> +	if (!tbl) {
> +		dev_err(dev, "Warning: IOMMU dma not supported: mask 0x%08llx, table u=
navailable\n", mask);
> +		return 0;
> +	}
> +
>  	if (tbl->it_offset > (mask >> tbl->it_page_shift)) {
>  		dev_info(dev, "Warning: IOMMU offset too big for device mask\n");
>  		dev_info(dev, "mask: 0x%08llx, table offset: 0x%08lx\n",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlz0gAIACgkQbDjKyiDZ
s5JYyxAAniTJ9FJnUPGWo2wWvCB2es38BHCX3vTWyh7hODggkByaCsvx2loscfMs
YxrHsgxZQXebrUFaAhnKfwsoJXlVpTxsBNpbMu5C15eGxy/2wADwys8DCq5BsG5B
8uTkhX3bLevaE85xP/cs1kZQO9ZOsgULJ0dknxlDHDROhWKRMJUFv/hPfioX7l/7
601ngW/bAxKTqH/riS7PDd4sra/AoPBBa2LqO8iZzQCKWmXVWn8o0BJ6x9+5psnJ
Ve2bsV32AA2M0MiDj/WPRQXqA9GRAMZITcgZea6yFXa5gUlAGxdd5BXynJHal3Hm
nusPKq5WbGBmSg9tj3Rf5QliGl/GWRoPxt54qlYjLJvWkzL4ObUYUrX9YodUcBKQ
sBMQYGfJLaxSSzumuTUCuSAoc5uzNUF9i9AIbF3/w1SXOtG7hLnKs4rq76GBEt5b
TVr1t+vmmC3t+7TqX0UL2mLazudMMOQy9hVHExvlWMGaTvWz9ErODdtZf2XWtmQH
0M9EetXpXEPRr9OcFxvjPiASPJe4ZPbuyqShslcAq+Wuv9CkpbhW2fveb71NPv1l
tA80HUDPL9uObDkeWiIwH9lPwqQ6kb+i6JIqQjMwt3IvZQWFu6yC5LB6OB05Ru4T
rKn1UUMIyAtCBaQ3yV4e2xBxAKJ055DaUBXOCObNqbV7nv1pA58=
=mRGo
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
