Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB43D1BD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 04:39:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVc9R0N4sz3dXv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 12:39:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=MIxXr9R4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=MIxXr9R4; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVc6J5Gfgz2yMW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 12:36:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVc6D44G9z9sfR; Thu, 22 Jul 2021 12:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626921412;
 bh=hi0oH3rA2wR87CLpMBqj7JGT9rpcikcRTLVH4THVPRA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MIxXr9R48CqNO60oAGGqwic4ixbyamd6ZIem4nj9GvKgX4EQzrwP/YG6uzMGx0v5u
 2QdU/0uyeo/VVKV/36A9RJp/VSaz1BrAjfEy19KvHC1+uBM9KWXAB0fPjznRjrEFaM
 nKPbBKH2vuSp10BC1wZUciOG9YJ3xusEz3WqO9go=
Date: Thu, 22 Jul 2021 12:36:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 1/6] powerpc/pseries: rename min_common_depth to
 primary_domain_index
Message-ID: <YPjZvgRr2WSdcX/W@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-2-aneesh.kumar@linux.ibm.com>
 <YPjQ85wtr165BOMa@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pcNjlLCKSNvvqnvu"
Content-Disposition: inline
In-Reply-To: <YPjQ85wtr165BOMa@yekko>
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


--pcNjlLCKSNvvqnvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 11:59:15AM +1000, David Gibson wrote:
> On Mon, Jun 28, 2021 at 08:41:12PM +0530, Aneesh Kumar K.V wrote:
> > No functional change in this patch.
>=20
> The new name does not match how you describe "primary domain index" in
> the documentation from patch 6/6.  There it comes from the values in
> associativity-reference-points, but here it simply comes from the
> lengths of all the associativity properties.

No, sorry, I misread this code... misled by the old name, so it's a
good thing you're changing it.

But.. I'm still not sure the new name is accurate, either...

