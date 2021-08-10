Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4283E51ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 06:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkKTD1xLLz3bVS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 14:18:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=FaqbdAlx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=FaqbdAlx; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkKSV3CFLz304R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 14:18:17 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSQ6bfFz9t23; Tue, 10 Aug 2021 14:18:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569094;
 bh=28OYsa/xI1bHlopKtpWLM9YbXUIO00eNFr8qHXAhsGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FaqbdAlxC0cZnv7jiaST74ag7iFudYIOTRFtvBlxvrOzEtFTMV9BGsJaM/pjL41ba
 bzq7/Ung8aNmw46nQivOgj9YXzE6sQfCA1K8SwWFwyhZoRSAzioFkJnpEFT2ozyEAC
 kNhoDK29mjACbxOJPhM7hcGNhbC/Gf2qJgPbHn60=
Date: Tue, 10 Aug 2021 12:44:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 6/6] powerpc/pseries: Consolidate form1 distance
 initialization into a helper
Message-ID: <YRHoGta/GPp1PF/x@yekko>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
 <20210809052434.53978-7-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="no6RLbbsuaHuDDKi"
Content-Disposition: inline
In-Reply-To: <20210809052434.53978-7-aneesh.kumar@linux.ibm.com>
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


--no6RLbbsuaHuDDKi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:54:34AM +0530, Aneesh Kumar K.V wrote:
> Currently, we duplicate parsing code for ibm,associativity and
> ibm,associativity-lookup-arrays in the kernel. The associativity array pr=
ovided
> by these device tree properties are very similar and hence can use
> a helper to parse the node id and numa distance details.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Though I'd prefer to see these fixes folded in with the earlier patch.

