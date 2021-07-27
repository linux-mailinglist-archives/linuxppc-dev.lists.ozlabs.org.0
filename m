Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95113D6E8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 07:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYmMx5fFRz300J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 15:59:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=mqE/Wtkh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=mqE/Wtkh; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYmMW4r9Fz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 15:59:18 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GYmMT600rz9sX5; Tue, 27 Jul 2021 15:59:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627365557;
 bh=sZK49bZ+9mkKeVN3juIZOhNs+UehZFx67H+WeTfOQD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mqE/WtkhduKAcyT+Itlb0k3vNqrfIYv2vO2j2bx78NfHP5iTB0V9dvVQ3Er+tBoBF
 GgqED4Fb0j0umHU1wx0c6m1nBF89xgEEPHRru009joMqOFrGWrAuk6Qov+FK8j8Sl1
 soHc9MQawFULCZlf80m7ZpQVd3h3/u5+ug2BNzDo=
Date: Tue, 27 Jul 2021 15:59:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 4/6] powerpc/pseries: Consolidate different NUMA
 distance update code paths
Message-ID: <YP+gsFZIsFtRptID@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-5-aneesh.kumar@linux.ibm.com>
 <YPjMkQ5W1fSQdzNe@yekko> <87zgueu8ql.fsf@linux.ibm.com>
 <YP4f7lj9p4f/h77f@yekko> <87r1fktory.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wy9UC89B51bginW/"
Content-Disposition: inline
In-Reply-To: <87r1fktory.fsf@linux.ibm.com>
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


--Wy9UC89B51bginW/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 09:02:33AM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Jul 22, 2021 at 12:37:46PM +0530, Aneesh Kumar K.V wrote:
> >> David Gibson <david@gibson.dropbear.id.au> writes:
> >>=20
> >> > On Mon, Jun 28, 2021 at 08:41:15PM +0530, Aneesh Kumar K.V wrote:
>=20
> ....
>=20
> >=20
> >> >
> >> >> +		nid =3D of_read_number(&aa.arrays[index], 1);
> >> >> +
> >> >> +		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> >> >> +			nid =3D default_nid;
> >> >> +		if (nid > 0 && affinity_form =3D=3D FORM1_AFFINITY) {
> >> >> +			int i;
> >> >> +			const __be32 *associativity;
> >> >> +
> >> >> +			index =3D lmb->aa_index * aa.array_sz;
> >> >> +			associativity =3D &aa.arrays[index];
> >> >> +			/*
> >> >> +			 * lookup array associativity entries have different format
> >> >> +			 * There is no length of the array as the first element.
> >> >
> >> > The difference it very small, and this is not a hot path.  Couldn't
> >> > you reduce a chunk of code by prepending aa.array_sz, then re-using
> >> > __initialize_form1_numa_distance.  Or even making
> >> > __initialize_form1_numa_distance() take the length as a parameter.
> >>=20
> >> The changes are small but confusing w.r.t how we look at the
> >> associativity-lookup-arrays. The way we interpret associativity array
> >> and associativity lookup array using primary_domain_index is different.
> >> Hence the '-1' in the node lookup here.
> >
> > They're really not, though.  It's exactly the same interpretation of
> > the associativity array itself - it's just that one of them has the
> > array prepended with a (redundant) length.  So you can make
> > __initialize_form1_numa_distance() work on the "bare" associativity
> > array, with a given length.  Here you call it with aa.array_sz as the
> > length, and in the other place you call it with prop[0] as the length.
> >
> >>=20
> >> 	index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
> >> 	nid =3D of_read_number(&aa.arrays[index], 1);
> >>=20
> >>=20
> >> >
> >> >> +			 */
> >> >> +			for (i =3D 0; i < max_associativity_domain_index; i++) {
> >> >> +				const __be32 *entry;
> >> >> +
> >> >> +				entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) -=
 1];