[snip]
> >  	if (form1_affinity) {
> > -		depth =3D of_read_number(distance_ref_points, 1);
> > +		index =3D of_read_number(distance_ref_points, 1);

AFACIT distance_ref_points hasn't been altered from the
of_get_property() at this point, so isn't this setting depth / index
to the number of entries in ref-points, rather than the value of the
first entry (which is what primary domain index is supposed to be).

> >  	} else {
> >  		if (distance_ref_points_depth < 2) {
> >  			printk(KERN_WARNING "NUMA: "
> > @@ -334,7 +334,7 @@ static int __init find_min_common_depth(void)
> >  			goto err;
> >  		}
> > =20
> > -		depth =3D of_read_number(&distance_ref_points[1], 1);
> > +		index =3D of_read_number(&distance_ref_points[1], 1);
> >  	}
> > =20
> >  	/*
> > @@ -348,7 +348,7 @@ static int __init find_min_common_depth(void)
> >  	}
> > =20
> >  	of_node_put(root);
> > -	return depth;
> > +	return index;
> > =20
> >  err:
> >  	of_node_put(root);
> > @@ -437,16 +437,16 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
> >  	int nid =3D default_nid;
> >  	int rc, index;
> > =20
> > -	if ((min_common_depth < 0) || !numa_enabled)
> > +	if ((primary_domain_index < 0) || !numa_enabled)
> >  		return default_nid;
> > =20
> >  	rc =3D of_get_assoc_arrays(&aa);
> >  	if (rc)
> >  		return default_nid;
> > =20
> > -	if (min_common_depth <=3D aa.array_sz &&
> > +	if (primary_domain_index <=3D aa.array_sz &&
> >  	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arr=
ays) {
> > -		index =3D lmb->aa_index * aa.array_sz + min_common_depth - 1;
> > +		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
> >  		nid =3D of_read_number(&aa.arrays[index], 1);
> > =20
> >  		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> > @@ -708,18 +708,18 @@ static int __init parse_numa_properties(void)
> >  		return -1;
> >  	}
> > =20
> > -	min_common_depth =3D find_min_common_depth();
> > +	primary_domain_index =3D find_primary_domain_index();
> > =20
> > -	if (min_common_depth < 0) {
> > +	if (primary_domain_index < 0) {
> >  		/*
> > -		 * if we fail to parse min_common_depth from device tree
> > +		 * if we fail to parse primary_domain_index from device tree
> >  		 * mark the numa disabled, boot with numa disabled.
> >  		 */
> >  		numa_enabled =3D false;
> > -		return min_common_depth;
> > +		return primary_domain_index;
> >  	}
> > =20
> > -	dbg("NUMA associativity depth for CPU/Memory: %d\n", min_common_depth=
);
> > +	dbg("NUMA associativity depth for CPU/Memory: %d\n", primary_domain_i=
ndex);
> > =20
> >  	/*
> >  	 * Even though we connect cpus to numa domains later in SMP
> > @@ -919,14 +919,14 @@ static void __init find_possible_nodes(void)
> >  			goto out;
> >  	}
> > =20
> > -	max_nodes =3D of_read_number(&domains[min_common_depth], 1);
> > +	max_nodes =3D of_read_number(&domains[primary_domain_index], 1);
> >  	for (i =3D 0; i < max_nodes; i++) {
> >  		if (!node_possible(i))
> >  			node_set(i, node_possible_map);
> >  	}
> > =20
> >  	prop_length /=3D sizeof(int);
> > -	if (prop_length > min_common_depth + 2)
> > +	if (prop_length > primary_domain_index + 2)
> >  		coregroup_enabled =3D 1;
> > =20
> >  out:
> > @@ -1259,7 +1259,7 @@ int cpu_to_coregroup_id(int cpu)
> >  		goto out;
> > =20
> >  	index =3D of_read_number(associativity, 1);
> > -	if (index > min_common_depth + 1)
> > +	if (index > primary_domain_index + 1)
> >  		return of_read_number(&associativity[index - 1], 1);
> > =20
> >  out:
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pcNjlLCKSNvvqnvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD42b4ACgkQbDjKyiDZ
s5JJ2Q/8DX8LwpTIwqWucUm2gOLZt3IfY0nsnSOTe0afCNt3nxtCweET8DVowcwM
UE4XaD0F0+UOU3o3tXZ2sA40OPAupBdRW8FZN0lDGh/Bjvd8YfByUdvl++Y6220k
Tupy0ZyGDdQs192efsNmiJBcZf4cjF7afwHWEVKQuAIHLRqQdo2CLhSVERTtszDJ
qXL2EM4pyhhCiHwhvhHV1smiNiQVd1cJg7696hs13YTZu180bfY4OxU57UM4hkH9
39/q95KUiCdYakmhBlBJm0Kad768WYUMM+4eWnVH1pynlQDoxgq/sLO1w4/0F6MM
1ombT7nvkI8NuxcxTQuG4YOiKkHCGXcsfya8ICYDOr3C9KkcYnhEunJzuC/NHhvP
11riirTXrjgSS0iFcWHKLFnPqf432by4HVZ9WDX/njMxTVEIhJpbQTT6aqg17TbI
ZrumxchUVuNPAvIokFe7KI1/gRoN3XIjPKi15MWpG5LUqTbiqbtEJsHGw0LxyMx+
KWjwlK6oT2TGkew+iL5H94ucErju6V0rP6fpudZQUGDzc/BHQ5wUVPlyyQhsPmDb
lYcYakJNroQPwSq8IUq3R54CLEAWFD7PEOmdyTWMA3ILI6ODrl0AcjaKOH8oPkUr
Pa0hMzDL0zA6PjPnIAMSRl+sT6c6TAvE73QvVivHMnmav8JwcO4=
=Y1Bi
-----END PGP SIGNATURE-----

--pcNjlLCKSNvvqnvu--