> ---
>  arch/powerpc/mm/numa.c | 104 +++++++++++++++++++++++------------------
>  1 file changed, 58 insertions(+), 46 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index fffb3c40f595..e6d47fcba335 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -171,26 +171,36 @@ static void unmap_cpu_from_node(unsigned long cpu)
>  }
>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> =20
> -/*
> - * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> - * info is found.
> - */
> -static int associativity_to_nid(const __be32 *associativity)
> +static int __associativity_to_nid(const __be32 *associativity,
> +				  int max_array_sz)
>  {
> -	int nid =3D NUMA_NO_NODE;
> +	int nid;
> +	/*
> +	 * primary_domain_index is 1 based array index.
> +	 */
> +	int index =3D primary_domain_index  - 1;
> =20
> -	if (!numa_enabled)
> -		goto out;
> +	if (!numa_enabled || index >=3D max_array_sz)
> +		return NUMA_NO_NODE;
> =20
> -	if (of_read_number(associativity, 1) >=3D primary_domain_index)
> -		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> +	nid =3D of_read_number(&associativity[index], 1);
> =20
>  	/* POWER4 LPAR uses 0xffff as invalid node */
>  	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
>  		nid =3D NUMA_NO_NODE;
> -out:
>  	return nid;
>  }
> +/*
> + * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> + * info is found.
> + */
> +static int associativity_to_nid(const __be32 *associativity)
> +{
> +	int array_sz =3D of_read_number(associativity, 1);
> +
> +	/* Skip the first element in the associativity array */
> +	return __associativity_to_nid((associativity + 1), array_sz);
> +}
> =20
>  static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32 *cpu=
2_assoc)
>  {
> @@ -295,33 +305,39 @@ int of_node_to_nid(struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_node_to_nid);
> =20
> -static void __initialize_form1_numa_distance(const __be32 *associativity)
> +static void __initialize_form1_numa_distance(const __be32 *associativity,
> +					     int max_array_sz)
>  {
>  	int i, nid;
> =20
>  	if (affinity_form !=3D FORM1_AFFINITY)
>  		return;
> =20
> -	nid =3D associativity_to_nid(associativity);
> +	nid =3D __associativity_to_nid(associativity, max_array_sz);
>  	if (nid !=3D NUMA_NO_NODE) {
>  		for (i =3D 0; i < distance_ref_points_depth; i++) {
>  			const __be32 *entry;
> +			int index =3D be32_to_cpu(distance_ref_points[i]) - 1;
> +
> +			/*
> +			 * broken hierarchy, return with broken distance table
> +			 */
> +			if (WARN(index >=3D max_array_sz, "Broken ibm,associativity property"=
))
> +				return;
> =20
> -			entry =3D &associativity[be32_to_cpu(distance_ref_points[i])];
> +			entry =3D &associativity[index];
>  			distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
>  		}
>  	}
>  }
> =20
> -static void initialize_form1_numa_distance(struct device_node *node)
> +static void initialize_form1_numa_distance(const __be32 *associativity)
>  {
> -	const __be32 *associativity;
> -
> -	associativity =3D of_get_associativity(node);
> -	if (!associativity)
> -		return;
> +	int array_sz;
> =20
> -	__initialize_form1_numa_distance(associativity);
> +	array_sz =3D of_read_number(associativity, 1);
> +	/* Skip the first element in the associativity array */
> +	__initialize_form1_numa_distance(associativity + 1, array_sz);
>  }
> =20
>  /*
> @@ -334,7 +350,13 @@ void update_numa_distance(struct device_node *node)
>  	if (affinity_form =3D=3D FORM0_AFFINITY)
>  		return;
>  	else if (affinity_form =3D=3D FORM1_AFFINITY) {
> -		initialize_form1_numa_distance(node);
> +		const __be32 *associativity;
> +
> +		associativity =3D of_get_associativity(node);
> +		if (!associativity)
> +			return;
> +
> +		initialize_form1_numa_distance(associativity);
>  		return;
>  	}
> =20
> @@ -586,27 +608,17 @@ static int get_nid_and_numa_distance(struct drmem_l=
mb *lmb)
> =20
>  	if (primary_domain_index <=3D aa.array_sz &&
>  	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_array=
s) {
> -		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
> -		nid =3D of_read_number(&aa.arrays[index], 1);
> +		const __be32 *associativity;
> =20
> -		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> -			nid =3D default_nid;
> +		index =3D lmb->aa_index * aa.array_sz;
> +		associativity =3D &aa.arrays[index];
> +		nid =3D __associativity_to_nid(associativity, aa.array_sz);
>  		if (nid > 0 && affinity_form =3D=3D FORM1_AFFINITY) {
> -			int i;
> -			const __be32 *associativity;
> -
> -			index =3D lmb->aa_index * aa.array_sz;
> -			associativity =3D &aa.arrays[index];
>  			/*
> -			 * lookup array associativity entries have different format
> -			 * There is no length of the array as the first element.
> +			 * lookup array associativity entries have
> +			 * no length of the array as the first element.
>  			 */
> -			for (i =3D 0; i < distance_ref_points_depth; i++) {
> -				const __be32 *entry;
> -
> -				entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
> -				distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> -			}
> +			__initialize_form1_numa_distance(associativity, aa.array_sz);
>  		}
>  	}
>  	return nid;
> @@ -632,11 +644,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> =20
>  	if (primary_domain_index <=3D aa.array_sz &&
>  	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_array=
s) {
> -		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
> -		nid =3D of_read_number(&aa.arrays[index], 1);
> +		const __be32 *associativity;
> =20
> -		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> -			nid =3D default_nid;
> +		index =3D lmb->aa_index * aa.array_sz;
> +		associativity =3D &aa.arrays[index];
> +		nid =3D __associativity_to_nid(associativity, aa.array_sz);
>  	}
>  	return nid;
>  }
> @@ -939,7 +951,7 @@ static int __init parse_numa_properties(void)
> =20
>  		if (__vphn_get_associativity(i, vphn_assoc) =3D=3D 0) {
>  			nid =3D associativity_to_nid(vphn_assoc);
> -			__initialize_form1_numa_distance(vphn_assoc);
> +			initialize_form1_numa_distance(vphn_assoc);
>  		} else {
> =20
>  			/*
> @@ -953,7 +965,7 @@ static int __init parse_numa_properties(void)
>  			associativity =3D of_get_associativity(cpu);
>  			if (associativity) {
>  				nid =3D associativity_to_nid(associativity);
> -				__initialize_form1_numa_distance(associativity);
> +				initialize_form1_numa_distance(associativity);
>  			}
>  			of_node_put(cpu);
>  		}
> @@ -993,7 +1005,7 @@ static int __init parse_numa_properties(void)
>  		associativity =3D of_get_associativity(memory);
>  		if (associativity) {
>  			nid =3D associativity_to_nid(associativity);
> -			__initialize_form1_numa_distance(associativity);
> +			initialize_form1_numa_distance(associativity);
>  		} else
>  			nid =3D default_nid;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--no6RLbbsuaHuDDKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER6BoACgkQbDjKyiDZ
s5LQvhAA27BOP4mXt1ekgPQH9uPp1/88oSaXRtJwAAUp5SchczVW0+EQXs8Z+6dh
bB7HIYnRoUo7ING6sHsqWf7Hb8vr2yFhoQio4etW7Km+9RUEgwuSX7YmJ7gZglmf
oFrFVpOu/5bbF7UAOwVag/dHjgIObmMLuB1eXpP5FXlYJLZZdblyMfTi9pp2l5GF
brH3KEKM7LaLVqZc9f8NfWuXSo5R5GBbBLaduBSFTCSXDcpA+gsfRPsk9CRxh364
FoqTwmKBVjTWKlcU1f/LOsvob378j8OQgadPept2cazWk7wqruRHkg26BBZGmtVe
KOp52BaNI4jy9wNazP7yWyvor0847GdXDVBGXqZ0Ptv52C/Tplc0AqqrAFb9dmgi
YRDoSQtW4RMhm5/ahDd2zA8/QdsziARoeeXQLH6rWB+hP9Wis81w18ZTt/7X47YH
KsJQu5MhI5ag/nFwCMPwTgDSBXvvmoZMKuq5+nDz4eKyFAV7pyVl8MBBRAzjJGfp
ZfOX+c5OEG0OvpOI3wjd8BjwQkHbDpOJsU+OdVcIbdJ6v41SXfJhFH6vBSGMrIUW
NiN6MZWCbsFe9rPPuRbIiuw5gL4VX1xfhoWOyNUB3yxF61a15QtgR1OFoJFlsjHg
uwCHMOTZz4rm+3jwNwQl1My+ZTvIcKezNIFZtDrJQH42gFWZrMs=
=aLj/
-----END PGP SIGNATURE-----

--no6RLbbsuaHuDDKi--
