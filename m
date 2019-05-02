Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D36CA119DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 15:14:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vwhL16DRzDqSr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 23:14:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vwds3qSczDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 23:12:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.b="UHUPD3aG"; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 44vwds1CQcz9sBV; Thu,  2 May 2019 23:12:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1556802721;
 bh=37+4LcvVNpQJpbna+sVAcGmSAv0VpF1uIFPuyG9MbFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UHUPD3aG2Ev4xDvhfulyFSnV0UUi3Rpzt+n+AyjfB+g/yNIs16bqcInMrnZya/N7J
 KIxRzmMwXg73yINekpTO1Y5AGs6Rh8HtkKe4fCpQoRuAS+VE1Iff4dP9dfnmfWaoYv
 diLtGHhadWrFR2ulQbHpZgbSyPae4sLngoPhxop4=
Date: Thu, 2 May 2019 14:27:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
Message-ID: <20190502042702.GH13618@umbus.fritz.box>
References: <20190501034221.18437-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CEUtFxTsmBsHRLs3"
Content-Disposition: inline
In-Reply-To: <20190501034221.18437-1-aik@ozlabs.ru>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--CEUtFxTsmBsHRLs3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 01:42:21PM +1000, Alexey Kardashevskiy wrote:
> At the moment, on 256CPU + 256 PCI devices guest, it takes the guest
> about 8.5sec to fetch the entire device tree via the client interface
> as the DT is traversed twice - for strings blob and for struct blob.
> Also, "getprop" is quite slow too as SLOF stores properties in a linked
> list.
>=20
> However, since [1] SLOF builds flattened device tree (FDT) for another
> purpose. [2] adds a new "fdt-fetch" client interface for the OS to fetch
> the FDT.
>=20
> This tries the new method; if not supported, this falls back to
> the old method.
>=20
> There is a change in the FDT layout - the old method produced
> (reserved map, strings, structs), the new one receives only strings and
> structs from the firmware and adds the final reserved map to the end,
> so it is (fw reserved map, strings, structs, reserved map).
> This still produces the same unflattened device tree.
>=20
> This merges the reserved map from the firmware into the kernel's reserved
> map. At the moment SLOF generates an empty reserved map so this does not
> change the existing behaviour in regard of reservations.
>=20
> This supports only v17 onward as only that version provides dt_struct_size
> which works as "fdt-fetch" only produces v17 blobs.
>=20
> If "fdt-fetch" is not available, the old method of fetching the DT is use=
d.
>=20
> [1] https://git.qemu.org/?p=3DSLOF.git;a=3Dcommitdiff;h=3De6fc84652c9c00
> [2] https://git.qemu.org/?p=3DSLOF.git;a=3Dcommit;h=3Decda95906930b80
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Hrm.  I've gotta say I'm not terribly convinced that it's worth adding
a new interface we'll need to maintain to save 8s on a somewhat
contrived testcase.

