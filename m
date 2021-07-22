Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D44AA3D1BD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 04:38:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVc8Y5m4kz3dNv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 12:38:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=dm1N32Ry;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=dm1N32Ry; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVc6J3QR1z2yNH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 12:36:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVc6D33hrz9sXN; Thu, 22 Jul 2021 12:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626921412;
 bh=k4lunyI4RtYy3GufZNL/9iw31Zb0ULO0BhUT+ECWSiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dm1N32RyyesbcVUiapeQsICpKg5mnBFALEJ60Jk5FUhFnbumE+WiTpLfXBrMsh8hA
 cAgvQ40Ohk4M//Flh4E4RPZg8BPWBO8GfPh7bl7Z1L10ChLOLlwX6CPvfaAIjGCNvg
 iuLXwZltUbeC+ysrAZq0QhKNhQLZ4WTL4PfICHY0=
Date: Thu, 22 Jul 2021 11:59:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 1/6] powerpc/pseries: rename min_common_depth to
 primary_domain_index
Message-ID: <YPjQ85wtr165BOMa@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-2-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x2APMNgBTlib2UhL"
Content-Disposition: inline
In-Reply-To: <20210628151117.545935-2-aneesh.kumar@linux.ibm.com>
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


--x2APMNgBTlib2UhL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 08:41:12PM +0530, Aneesh Kumar K.V wrote:
> No functional change in this patch.

The new name does not match how you describe "primary domain index" in
the documentation from patch 6/6.  There it comes from the values in
associativity-reference-points, but here it simply comes from the
lengths of all the associativity properties.

