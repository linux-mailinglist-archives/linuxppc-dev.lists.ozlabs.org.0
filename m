Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1321E64855
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:27:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kM2w67lqzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:27:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kLvr4gtfzDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:21:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="Rrb7mKSJ"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45kLvp65xbz9sML; Thu, 11 Jul 2019 00:21:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562768470;
 bh=sI/DH+2qaA00u9gLOeXhABtLZGyr1KrwFk1UKAd0av0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rrb7mKSJYp9FZP7ypfXBRYjnss/Z2OSi0QR4liiY+jS9NciIXcMG1wAeb+QDTIGUW
 DUlIkRF3IBf6YBOcqagQ3nWxd3yWcJg1I50neWRRaHPc8kVOKYShODhJetFh402ejG
 lxktRQr7pR4FwWlRIrY4M5NH2nc/WQhkxxmSc6hs=
Date: Thu, 11 Jul 2019 00:21:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: Re: [PATCH] powerpc: mm: Limit rma_size to 1TB when running without
 HV mode
Message-ID: <20190710142103.GB3360@umbus.fritz.box>
References: <20190710052018.14628-1-sjitindarsingh@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline
In-Reply-To: <20190710052018.14628-1-sjitindarsingh@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 03:20:18PM +1000, Suraj Jitindar Singh wrote:
> The virtual real mode addressing (VRMA) mechanism is used when a
> partition is using HPT (Hash Page Table) translation and performs
> real mode accesses (MSR[IR|DR] =3D 0) in non-hypervisor mode. In this
> mode effective address bits 0:23 are treated as zero (i.e. the access
> is aliased to 0) and the access is performed using an implicit 1TB SLB
> entry.
>=20
> The size of the RMA (Real Memory Area) is communicated to the guest as
> the size of the first memory region in the device tree. And because of
> the mechanism described above can be expected to not exceed 1TB. In the
> event that the host erroneously represents the RMA as being larger than
> 1TB, guest accesses in real mode to memory addresses above 1TB will be
> aliased down to below 1TB. This means that a memory access performed in
> real mode may differ to one performed in virtual mode for the same memory
> address, which would likely have unintended consequences.
>=20
> To avoid this outcome have the guest explicitly limit the size of the
> RMA to the current maximum, which is 1TB. This means that even if the
> first memory block is larger than 1TB, only the first 1TB should be
> accessed in real mode.
>=20
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Although I'd really like to also see some comments added in
allocate_paca_ptrs() explaining the constraints there.

Oh, also, basing this on the non-compat PVR is bogus, but it's still
better than what we had.

> ---
>  arch/powerpc/mm/book3s64/hash_utils.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index 28ced26f2a00..4d0e2cce9cd5 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1901,11 +1901,19 @@ void hash__setup_initial_memory_limit(phys_addr_t=
 first_memblock_base,
>  	 *
>  	 * For guests on platforms before POWER9, we clamp the it limit to 1G
>  	 * to avoid some funky things such as RTAS bugs etc...
> +	 * On POWER9 we limit to 1TB in case the host erroneously told us that
> +	 * the RMA was >1TB. Effective address bits 0:23 are treated as zero
> +	 * (meaning the access is aliased to zero i.e. addr =3D addr % 1TB)
> +	 * for virtual real mode addressing and so it doesn't make sense to
> +	 * have an area larger than 1TB as it can't be addressed.
>  	 */
>  	if (!early_cpu_has_feature(CPU_FTR_HVMODE)) {
>  		ppc64_rma_size =3D first_memblock_size;
>  		if (!early_cpu_has_feature(CPU_FTR_ARCH_300))
>  			ppc64_rma_size =3D min_t(u64, ppc64_rma_size, 0x40000000);
> +		else
> +			ppc64_rma_size =3D min_t(u64, ppc64_rma_size,
> +					       1UL << SID_SHIFT_1T);
> =20
>  		/* Finally limit subsequent allocations */
>  		memblock_set_current_limit(ppc64_rma_size);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0l9E8ACgkQbDjKyiDZ
s5IFWA//TbXp2jHT0NBL9otaSEjTz+MMPoqimPeOEE7+whNl6AfJDpInMoQEmLNT
sc6j5UFW8jmr+3E8ftnWfpsRpcvdpksvROn7knfR3GoxcecOupQ8o+GMOL/xfkL/
UHF03iiwu3/oBFJiKYMHJ/g4d0YtkZKHopZ9fsy0avUl1BtHzB4MKpZH1fx4mlSx
amyZ9A8nNIno7Yxo4igZA1XPlSgD6kozJe5GvCTLs3RoGUyZHA8nzMpp9h2C0Vfs
H3vIOFWiHP/EvQrPetjhu7e6HokixKFo3w7dQvGY5S48y7coV8ZDQMFh31MBFKUT
7FmSTAbGis4kFghOQRlx/eA7rNI4zuvdvil0By27fSUM9EJMiLY9unsAAc+m9wFF
MfxRPOgZy+XXhGtb+lzxETUKbydf+OOvg4c14nonsg/4ADyhwENKLr3b5pZryzDg
9JQyyReXjWXJw7jNcOeO9XOaFer7Gr4a14ruyyfDYzQnfHBOBSbc+m1pXtPd/wMz
e+u5NhnYemlJtl1s+5CP7s+n/p+7oPPkf8f9njjJ7OYu5ULsRAEkr6h57dyzJCx0
mWTyKc0+iKFrOio+ZQ2NGekwYjkNXpPXoHKBKHyATk9Vo5lroG8gXyx5i4jg74VE
WGGosHiDDJqQnDTZrY2bsFFQLJEXT+cGITVsgYwR+ByfEWC21Ig=
=x96O
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
