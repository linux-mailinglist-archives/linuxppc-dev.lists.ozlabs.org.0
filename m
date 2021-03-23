Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A27345566
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 03:14:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4FL648kHz3bmq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 13:14:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=gryQmbGN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=gryQmbGN; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4FKF0bqBz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:13:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4FKD3WGGz9sVS; Tue, 23 Mar 2021 13:13:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616465616;
 bh=BOuWa8UaE7ECNbJjXx2pAKCGGhQFwDrno0GolRKA3tY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gryQmbGNnM+eICmH6gcaPFrTGPObJJRRRaVwlNzbf45Qdb0e/7mdQzVVRYr+Q7pbB
 zZ8Kv2wFreSSe8C45J0qcDcU1a2TsvOtZE+UroS+qLoFuaCIy4BpCmFWSvMj4dAeHF
 8llPGXbbLioyNgO+hHvSGaXiZCG96lHcSdE60+BE=
Date: Tue, 23 Mar 2021 12:24:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v6 2/6] powerpc/book3s64/radix: Add H_RPT_INVALIDATE
 pgsize encodings to mmu_psize_def
Message-ID: <YFlDVCMpMW4ofP7D@yekko.fritz.box>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
 <20210311083939.595568-3-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZBgd1eIUYKsIz9Dp"
Content-Disposition: inline
In-Reply-To: <20210311083939.595568-3-bharata@linux.ibm.com>
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ZBgd1eIUYKsIz9Dp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 02:09:35PM +0530, Bharata B Rao wrote:
> Add a field to mmu_psize_def to store the page size encodings
> of H_RPT_INVALIDATE hcall. Initialize this while scanning the radix
> AP encodings. This will be used when invalidating with required
> page size encoding in the hcall.
>=20
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>

Having the table be the source of truth and implementing
psize_to_rpti_pgsize() in terms of it would be nicer.  But... I guess
you can't really do that, because you're dynamically initializing the
table from the device tree, but the device tree doesn't include the
RPTI encodings.  Oh well.

Reveiwed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 5 +++++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/incl=
ude/asm/book3s/64/mmu.h
> index eace8c3f7b0a..c02f42d1031e 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -19,6 +19,7 @@ struct mmu_psize_def {
>  	int		penc[MMU_PAGE_COUNT];	/* HPTE encoding */
>  	unsigned int	tlbiel;	/* tlbiel supported for that page size */
>  	unsigned long	avpnm;	/* bits to mask out in AVPN in the HPTE */
> +	unsigned long   h_rpt_pgsize; /* H_RPT_INVALIDATE page size encoding */
>  	union {
>  		unsigned long	sllp;	/* SLB L||LP (exact mask to use in slbmte) */
>  		unsigned long ap;	/* Ap encoding used by PowerISA 3.0 */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index 98f0b243c1ab..1b749899016b 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -486,6 +486,7 @@ static int __init radix_dt_scan_page_sizes(unsigned l=
ong node,
>  		def =3D &mmu_psize_defs[idx];
>  		def->shift =3D shift;
>  		def->ap  =3D ap;
> +		def->h_rpt_pgsize =3D psize_to_rpti_pgsize(idx);
>  	}
> =20
>  	/* needed ? */
> @@ -560,9 +561,13 @@ void __init radix__early_init_devtree(void)
>  		 */
>  		mmu_psize_defs[MMU_PAGE_4K].shift =3D 12;
>  		mmu_psize_defs[MMU_PAGE_4K].ap =3D 0x0;
> +		mmu_psize_defs[MMU_PAGE_4K].h_rpt_pgsize =3D
> +			psize_to_rpti_pgsize(MMU_PAGE_4K);
> =20
>  		mmu_psize_defs[MMU_PAGE_64K].shift =3D 16;
>  		mmu_psize_defs[MMU_PAGE_64K].ap =3D 0x5;
> +		mmu_psize_defs[MMU_PAGE_64K].h_rpt_pgsize =3D
> +			psize_to_rpti_pgsize(MMU_PAGE_64K);
>  	}
> =20
>  	/*

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZBgd1eIUYKsIz9Dp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZQ1MACgkQbDjKyiDZ
s5JFRRAA0oOFK9Q84n+MtxUJ7MAHvqkQaqSlF76S3JMuUqh2zpZJRZHmESXo2ZBL
1ZkpZUlHXbUo3yJYmVPQ9j8WPFegkyai+dvIuMFxc/DmB3WHEmHZfvfqsV5k4iy0
FceHtu1jtln45MQA1L/yqm6nCoCHMfan/rE12rt+q8wyf+3CHH0iccAFUoTZGguz
iOtw7ud4LxhpCGmSiiy2K9HsPSdhacraHXTIqrjuUw+wxfYSG0+R6DqWkByeAgK2
VQVGrEX0uzL/woRTuaFrcI8BnSVICofuyfaZH1mIDQabLYnk4eAhvNSPwY44xWUS
LpYAcMkNe/E6dnMqhbhcfn9xTzpWEAfKzLjGfoaAq8xsZCNAUIQQIqWgc+cceXX0
OWhaJPH4EvHPzdtGRvRotNsPXjyYf+qKL47y9TgHOxPYye4BSS6eGbW9Ecj2T2by
XNo+auFgR+BjtxaC1C/ewSMVAggB9NkARDhDCrpaI5D5rK/SMoSBSLm0AoFJVmID
T32cqyPh7zg69/CSMy5GLyfRclTSfVUfDmixg/yzr5z745/b84lGU9h9v7kLD0z6
f6fKWqDh/yKb7B9giM27wmW4IzI8+mwQNO4cMkyFGoafkTC4uNR/ddbFf/X9yfCu
HNZypYJpfsfIKXvtNKnkrC/MfAcLlWSUcLjCx3mCAZ66+jwMVGc=
=tCbh
-----END PGP SIGNATURE-----

--ZBgd1eIUYKsIz9Dp--
