Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4263E51EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 06:20:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkKVd5DMrz3cd0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 14:20:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=IzxuryAq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=IzxuryAq; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkKSb0Xhkz304R
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 14:18:22 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSQ5SnVz9sXV; Tue, 10 Aug 2021 14:18:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569094;
 bh=R4Rfarwm4oFgdSr2eCPJ0F7hx4Ks/MCjeaoosS8XcdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IzxuryAqImHf1+EHZwApe01gvUf9a1tR+AW/GezvqyOZeREstFEVb9/BoJWNv6zwe
 3aLftldCN4U0b5g0ym0dBYtXRyG8VUw+Uk+xavxqz433jYTN/0o9DxBwPa6U5tsfSx
 SXJ01HmF6RojeCO98v8u0bshbUu+hEE9msUAz/qQ=
Date: Tue, 10 Aug 2021 12:40:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 3/6] powerpc/pseries: Consolidate different NUMA
 distance update code paths
Message-ID: <YRHnJ30QLP60D52m@yekko>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
 <20210809052434.53978-4-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8zM9R+1OE51NsaZW"
Content-Disposition: inline
In-Reply-To: <20210809052434.53978-4-aneesh.kumar@linux.ibm.com>
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


--8zM9R+1OE51NsaZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:54:31AM +0530, Aneesh Kumar K.V wrote:
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

It would make review easier if you'd folded the fixes/cleanups from
6/6 in here, rather than having them separate.