> >> >
> >> > Does anywhere verify that distance_ref_points[i] <=3D aa.array_size =
for
> >> > every i?
> >>=20
> >> We do check for=20
> >>=20
> >> 	if (primary_domain_index <=3D aa.array_sz &&
> >
> > Right, but that doesn't check the other distance_ref_points entries.
> > Not that there's any reason to have extra entries with Form2, but we
> > still don't want stray array accesses.
>=20
> This is how the change looks. I am not convinced this makes it simpler.

It's not, but that's because the lookup_array_assoc flag is not needed...

> I will add that as the last patch and we can drop that if we find that
> not helpful?=20
>=20
> modified   arch/powerpc/mm/numa.c
> @@ -171,20 +171,31 @@ static void unmap_cpu_from_node(unsigned long cpu)
>  }
>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> =20
> -/*
> - * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> - * info is found.
> - */
> -static int associativity_to_nid(const __be32 *associativity)
> +static int __associativity_to_nid(const __be32 *associativity,
> +				  bool lookup_array_assoc,
> +				  int max_array_index)
>  {
>  	int nid =3D NUMA_NO_NODE;
> +	int index;
> =20
>  	if (!numa_enabled)
>  		goto out;
> +	/*
> +	 * ibm,associativity-lookup-array doesn't have element
> +	 * count at the start of the associativity. Hence
> +	 * decrement the primary_domain_index when used with
> +	 * lookup-array associativity.
> +	 */
> +	if (lookup_array_assoc)
> +		index =3D primary_domain_index - 1;
> +	else {
> +		index =3D primary_domain_index;
> +		max_array_index =3D of_read_number(associativity, 1);
> +	}
> +	if (index > max_array_index)
> +		goto out;

So, the associativity-array-with-length is exactly a length, followed
by an associativity-array-without-length.  What I was suggesting is
you make this function only take an
associativity-array-without-length, with the length passed separately.

Where you want to use it on an associativity-array-with-length, stored
in __be32 *awl, you just invoke it as:
	associativity_to_nid(awl + 1, of_read_number(awl, 1));

> -	if (of_read_number(associativity, 1) >=3D primary_domain_index)
> -		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> -
> +	nid =3D of_read_number(&associativity[index], 1);
>  	/* POWER4 LPAR uses 0xffff as invalid node */
>  	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
>  		nid =3D NUMA_NO_NODE;
> @@ -192,6 +203,15 @@ static int associativity_to_nid(const __be32 *associ=
ativity)
>  	return nid;
>  }
> =20
> +/*
> + * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> + * info is found.
> + */
> +static inline int associativity_to_nid(const __be32 *associativity)
> +{
> +	return __associativity_to_nid(associativity, false, 0);
> +}
> +
>  static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32 *cpu=
2_assoc)
>  {
>  	int dist;
> @@ -295,19 +315,38 @@ int of_node_to_nid(struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_node_to_nid);
> =20
> -static void __initialize_form1_numa_distance(const __be32 *associativity)
> +static void __initialize_form1_numa_distance(const __be32 *associativity,
> +					     bool lookup_array_assoc,
> +					     int max_array_index)
>  {
>  	int i, nid;
> +	int index_offset =3D 0;
> =20
>  	if (affinity_form !=3D FORM1_AFFINITY)
>  		return;
> +	/*
> +	 * ibm,associativity-lookup-array doesn't have element
> +	 * count at the start of the associativity. Hence
> +	 * decrement the distance_ref_points index when used with
> +	 * lookup-array associativity.
> +	 */
> +	if (lookup_array_assoc)
> +		index_offset =3D 1;
> +	else
> +		max_array_index =3D of_read_number(associativity, 1);
> =20
> -	nid =3D associativity_to_nid(associativity);
> +	nid =3D __associativity_to_nid(associativity, lookup_array_assoc, max_a=
rray_index);
>  	if (nid !=3D NUMA_NO_NODE) {
>  		for (i =3D 0; i < distance_ref_points_depth; i++) {
>  			const __be32 *entry;
> +			int index =3D be32_to_cpu(distance_ref_points[i]) - index_offset;
> =20
> -			entry =3D &associativity[be32_to_cpu(distance_ref_points[i])];
> +			/*
> +			 * broken hierarchy, return with broken distance table
> +			 */
> +			if (index > max_array_index)
> +				return;
> +			entry =3D &associativity[index];
>  			distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
>  		}
>  	}
> @@ -321,7 +360,7 @@ static void initialize_form1_numa_distance(struct dev=
ice_node *node)
>  	if (!associativity)
>  		return;
> =20
> -	__initialize_form1_numa_distance(associativity);
> +	__initialize_form1_numa_distance(associativity, false, 0);
>  }
> =20
>  /*
> @@ -586,27 +625,14 @@ static int get_nid_and_numa_distance(struct drmem_l=
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
> +		nid =3D __associativity_to_nid(associativity, true, aa.array_sz - 1);
>  		if (nid > 0 && affinity_form =3D=3D FORM1_AFFINITY) {
> -			int i;
> -			const __be32 *associativity;
> -
> -			index =3D lmb->aa_index * aa.array_sz;
> -			associativity =3D &aa.arrays[index];
> -			/*
> -			 * lookup array associativity entries have different format
> -			 * There is no length of the array as the first element.
> -			 */
> -			for (i =3D 0; i < distance_ref_points_depth; i++) {
> -				const __be32 *entry;
> -
> -				entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
> -				distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> -			}
> +			__initialize_form1_numa_distance(associativity,
> +							 true, aa.array_sz - 1);
>  		}
>  	}
>  	return nid;
> @@ -632,9 +658,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> =20
>  	if (primary_domain_index <=3D aa.array_sz &&
>  	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_array=
s) {
> -		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
> -		nid =3D of_read_number(&aa.arrays[index], 1);
> +		const __be32 *associativity;
> =20
> +		index =3D lmb->aa_index * aa.array_sz;
> +		associativity =3D &aa.arrays[index];
> +		nid =3D __associativity_to_nid(associativity, true, aa.array_sz - 1);
>  		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
>  			nid =3D default_nid;
>  	}
> @@ -939,7 +967,7 @@ static int __init parse_numa_properties(void)
> =20
>  		if (__vphn_get_associativity(i, vphn_assoc) =3D=3D 0) {
>  			nid =3D associativity_to_nid(vphn_assoc);
> -			__initialize_form1_numa_distance(vphn_assoc);
> +			__initialize_form1_numa_distance(vphn_assoc, false, 0);
>  		} else {
> =20
>  			/*
> @@ -953,7 +981,7 @@ static int __init parse_numa_properties(void)
>  			associativity =3D of_get_associativity(cpu);
>  			if (associativity) {
>  				nid =3D associativity_to_nid(associativity);
> -				__initialize_form1_numa_distance(associativity);
> +				__initialize_form1_numa_distance(associativity, false, 0);
>  			}
>  			of_node_put(cpu);
>  		}
> @@ -993,7 +1021,7 @@ static int __init parse_numa_properties(void)
>  		associativity =3D of_get_associativity(memory);
>  		if (associativity) {
>  			nid =3D associativity_to_nid(associativity);
> -			__initialize_form1_numa_distance(associativity);
> +			__initialize_form1_numa_distance(associativity, false, 0);
>  		} else
>  			nid =3D default_nid;
> =20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Wy9UC89B51bginW/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD/oK4ACgkQbDjKyiDZ
s5LRYw//SHzg0RUqHcgJhJbZAjhsRQSivRNdgEXuB2L5xI0sskv3RflXIfSxb47E
JpSMtalGMLrUmKFK1ZHtNkLNk2aDy1/4xe6WbCeXks3zXCSYG33mCdagRAxs5wFO
mPLClbVaJxJH93HoT9lmSy7RVluJ22nP5yGw6mwHj+HR35psjBaf2+qCoCsEovvB
iubq5Z7qMx1nmUE01q+eG3uHTQDK7VzcTs54R2ht70jPPldS/XbLzA7IWs9j+v+u
cgQl27r1qf3VDdPwdM2Oq3XwOjrFIppKGhs8621BqFU7sPra8Cbls+X2yTYzAMGs
BSgDHsHV5eNZ71VremJy4PE6m+v2FOr24vBYMMmoXrgsO49goCeO/RSzuA5hP8cW
5LHmUdMUseRtbJHdTtXWUUKMAmhXf3Zo4Qy1DubYm0HuxtBPCyx46WPIS3jtHSmw
pClofbeSiF959k87AamxVjuADle6qDdnGV/VaxDBSnwB2Wa4CDFKEbG2Wqb4dV/l
OZVrM8miRTLdo+iUFiIB2HdVdwqdZmujnyax9DRVapNLNaOPj7QwNTdGhJ4Vr1Zi
kQAJYInIndlyy+zLoJfg/mOI5DNgH+AbK40CzcjdFtHbQoPrtFU8V5MEz3mf0Yx3
uH21lKVAHCeFy5U0jBFs49o8p9uXJEp2fS00uqRamjV0ndFr83Y=
=yryv
-----END PGP SIGNATURE-----

--Wy9UC89B51bginW/--