>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index f2bf98bdcea2..8365b298ec48 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -51,7 +51,7 @@ EXPORT_SYMBOL(numa_cpu_lookup_table);
>  EXPORT_SYMBOL(node_to_cpumask_map);
>  EXPORT_SYMBOL(node_data);
> =20
> -static int min_common_depth;
> +static int primary_domain_index;
>  static int n_mem_addr_cells, n_mem_size_cells;
>  static int form1_affinity;
> =20
> @@ -232,8 +232,8 @@ static int associativity_to_nid(const __be32 *associa=
tivity)
>  	if (!numa_enabled)
>  		goto out;
> =20
> -	if (of_read_number(associativity, 1) >=3D min_common_depth)
> -		nid =3D of_read_number(&associativity[min_common_depth], 1);
> +	if (of_read_number(associativity, 1) >=3D primary_domain_index)
> +		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> =20
>  	/* POWER4 LPAR uses 0xffff as invalid node */
>  	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> @@ -284,9 +284,9 @@ int of_node_to_nid(struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_node_to_nid);
> =20
> -static int __init find_min_common_depth(void)
> +static int __init find_primary_domain_index(void)
>  {
> -	int depth;
> +	int index;
>  	struct device_node *root;
> =20
>  	if (firmware_has_feature(FW_FEATURE_OPAL))
> @@ -326,7 +326,7 @@ static int __init find_min_common_depth(void)
>  	}
> =20
>  	if (form1_affinity) {
> -		depth =3D of_read_number(distance_ref_points, 1);
> +		index =3D of_read_number(distance_ref_points, 1);
>  	} else {
>  		if (distance_ref_points_depth < 2) {
>  			printk(KERN_WARNING "NUMA: "
> @@ -334,7 +334,7 @@ static int __init find_min_common_depth(void)
>  			goto err;
>  		}
> =20
> -		depth =3D of_read_number(&distance_ref_points[1], 1);
> +		index =3D of_read_number(&distance_ref_points[1], 1);
>  	}
> =20
>  	/*
> @@ -348,7 +348,7 @@ static int __init find_min_common_depth(void)
>  	}
> =20
>  	of_node_put(root);
> -	return depth;
> +	return index;
> =20
>  err:
>  	of_node_put(root);
> @@ -437,16 +437,16 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
>  	int nid =3D default_nid;
>  	int rc, index;
> =20
> -	if ((min_common_depth < 0) || !numa_enabled)
> +	if ((primary_domain_index < 0) || !numa_enabled)
>  		return default_nid;
> =20
>  	rc =3D of_get_assoc_arrays(&aa);
>  	if (rc)
>  		return default_nid;
> =20
> -	if (min_common_depth <=3D aa.array_sz &&
> +	if (primary_domain_index <=3D aa.array_sz &&
>  	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_array=
s) {
> -		index =3D lmb->aa_index * aa.array_sz + min_common_depth - 1;
> +		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
>  		nid =3D of_read_number(&aa.arrays[index], 1);
> =20
>  		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> @@ -708,18 +708,18 @@ static int __init parse_numa_properties(void)
>  		return -1;
>  	}
> =20
> -	min_common_depth =3D find_min_common_depth();
> +	primary_domain_index =3D find_primary_domain_index();
> =20
> -	if (min_common_depth < 0) {
> +	if (primary_domain_index < 0) {
>  		/*
> -		 * if we fail to parse min_common_depth from device tree
> +		 * if we fail to parse primary_domain_index from device tree
>  		 * mark the numa disabled, boot with numa disabled.
>  		 */
>  		numa_enabled =3D false;
> -		return min_common_depth;
> +		return primary_domain_index;
>  	}
> =20
> -	dbg("NUMA associativity depth for CPU/Memory: %d\n", min_common_depth);
> +	dbg("NUMA associativity depth for CPU/Memory: %d\n", primary_domain_ind=
ex);
> =20
>  	/*
>  	 * Even though we connect cpus to numa domains later in SMP
> @@ -919,14 +919,14 @@ static void __init find_possible_nodes(void)
>  			goto out;
>  	}
> =20
> -	max_nodes =3D of_read_number(&domains[min_common_depth], 1);
> +	max_nodes =3D of_read_number(&domains[primary_domain_index], 1);
>  	for (i =3D 0; i < max_nodes; i++) {
>  		if (!node_possible(i))
>  			node_set(i, node_possible_map);
>  	}
> =20
>  	prop_length /=3D sizeof(int);
> -	if (prop_length > min_common_depth + 2)
> +	if (prop_length > primary_domain_index + 2)
>  		coregroup_enabled =3D 1;
> =20
>  out:
> @@ -1259,7 +1259,7 @@ int cpu_to_coregroup_id(int cpu)
>  		goto out;
> =20
>  	index =3D of_read_number(associativity, 1);
> -	if (index > min_common_depth + 1)
> +	if (index > primary_domain_index + 1)
>  		return of_read_number(&associativity[index - 1], 1);
> =20
>  out:

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--x2APMNgBTlib2UhL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD40PEACgkQbDjKyiDZ
s5J64Q//enA1kPfcReeWG39j14CPoqx9tU3DLyrncImoVPSFVTwi6loqG05DB16M
bBNNQAjBxNvNEqH1FNhbExPPf9KVnQrYVf9XxAf2I69jPWAABxgbA1WR691GodkD
VZDqnTBkGJBFKUF2G7mFF9ugG9Bnaa8Z+N9fC7XZIHY38cwZ5GWB7klqPJOPmtlz
xRaKwkjkyYVT0xBIssWwi475QCKozZw/6330GmxNdPxJLd5TbUnPImMxbYCEflX9
68fNcROKPZxCUFs3RiF9AOYUuSDgn7c7pLNjfqHRcTjXpo9K4JUm/P6kecRW1iY2
N23Fi6DgYJ3KbHHK7VDgKsjcEGCSLpH1Q9tqkqMHC4fVMJvlWC71IIXBi9G9sjfx
/0QrAZv6TekezFiN7qym1aLhsCHSDxrq8SQqBpVDmckykPZR7auIiLsvjuq3GFbw
1xq8AopNGLS7rV9U5QAUo7aHbVaAffBFAoMF9MJuiKBYGhC0k+NK+rYfjqIfpdqb
ys/ilIt1PQBzGOEnnNztlkq9KRmZSAh43RWRpeP/t8r+yrGMK70eyrzMKCLp8HF4
+OrTI2aBXVMyXgyPEL3qxxq/26SmJnh30SFubqup9PObOxvJB76XfXU1Ozms9kPA
154IFCXX8lU/ZxH1gHARqrEan79F4Qzxv+UgPxiZxVpPG+SQHRk=
=mF4z
-----END PGP SIGNATURE-----

--x2APMNgBTlib2UhL--