> ---
>  arch/powerpc/kernel/prom_init.c | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
> index f33ff4163a51..72e7a602b68e 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2457,6 +2457,48 @@ static void __init flatten_device_tree(void)
>  		prom_panic("Can't allocate initial device-tree chunk\n");
>  	mem_end =3D mem_start + room;
> =20
> +	hdr =3D (void *) mem_start;
> +	if (!call_prom_ret("fdt-fetch", 2, 1, NULL, mem_start,
> +				room - sizeof(mem_reserve_map)) &&
> +			hdr->version >=3D 17) {
> +		u32 size;
> +		struct mem_map_entry *fwrmap;
> +
> +		/* Fixup the boot cpuid */
> +		hdr->boot_cpuid_phys =3D cpu_to_be32(prom.cpu);
> +
> +		/*
> +		 * Store the struct and strings addresses, mostly
> +		 * for consistency, only dt_header_start actually matters later.
> +		 */
> +		dt_header_start =3D mem_start;
> +		dt_string_start =3D mem_start + be32_to_cpu(hdr->off_dt_strings);
> +		dt_string_end =3D dt_string_start +
> +			be32_to_cpu(hdr->dt_strings_size);
> +		dt_struct_start =3D mem_start + be32_to_cpu(hdr->off_dt_struct);
> +		dt_struct_end =3D dt_struct_start +
> +			be32_to_cpu(hdr->dt_struct_size);
> +
> +		/*
> +		 * Calculate the reserved map location (which we put
> +		 * at the blob end) and update total size.
> +		 */
> +		fwrmap =3D (void *)(mem_start + be32_to_cpu(hdr->off_mem_rsvmap));
> +		hdr->off_mem_rsvmap =3D hdr->totalsize;
> +		size =3D be32_to_cpu(hdr->totalsize);
> +		hdr->totalsize =3D cpu_to_be32(size + sizeof(mem_reserve_map));
> +
> +		/* Merge reserved map from firmware to ours */
> +		for ( ; fwrmap->size; ++fwrmap)
> +			reserve_mem(be64_to_cpu(fwrmap->base),
> +					be64_to_cpu(fwrmap->size));
> +
> +		rsvmap =3D (u64 *)(mem_start + size);
> +
> +		prom_debug("Fetched DTB: %d bytes to @%lx\n", size, mem_start);
> +		goto finalize_exit;
> +	}
> +
>  	/* Get root of tree */
>  	root =3D call_prom("peer", 1, 1, (phandle)0);
>  	if (root =3D=3D (phandle)0)
> @@ -2504,6 +2546,7 @@ static void __init flatten_device_tree(void)
>  	/* Version 16 is not backward compatible */
>  	hdr->last_comp_version =3D cpu_to_be32(0x10);
> =20
> +finalize_exit:
>  	/* Copy the reserve map in */
>  	memcpy(rsvmap, mem_reserve_map, sizeof(mem_reserve_map));
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CEUtFxTsmBsHRLs3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlzKcZYACgkQbDjKyiDZ
s5LlfRAAp/Y+Kv7jJhsP8gVvMzrCmB+EzSmQsZw2/Lr8Esf1LbPJSdar5HTMz1Dp
S0tg3EJQpr7aVwQGnj+tcZFVv1uR/dxgFvOI6QdrNtBDL4tCGW5V9noTUtR0pUXu
rqxbWbiJEYt46S4/TxHAy+qSIWsu1NeI9/+PXXLhVPFPaVqa1WGhtO7Eal1ZC3EH
VIEr/eTM1krKV7/VTEOzeb8ChE9xOI17izwarGhx1gpkCPgbq3hzHArVbcRbtpi0
ie9xHfgda1csijb5gjAKyUjnzGZHHItpjLTHmg3yHeXYKvlFr8OkpemfioHA8rth
oirwyi4dM+Z+uRRNQaV1oEh8/Q4nMlTZR2KhZFI3yaVJaPapCrHafCi4eqyuRz9b
ZAdYRuDxPhsiLndKpGd78cyCU2uYRAVCwKkx8I4AuG2C0YKBpIVBsrlm9/E+GU1K
jo5d0qYo3c6kHqFfjDA4FWe/yOzyYDkvoGpD737OgpxxQvtwHLBsiJyhsg5E3ys8
HZ2LHDKKVKo8WTGXkPEUgWhe6D/ndMQQPL7PBY4e4wZs6pBnv/ysa4Eru46L2BqO
x3UJxKGaDweuGJ4W7SHG6EY6EtBwIfd3NvRWXfhmZbqHX2kzLD0BXgshUkDxa7Cn
4aE/K7EU/1+9CNI4aeTSdLfJEY+AOczoTJ5QTK+e8cV5L4sjEok=
=SFqR
-----END PGP SIGNATURE-----

--CEUtFxTsmBsHRLs3--