> ---
>  arch/powerpc/include/asm/topology.h           |   2 +
>  arch/powerpc/mm/numa.c                        | 178 +++++++++++++-----
>  arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
>  .../platforms/pseries/hotplug-memory.c        |   2 +
>  4 files changed, 138 insertions(+), 46 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/a=
sm/topology.h
> index e4db64c0e184..a6425a70c37b 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -64,6 +64,7 @@ static inline int early_cpu_to_node(int cpu)
>  }
> =20
>  int of_drconf_to_nid_single(struct drmem_lmb *lmb);
> +void update_numa_distance(struct device_node *node);
> =20
>  #else
> =20
> @@ -93,6 +94,7 @@ static inline int of_drconf_to_nid_single(struct drmem_=
lmb *lmb)
>  	return first_online_node;
>  }
> =20
> +static inline void update_numa_distance(struct device_node *node) {}
>  #endif /* CONFIG_NUMA */
> =20
>  #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 368719b14dcc..c695faf67d68 100644
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
> -	for (i =3D 0; i < distance_ref_points_depth; i++) {
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
> -		of_read_number(associativity, 1) >=3D distance_ref_points_depth) {
> -		/*
> -		 * Skip the length field and send start of associativity array

So.. this highlights a point.  In your comments you're treating
"associativity array" as meaning the value including the length plus
the assoc IDs, but this comment you've removed is treating it as just
the assoc IDs.  Personally I think things become clearer to talk about
if you treat the canonical form of "associativity array" as just the
assoc IDs (with implicit length), then treat the ibm,associativity
properties as containing (length + associativity array).

> -		 */
> -		initialize_distance_lookup_table(nid, associativity + 1);
> -	}
> -
>  out:
>  	return nid;
>  }
> @@ -287,6 +262,48 @@ int of_node_to_nid(struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_node_to_nid);
> =20
> +static void __initialize_form1_numa_distance(const __be32 *associativity)
> +{
> +	int i, nid;
> +
> +	if (affinity_form !=3D FORM1_AFFINITY)
> +		return;
> +
> +	nid =3D associativity_to_nid(associativity);
> +	if (nid !=3D NUMA_NO_NODE) {
> +		for (i =3D 0; i < distance_ref_points_depth; i++) {
> +			const __be32 *entry;
> +
> +			entry =3D &associativity[be32_to_cpu(distance_ref_points[i])];

So, here you've now removed all checks that distance_ref_points[i]
doesn't overflow the length of associativity.  It comes back in 6/6,
but it's still not ideal.

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
> @@ -433,6 +450,48 @@ static int of_get_assoc_arrays(struct assoc_arrays *=
aa)
>  	return 0;
>  }
> =20
> +static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
> +{
> +	struct assoc_arrays aa =3D { .arrays =3D NULL };
> +	int default_nid =3D NUMA_NO_NODE;

There's still no point I can see to this intermediate variable.

> +	int nid =3D default_nid;
> +	int rc, index;
> +
> +	if ((primary_domain_index < 0) || !numa_enabled)
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
> +			 */
> +			for (i =3D 0; i < distance_ref_points_depth; i++) {
> +				const __be32 *entry;
> +
> +				entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
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
> @@ -458,21 +517,14 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
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
> @@ -492,12 +544,30 @@ static int vphn_get_nid(long lcpu)
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
> +
> +static int __vphn_get_associativity(long lcpu, __be32 *associativity)
> +{
> +	return -1;
> +}
> +
>  static int vphn_get_nid(long unused)
>  {
>  	return NUMA_NO_NODE;
> @@ -692,7 +762,7 @@ static int __init numa_setup_drmem_lmb(struct drmem_l=
mb *lmb,
>  			size =3D read_n_cells(n_mem_size_cells, usm);
>  		}
> =20
> -		nid =3D of_drconf_to_nid_single(lmb);
> +		nid =3D get_nid_and_numa_distance(lmb);
>  		fake_numa_create_new_node(((base + size) >> PAGE_SHIFT),
>  					  &nid);
>  		node_set_online(nid);
> @@ -709,6 +779,7 @@ static int __init parse_numa_properties(void)
>  	struct device_node *memory;
>  	int default_nid =3D 0;
>  	unsigned long i;
> +	const __be32 *associativity;
> =20
>  	if (numa_enabled =3D=3D 0) {
>  		printk(KERN_WARNING "NUMA disabled by user\n");
> @@ -734,18 +805,30 @@ static int __init parse_numa_properties(void)
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
> @@ -781,8 +864,11 @@ static int __init parse_numa_properties(void)
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
> index 377d852f5a9a..ee1d81d7e54a 100644
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8zM9R+1OE51NsaZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER5yUACgkQbDjKyiDZ
s5KCxRAAsnxwCv181UqbKLTBYTvTZUly+rpc4dZWfuDIAlmX/QbhgLkKfQedX4ok
P3oSIImviO3Gc1alQHkeFB8J5yMrWDnSVuYBqb2I/9T/X30FHVB9S/6+PZZynraU
820di/c6RelhSkl2kdfhRLzQ5hAo3w70pd/mwZWac3+6AEARsiiWPOKYrm9am21y
Oclor10Ar2eE0TUX0f8ByoMOQkeVffYPaeJZAgbzT0ETnaFVA62yTcTJqAkQC5Qg
vo2/pnZkH9JNQrFtP0XMTjGIeKPeYRjIMfbLyjwZDOgljXyR92p/XI19OhajZCFY
25wahYPfB1ECNVG7H65KK0JMlzaNxeycCydW4puEOKzn/K5hWThl6gFnM2c+e49D
1pyTLttaXjwjhtORjB0D5+3q3222GTvZp/6yyxRk4se/yut/QoZSMCH08tl0eClk
tETSs/OBbX7WIZc/ED4M7ui6yy74bzBuS+LwNH/Q3lwh1dpVTZK7rwGSN76p02Mz
0WM8F8a0aT2kSbDhyjIlmEnTcKbeD9Ot1jx/rNLNXGha5vi+ps2RyeXOVvNW9miI
eONRXH9XhnAnenCye5gSfos59Wy/h9T8XRKsPMlULJSntbv7EAr+GkJQmAJdyqMS
CUt+UQX4Pk4CnF2Z12yzJE/cEuM+thh8UWMbZJRjqnHCQIsufuY=
=xNOq
-----END PGP SIGNATURE-----

--8zM9R+1OE51NsaZW--
