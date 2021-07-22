Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CAE3D1BD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 04:38:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVc873vyTz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 12:38:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=Yl2sbvKX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=Yl2sbvKX; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVc6J2Hqsz2yMW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 12:36:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVc6D2PFjz9sXJ; Thu, 22 Jul 2021 12:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626921412;
 bh=5dKTTvurfill58ozgULkYAP/mq31p4Wf8OrUO64aTis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yl2sbvKXCvMwq5VSvU1Xq159BYGP3f4Nb1vqYSRN6+rz2sAZfy+maHLAQYafcX/sz
 KYEPlwOpBZMbpw8Of8X9LAKKihmVc8Rww5OnJ9IjiCIHrc4X0LzdEnm9N48b8yDRt2
 z6dvfD3w1ylDrzkS6N0iXjJKOOq7Wm0utSrUMe1M=
Date: Thu, 22 Jul 2021 11:40:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 4/6] powerpc/pseries: Consolidate different NUMA
 distance update code paths
Message-ID: <YPjMkQ5W1fSQdzNe@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-5-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9aKIG8agTwQmi6GV"
Content-Disposition: inline
In-Reply-To: <20210628151117.545935-5-aneesh.kumar@linux.ibm.com>
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


--9aKIG8agTwQmi6GV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 08:41:15PM +0530, Aneesh Kumar K.V wrote:
> The associativity details of the newly added resourced are collected from
> the hypervisor via "ibm,configure-connector" rtas call. Update the numa
> distance details of the newly added numa node after the above call.
>=20
> Instead of updating NUMA distance every time we lookup a node id
> from the associativity property, add helpers that can be used
> during boot which does this only once. Also remove the distance
> update from node id lookup helpers.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c                        | 173 +++++++++++++-----
>  arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
>  .../platforms/pseries/hotplug-memory.c        |   2 +
>  arch/powerpc/platforms/pseries/pseries.h      |   1 +
>  4 files changed, 132 insertions(+), 46 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 0ec16999beef..7b142f79d600 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -208,22 +208,6 @@ int __node_distance(int a, int b)
>  }
>  EXPORT_SYMBOL(__node_distance);
> =20
> -static void initialize_distance_lookup_table(int nid,
> -		const __be32 *associativity)
> -{
> -	int i;
> -
> -	if (affinity_form !=3D FORM1_AFFINITY)
> -		return;
> -
> -	for (i =3D 0; i < max_associativity_domain_index; i++) {
> -		const __be32 *entry;
> -
> -		entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
> -		distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> -	}
> -}
> -
>  /*
>   * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
>   * info is found.
> @@ -241,15 +225,6 @@ static int associativity_to_nid(const __be32 *associ=
ativity)
>  	/* POWER4 LPAR uses 0xffff as invalid node */
>  	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
>  		nid =3D NUMA_NO_NODE;
> -
> -	if (nid > 0 &&
> -		of_read_number(associativity, 1) >=3D max_associativity_domain_index) {
> -		/*
> -		 * Skip the length field and send start of associativity array
> -		 */
> -		initialize_distance_lookup_table(nid, associativity + 1);
> -	}
> -
>  out:
>  	return nid;
>  }
> @@ -287,6 +262,49 @@ int of_node_to_nid(struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_node_to_nid);
> =20
> +static void __initialize_form1_numa_distance(const __be32 *associativity)
> +{
> +	int i, nid;
> +
> +	if (affinity_form !=3D FORM1_AFFINITY)

Since this shouldn't be called on a !form1 system, this could be a WARN_ON(=
).

