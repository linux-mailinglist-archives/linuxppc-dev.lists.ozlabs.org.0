Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607BB3A757B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:58:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vgh0JZYz3cPt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:58:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=QyGa6y0H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=QyGa6y0H; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vd23Gjpz302B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:56:22 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3vcz5wV5z9t1C; Tue, 15 Jun 2021 13:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623729379;
 bh=BcZ/cg2oFS6uVvN7tRreZRVWXB7LiGmmByS+7ax2kdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QyGa6y0HZMkZvaRVGrfehV9IJh16+X+BURWawg4SwVWkq3KKB1xAwgI3bGSZU90GP
 VT/J9ltQhOwsTHRB+7/6BMl51uuGuZ9E05L6ZxG32qnTKf28n2+VrBs8KDR7neXKZe
 KyaMCGC4ot23sZL3nOoBDkIHv+HEsv3bXfaL/Y0g=
Date: Tue, 15 Jun 2021 13:55:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
Message-ID: <YMgkyfc4g+na5GJZ@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pZUaXjPhWROx3E6P"
Content-Disposition: inline
In-Reply-To: <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--pZUaXjPhWROx3E6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
> FORM2 introduce a concept of secondary domain which is identical to the
> conceept of FORM1 primary domain. Use secondary domain as the numa node
> when using persistent memory device. For DAX kmem use the logical domain
> id introduced in FORM2. This new numa node
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
>  arch/powerpc/platforms/pseries/pseries.h  |  1 +
>  3 files changed, 45 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 86cd2af014f7..b9ac6d02e944 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *associ=
ativity)
>  	return nid;
>  }
> =20
> +int get_primary_and_secondary_domain(struct device_node *node, int *prim=
ary, int *secondary)
> +{
> +	int secondary_index;
> +	const __be32 *associativity;
> +
> +	if (!numa_enabled) {
> +		*primary =3D NUMA_NO_NODE;
> +		*secondary =3D NUMA_NO_NODE;
> +		return 0;
> +	}
> +
> +	associativity =3D of_get_associativity(node);
> +	if (!associativity)
> +		return -ENODEV;
> +
> +	if (of_read_number(associativity, 1) >=3D primary_domain_index) {
> +		*primary =3D of_read_number(&associativity[primary_domain_index], 1);
> +		secondary_index =3D of_read_number(&distance_ref_points[1], 1);

Secondary ID is always the second reference point, but primary depends
on the length of resources?  That seems very weird.

> +		*secondary =3D of_read_number(&associativity[secondary_index], 1);
> +	}
> +	if (*primary =3D=3D 0xffff || *primary >=3D nr_node_ids)
> +		*primary =3D NUMA_NO_NODE;
> +
> +	if (*secondary =3D=3D 0xffff || *secondary >=3D nr_node_ids)
> +		*secondary =3D NUMA_NO_NODE;
> +	return 0;
> +}
> +
>  /* Returns the nid associated with the given device tree node,
>   * or -1 if not found.
>   */
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/pla=
tforms/pseries/papr_scm.c
> index ef26fe40efb0..9bf2f1f3ddc5 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -18,6 +18,7 @@
>  #include <asm/plpar_wrappers.h>
>  #include <asm/papr_pdsm.h>
>  #include <asm/mce.h>
> +#include "pseries.h"
> =20
>  #define BIND_ANY_ADDR (~0ul)
> =20
> @@ -88,6 +89,8 @@ struct papr_scm_perf_stats {
>  struct papr_scm_priv {
>  	struct platform_device *pdev;
>  	struct device_node *dn;
> +	int numa_node;
> +	int target_node;
>  	uint32_t drc_index;
>  	uint64_t blocks;
>  	uint64_t block_size;
> @@ -923,7 +926,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv =
*p)
>  	struct nd_mapping_desc mapping;
>  	struct nd_region_desc ndr_desc;
>  	unsigned long dimm_flags;
> -	int target_nid, online_nid;
>  	ssize_t stat_size;
> =20
>  	p->bus_desc.ndctl =3D papr_scm_ndctl;
> @@ -974,10 +976,8 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv=
 *p)
