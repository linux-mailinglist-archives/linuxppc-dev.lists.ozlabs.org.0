Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB63B2555
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 05:17:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9QLM2MRZz3bs9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:17:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=GDBf8OX5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=GDBf8OX5; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9QKt6nPjz3019
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:17:22 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9QKr2CyHz9sXk; Thu, 24 Jun 2021 13:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624504640;
 bh=NbTQbQQ9qUR8H6RYZM+xj6EmkL92kbgF241vaPjjXzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDBf8OX5/51o0uCJtIyz0soti6TOegytzwhnFCKDDs7FsWVyqoe+PoVzjuCGmU2Cs
 WvOy2trBX/S5fermbXuJLtmkTPW+YaxnZa2uShAuhwBYOUnynZTFqz3GRZfXarroPE
 IcMP88oQFyoqb6A/8t3IyrTLwmOTocCcC2wfT8ig=
Date: Thu, 24 Jun 2021 11:46:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 1/7] powerpc/pseries: rename min_common_depth to
 primary_domain_index
Message-ID: <YNPj2tM3Nu7HwLDm@yekko>
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
 <20210617165105.574178-2-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LRFf1+pJXygmf9bq"
Content-Disposition: inline
In-Reply-To: <20210617165105.574178-2-aneesh.kumar@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 Daniel Henrique Barboza <danielhb413@gmail.com>, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--LRFf1+pJXygmf9bq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 10:20:59PM +0530, Aneesh Kumar K.V wrote:
> No functional change in this patch.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

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

--LRFf1+pJXygmf9bq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT49oACgkQbDjKyiDZ
s5KLRQ//e79QIhgHz3IpR6z23SSCPCAbhtQFkD3QnzXdp82KZuq8kcFbkt1jjlo6
o9+Pmkhzddu8eMxfN6RKeAVcbUfYg6F1zU6tXSFWRsNIG1YOtlio8HaqYi8neVWr
KcO8E6ozxxDB42PcyPLRwBZydJpF0lim/J1afJKj93WJ1tqb9oomuLBiOzNhrqDc
hiwOxLgWSXo4Fy83uiLc2zm3OvKYcJZDd413ChM6Zr+CEK8FYMeybkjh16axPDz/
KjHQyKoH8vw2HDuweE0moo1W4J6BBAWo0xis68goL221hg7xR3N5XOleu3hOWuzC
sQApOy8SW4zJorBWzvzQ8+FJw10N0XaiPX3zsbZl/iHbFAACFH4aktBnDHls584j
/PW/R9grq3MMgxeIoJP21JneJJyT6plMKo/E8iQPH6bK7HJOcT9rMKPPJmN+LoUL
6+UU+JHAKwTV0ypgrH21lxiGffDaDhQsydetCMeK/HIbUmiGG+SAkhLQ8q6gmEGe
ouq8wAzhH19AVFNRnC3eH1YaZ7Q4RAKqevKW10MtLZDw+xm4lCi6s8gw9qFaC9Ew
0GYfg0vzxqS1NPzTB9CeM321+LpGv/kLhKJT/mP6SlC6Fyulf6NT2+1NlAvd5nyf
GEz/tjAZ80aiSOh3XD+n3gJSvJIMZzW305D9volHiMapJqdNng8=
=nesG
-----END PGP SIGNATURE-----

--LRFf1+pJXygmf9bq--