> +		return;
> +
> +	if (of_read_number(associativity, 1) >=3D primary_domain_index) {
> +		nid =3D of_read_number(&associativity[primary_domain_index], 1);

This computes the nid from the assoc array independently of
associativity_to_nid, which doesn't seem like a good idea.  Wouldn't
it be better to call assocaitivity_to_nid(), then make the next bit
conditional on nid !=3D=3D NUMA_NO_NODE?

> +
> +		for (i =3D 0; i < max_associativity_domain_index; i++) {
> +			const __be32 *entry;
> +
> +			entry =3D &associativity[be32_to_cpu(distance_ref_points[i])];
> +			distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> +		}
> +	}
> +}
> +
> +static void initialize_form1_numa_distance(struct device_node *node)
> +{
> +	const __be32 *associativity;
> +
> +	associativity =3D of_get_associativity(node);
> +	if (!associativity)
> +		return;
> +
> +	__initialize_form1_numa_distance(associativity);
> +}
> +
> +/*
> + * Used to update distance information w.r.t newly added node.
> + */
> +void update_numa_distance(struct device_node *node)
> +{
> +	if (affinity_form =3D=3D FORM0_AFFINITY)
> +		return;
> +	else if (affinity_form =3D=3D FORM1_AFFINITY) {
> +		initialize_form1_numa_distance(node);
> +		return;
> +	}
> +}
> +
>  static int __init find_primary_domain_index(void)
>  {
>  	int index;
> @@ -433,6 +451,48 @@ static int of_get_assoc_arrays(struct assoc_arrays *=
aa)
>  	return 0;
>  }
> =20
> +static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
> +{
> +	struct assoc_arrays aa =3D { .arrays =3D NULL };
> +	int default_nid =3D NUMA_NO_NODE;
> +	int nid =3D default_nid;
> +	int rc, index;
> +
> +	if ((primary_domain_index < 0) || !numa_enabled)

Under what circumstances could you get primary_domain_index < 0?

> +		return default_nid;
> +
> +	rc =3D of_get_assoc_arrays(&aa);
> +	if (rc)
> +		return default_nid;
> +
> +	if (primary_domain_index <=3D aa.array_sz &&
> +	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_array=
s) {
> +		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;

Does anywhere verify that primary_domain_index <=3D aa.array_sz?

> +		nid =3D of_read_number(&aa.arrays[index], 1);
> +
> +		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> +			nid =3D default_nid;
> +		if (nid > 0 && affinity_form =3D=3D FORM1_AFFINITY) {
> +			int i;
> +			const __be32 *associativity;
> +
> +			index =3D lmb->aa_index * aa.array_sz;
> +			associativity =3D &aa.arrays[index];
> +			/*
> +			 * lookup array associativity entries have different format
> +			 * There is no length of the array as the first element.

The difference it very small, and this is not a hot path.  Couldn't
you reduce a chunk of code by prepending aa.array_sz, then re-using
__initialize_form1_numa_distance.  Or even making
__initialize_form1_numa_distance() take the length as a parameter.

> +			 */
> +			for (i =3D 0; i < max_associativity_domain_index; i++) {
> +				const __be32 *entry;
> +
> +				entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];

Does anywhere verify that distance_ref_points[i] <=3D aa.array_size for
every i?

> +				distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> +			}
> +		}
> +	}
> +	return nid;
> +}
> +
>  /*
>   * This is like of_node_to_nid_single() for memory represented in the
>   * ibm,dynamic-reconfiguration-memory node.
> @@ -458,21 +518,14 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> =20
>  		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
>  			nid =3D default_nid;
> -
> -		if (nid > 0) {
> -			index =3D lmb->aa_index * aa.array_sz;
> -			initialize_distance_lookup_table(nid,
> -							&aa.arrays[index]);
> -		}
>  	}
> -
>  	return nid;
>  }
> =20
>  #ifdef CONFIG_PPC_SPLPAR
> -static int vphn_get_nid(long lcpu)
> +
> +static int __vphn_get_associativity(long lcpu, __be32 *associativity)
>  {
> -	__be32 associativity[VPHN_ASSOC_BUFSIZE] =3D {0};
>  	long rc, hwid;
> =20
>  	/*
> @@ -492,10 +545,22 @@ static int vphn_get_nid(long lcpu)
> =20
>  		rc =3D hcall_vphn(hwid, VPHN_FLAG_VCPU, associativity);
>  		if (rc =3D=3D H_SUCCESS)
> -			return associativity_to_nid(associativity);
> +			return 0;
>  	}
> =20
> +	return -1;
> +}
> +
> +static int vphn_get_nid(long lcpu)
> +{
> +	__be32 associativity[VPHN_ASSOC_BUFSIZE] =3D {0};
> +
> +
> +	if (!__vphn_get_associativity(lcpu, associativity))
> +		return associativity_to_nid(associativity);
> +
>  	return NUMA_NO_NODE;
> +
>  }
>  #else
>  static int vphn_get_nid(long unused)
> @@ -692,7 +757,7 @@ static int __init numa_setup_drmem_lmb(struct drmem_l=
mb *lmb,
>  			size =3D read_n_cells(n_mem_size_cells, usm);
>  		}
> =20
> -		nid =3D of_drconf_to_nid_single(lmb);
> +		nid =3D get_nid_and_numa_distance(lmb);
>  		fake_numa_create_new_node(((base + size) >> PAGE_SHIFT),
>  					  &nid);
>  		node_set_online(nid);
> @@ -709,6 +774,7 @@ static int __init parse_numa_properties(void)
>  	struct device_node *memory;
>  	int default_nid =3D 0;
>  	unsigned long i;
> +	const __be32 *associativity;
> =20
>  	if (numa_enabled =3D=3D 0) {
>  		printk(KERN_WARNING "NUMA disabled by user\n");
> @@ -734,18 +800,30 @@ static int __init parse_numa_properties(void)
>  	 * each node to be onlined must have NODE_DATA etc backing it.
>  	 */
>  	for_each_present_cpu(i) {
> +		__be32 vphn_assoc[VPHN_ASSOC_BUFSIZE];
>  		struct device_node *cpu;
> -		int nid =3D vphn_get_nid(i);
> +		int nid =3D NUMA_NO_NODE;
> =20
> -		/*
> -		 * Don't fall back to default_nid yet -- we will plug
> -		 * cpus into nodes once the memory scan has discovered
> -		 * the topology.
> -		 */
> -		if (nid =3D=3D NUMA_NO_NODE) {
> +		memset(vphn_assoc, 0, VPHN_ASSOC_BUFSIZE * sizeof(__be32));

What's the memset() for?  AFAICT you only look at vphn_assoc in the
branch where __vphn_get_associativity() succeeds.

> +
> +		if (__vphn_get_associativity(i, vphn_assoc) =3D=3D 0) {
> +			nid =3D associativity_to_nid(vphn_assoc);
> +			__initialize_form1_numa_distance(vphn_assoc);
> +		} else {
> +
> +			/*
> +			 * Don't fall back to default_nid yet -- we will plug
> +			 * cpus into nodes once the memory scan has discovered
> +			 * the topology.
> +			 */
>  			cpu =3D of_get_cpu_node(i, NULL);
>  			BUG_ON(!cpu);
> -			nid =3D of_node_to_nid_single(cpu);
> +
> +			associativity =3D of_get_associativity(cpu);
> +			if (associativity) {
> +				nid =3D associativity_to_nid(associativity);
> +				__initialize_form1_numa_distance(associativity);
> +			}
>  			of_node_put(cpu);
>  		}
> =20
> @@ -781,8 +859,11 @@ static int __init parse_numa_properties(void)
>  		 * have associativity properties.  If none, then
>  		 * everything goes to default_nid.
>  		 */
> -		nid =3D of_node_to_nid_single(memory);
> -		if (nid < 0)
> +		associativity =3D of_get_associativity(memory);
> +		if (associativity) {
> +			nid =3D associativity_to_nid(associativity);
> +			__initialize_form1_numa_distance(associativity);
> +		} else
>  			nid =3D default_nid;
> =20
>  		fake_numa_create_new_node(((start + size) >> PAGE_SHIFT), &nid);
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/=
platforms/pseries/hotplug-cpu.c
> index 7e970f81d8ff..778b6ab35f0d 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -498,6 +498,8 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
>  		return saved_rc;
>  	}
> =20
> +	update_numa_distance(dn);
> +
>  	rc =3D dlpar_online_cpu(dn);
>  	if (rc) {
>  		saved_rc =3D rc;
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index 36f66556a7c6..40d350f31a34 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -180,6 +180,8 @@ static int update_lmb_associativity_index(struct drme=
m_lmb *lmb)
>  		return -ENODEV;
>  	}
> =20
> +	update_numa_distance(lmb_node);
> +
>  	dr_node =3D of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
>  	if (!dr_node) {
>  		dlpar_free_cc_nodes(lmb_node);
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
> index 1f051a786fb3..663a0859cf13 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -113,4 +113,5 @@ extern u32 pseries_security_flavor;
>  void pseries_setup_security_mitigations(void);
>  void pseries_lpar_read_hblkrm_characteristics(void);
> =20
> +void update_numa_distance(struct device_node *node);
>  #endif /* _PSERIES_PSERIES_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9aKIG8agTwQmi6GV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD4zI8ACgkQbDjKyiDZ
s5IZVBAA1BR2+DZwYYQbs9vigONzpqNciIGP5KywjJl9z4GZ+/Pafq8ZyU3+UqwX
VN4rfo+LgMbppusLVa96KJGNCxa7UDKwru3yyeetdXxVngh9E5KOrtBOui5opJAe
8rzTWuu7ahZwZMBakaya+92g5GyVi2Ts962PDsh67Hs8jE30lEdf48O/Xfb+LMuF
+Wkhkoio/Q2/CffBw9Fduiz1+r6K9HWzaxIpMShjNs5OR2DtFtU4ExTPrdBivSPq
XfwFY+H+bcfOev0uE5eeYezRW/0RNpiJ1y4DsyybE/z/WjuS4OaSB2PJetBsx8pZ
OHgSDyKCsN1XjJ8lQ1KRS7RVBjWXKi42+4vNi58xw2f5YqWtyCIpyd81VfwswV6T
LQOSh8cUXRLtXxGHdSd7LpHElxRQYpnwgEOrWbMk6QS0XO3RKfOAi9svihQ6QuJT
YgHNgYsCUiYPDlhGVO0JlI9T1XsCytLSJ/eyrVOlOHnmMl9edY9vCMqfbUVUds7a
+YJzO+4+RtG9IYXMCpjxjeGIgiBAqLi499AAJsMn5c5eSjW+k58fcA1xCZ5Cbo2E
M6l2WyVx3IqN/fvAEOOILFiPpokW9dDdEHo6W2ZPtxZHmcNfLj+/SEy0e0TJVaQ0
ZS7VWVCQMjoxl9TFrJ0OlavFCg4NkLk1/QuSN/jX109NkNc9O04=
=cnBk
-----END PGP SIGNATURE-----

--9aKIG8agTwQmi6GV--
