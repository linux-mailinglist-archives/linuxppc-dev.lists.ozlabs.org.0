Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE45539D454
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:25:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz1zR3j8pz306N
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:25:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=la5gMiMV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=la5gMiMV; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz1yw1lmqz2yWP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:24:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fz1yt0gLrz9sVt; Mon,  7 Jun 2021 15:24:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623043494;
 bh=JAc5YQzpeD5lW7Z9BAWmTNGY3yGElPglJxBgcJp9NPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=la5gMiMVqFDI3LD2ipJ1hTo5ZfOcV1F8BSn40ZV9xHLJ0hhkfnpIZSMFEPGkgSb0s
 mbLES8oEurirxBwaJzlkoYGqWM8ACE3Xz5WH+/TVZWXnFEMa5G++tfoZ/Od7v+q4Xf
 NzWhQHJuoLEWcPvPKx9cNbitSY9TnON0cJYuPHJE=
Date: Mon, 7 Jun 2021 15:02:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/mm/hash: Avoid resizing-down HPT on first
 memory hotplug
Message-ID: <YL2obsnp4rWbW6CV@yekko>
References: <20210430143607.135005-1-leobras.c@gmail.com>
 <20210430143607.135005-2-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TVn+HWIGqqi/A3Yw"
Content-Disposition: inline
In-Reply-To: <20210430143607.135005-2-leobras.c@gmail.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--TVn+HWIGqqi/A3Yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 11:36:06AM -0300, Leonardo Bras wrote:
> Because hypervisors may need to create HPTs without knowing the guest
> page size, the smallest used page-size (4k) may be chosen, resulting in
> a HPT that is possibly bigger than needed.
>=20
> On a guest with bigger page-sizes, the amount of entries for HTP may be
> too high, causing the guest to ask for a HPT resize-down on the first
> hotplug.
>=20
> This becomes a problem when HPT resize-down fails, and causes the
> HPT resize to be performed on every LMB added, until HPT size is
> compatible to guest memory size, causing a major slowdown.
>=20
> So, avoiding HPT resizing-down on hot-add significantly improves memory
> hotplug times.
>=20
> As an example, hotplugging 256GB on a 129GB guest took 710s without this
> patch, and 21s after applied.
>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Sorry it's taken me so long to look at these

I don't love the extra statefulness that the 'shrinking' parameter
adds, but I can't see an elegant way to avoid it, so:

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/mm/book3s64/hash_utils.c | 36 ++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index 581b20a2feaf..608e4ed397a9 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -795,7 +795,7 @@ static unsigned long __init htab_get_table_size(void)
>  }
> =20
>  #ifdef CONFIG_MEMORY_HOTPLUG
> -static int resize_hpt_for_hotplug(unsigned long new_mem_size)
> +static int resize_hpt_for_hotplug(unsigned long new_mem_size, bool shrin=
king)
>  {
>  	unsigned target_hpt_shift;
> =20
> @@ -804,19 +804,25 @@ static int resize_hpt_for_hotplug(unsigned long new=
_mem_size)
> =20
>  	target_hpt_shift =3D htab_shift_for_mem_size(new_mem_size);
> =20
> -	/*
> -	 * To avoid lots of HPT resizes if memory size is fluctuating
> -	 * across a boundary, we deliberately have some hysterisis
> -	 * here: we immediately increase the HPT size if the target
> -	 * shift exceeds the current shift, but we won't attempt to
> -	 * reduce unless the target shift is at least 2 below the
> -	 * current shift
> -	 */
> -	if (target_hpt_shift > ppc64_pft_size ||
> -	    target_hpt_shift < ppc64_pft_size - 1)
> -		return mmu_hash_ops.resize_hpt(target_hpt_shift);
> +	if (shrinking) {
> =20
> -	return 0;
> +		/*
> +		 * To avoid lots of HPT resizes if memory size is fluctuating
> +		 * across a boundary, we deliberately have some hysterisis
> +		 * here: we immediately increase the HPT size if the target
> +		 * shift exceeds the current shift, but we won't attempt to
> +		 * reduce unless the target shift is at least 2 below the
> +		 * current shift
> +		 */
> +
> +		if (target_hpt_shift >=3D ppc64_pft_size - 1)
> +			return 0;
> +
> +	} else if (target_hpt_shift <=3D ppc64_pft_size) {
> +		return 0;
> +	}
> +
> +	return mmu_hash_ops.resize_hpt(target_hpt_shift);
>  }
> =20
>  int hash__create_section_mapping(unsigned long start, unsigned long end,
> @@ -829,7 +835,7 @@ int hash__create_section_mapping(unsigned long start,=
 unsigned long end,
>  		return -1;
>  	}
> =20
> -	resize_hpt_for_hotplug(memblock_phys_mem_size());
> +	resize_hpt_for_hotplug(memblock_phys_mem_size(), false);
> =20
>  	rc =3D htab_bolt_mapping(start, end, __pa(start),
>  			       pgprot_val(prot), mmu_linear_psize,
> @@ -848,7 +854,7 @@ int hash__remove_section_mapping(unsigned long start,=
 unsigned long end)
>  	int rc =3D htab_remove_mapping(start, end, mmu_linear_psize,
>  				     mmu_kernel_ssize);
> =20
> -	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) =3D=3D -ENOSPC)
> +	if (resize_hpt_for_hotplug(memblock_phys_mem_size(), true) =3D=3D -ENOS=
PC)
>  		pr_warn("Hash collision while resizing HPT\n");
> =20
>  	return rc;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TVn+HWIGqqi/A3Yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC9qGsACgkQbDjKyiDZ
s5JPbg//RGtldhbo5pK+Rz/xEmNtdPSemDKF3FMVpDcpq6Khn673HgaimTHLrLVL
Jf6zp0vSROpSF1l4oy+TP3xORDxjf69/q1Uen95NWzYlbw2Wm97gdt2jWjErPSeL
dmtGmA4+VuGZMExX3kOFqkl3f2IB2C/fyf6DW39OCinjlFOewOX+dNhdxP1MTnqs
F22VN8kEiwsfloVYeD8NkHuXBDvcBic6lE67sYJTOmfUDT2kkzbz2QeqzZvJzV9Y
ZEBZuIYR9wxiKZDunbmW+cVjp75l3KmO3QhJLOaJstF48tvtiitIJd2PnqPM5wlU
b9S/NazPpbgAssrJYuJl0qwVYwDIhPyrg8SMxOqJ8AUtboZ37PLz0smhuSn+zO5s
o8jOIPt/Xod2SgYgSbTD8a6pdKuKKeS4kfwW/sS8afxBkZFJ3u7kMoqrBNEsyHMJ
YlokVD8BuksKGVrfaXJnE7UiioPilOT4PwcPjcN8nSGATx0jajl+Rw1l4WUnbgbp
14RwAxMRKsgKfaWx0i5wOvPWGGCUUpYCeZgIrHIcMqO09x0wL4t1y28Cu64fBbJI
PpOpwnnKDkC55YVGBJn2htLPOVQEN4dt8qoVzpPuUZ9eO4cYH1auA6fzzs4DlU9u
IOFnl64i2q9K696dxDDAb8ZNjgti1OsSGZ5YXd5vSpVTMbM8Eh8=
=tKLo
-----END PGP SIGNATURE-----

--TVn+HWIGqqi/A3Yw--