>  	mapping.size =3D p->blocks * p->block_size; // XXX: potential overflow?
> =20
>  	memset(&ndr_desc, 0, sizeof(ndr_desc));
> -	target_nid =3D dev_to_node(&p->pdev->dev);
> -	online_nid =3D numa_map_to_online_node(target_nid);
> -	ndr_desc.numa_node =3D online_nid;
> -	ndr_desc.target_node =3D target_nid;
> +	ndr_desc.numa_node =3D p->numa_node;
> +	ndr_desc.target_node =3D p->target_node;
>  	ndr_desc.res =3D &p->res;
>  	ndr_desc.of_node =3D p->dn;
>  	ndr_desc.provider_data =3D p;
> @@ -1001,9 +1001,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_pri=
v *p)
>  				ndr_desc.res, p->dn);
>  		goto err;
>  	}
> -	if (target_nid !=3D online_nid)
> -		dev_info(dev, "Region registered with target node %d and online node %=
d",
> -			 target_nid, online_nid);
> =20
>  	mutex_lock(&papr_ndr_lock);
>  	list_add_tail(&p->region_list, &papr_nd_regions);
> @@ -1096,7 +1093,7 @@ static int papr_scm_probe(struct platform_device *p=
dev)
>  	struct papr_scm_priv *p;
>  	const char *uuid_str;
>  	u64 uuid[2];
> -	int rc;
> +	int rc, numa_node;
> =20
>  	/* check we have all the required DT properties */
>  	if (of_property_read_u32(dn, "ibm,my-drc-index", &drc_index)) {
> @@ -1119,11 +1116,20 @@ static int papr_scm_probe(struct platform_device =
*pdev)
>  		return -ENODEV;
>  	}
> =20
> -
>  	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
>  	if (!p)
>  		return -ENOMEM;
> =20
> +	if (get_primary_and_secondary_domain(dn, &p->target_node, &numa_node)) {
> +		dev_err(&pdev->dev, "%pOF: missing NUMA attributes!\n", dn);
> +		rc =3D -ENODEV;
> +		goto err;
> +	}
> +	p->numa_node =3D numa_map_to_online_node(numa_node);
> +	if (numa_node !=3D p->numa_node)
> +		dev_info(&pdev->dev, "Region registered with online node %d and device=
 tree node %d",
> +			 p->numa_node, numa_node);
> +
>  	/* Initialize the dimm mutex */
>  	mutex_init(&p->health_mutex);
> =20
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
> index 663a0859cf13..9c2a1fc9ded1 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -114,4 +114,5 @@ void pseries_setup_security_mitigations(void);
>  void pseries_lpar_read_hblkrm_characteristics(void);
> =20
>  void update_numa_distance(struct device_node *node);
> +int get_primary_and_secondary_domain(struct device_node *node, int *prim=
ary, int *secondary);
>  #endif /* _PSERIES_PSERIES_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pZUaXjPhWROx3E6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIJMkACgkQbDjKyiDZ
s5J9hxAAmgHBW4j/S+qvVvd9K1T5uMzaDBYohLb3NtPknxqwTm7CfMMj1eGOBgcU
Y7Gj95fckR3YUWGqOI+JucHFihkupQ3+/Wn4EzDlTwqTvcnnVVaGD0YmJaxUgMcF
WgIVmkj79bhQoWQYOh88d/3u7TtqJMPiXM+imdiLcN+9gP9qvsU7KmTltJEZ1zUp
rkXkRA8N/8dre6tXTBPiPbnYmeHv6lTZwyfR1gT/ESvqcDl70tBT0YSQSzSrXGQg
YimqHg7sfWpK+TgDEgFVlrK0WgVN9Ai7r2REe0zXIdHjUtWX3vEfVVksvGGRQVpb
Qecn4SawqBana+yFJhneiY08CEq63RYUDAyUNaJI6N3TkztYOAXoxNBYc/YnRPhV
n9XPMR1JlXv6bSZ8Qp260vsoMtIM48Xred19s3RvZqMR9sIKeqg5B0I1uQUut0yo
bhWNdEGY+jpSFWb6tbEni6RM5sfg/8keUe8deBM2dmIt88dNAoW7z7/5r8qha3uR
CCRoNK8/Jodlncd2WDztEABO5u0NH0UsUMAB0pv7cQoDYVTGBjRItkTKvRtV/QKA
eRk35Z9Qk1vXs/URY8ytrq0OLe/zkxNF+Tbg/uHnm16nKnlWdXRlD2GY3c2JnjUt
60cHVgUjrPfdvWKLExmaxekQ+Bd0DS5W9Tx97+3avMcrlkgBTAk=
=pQ2q
-----END PGP SIGNATURE-----

--pZUaXjPhWROx3E6P--
