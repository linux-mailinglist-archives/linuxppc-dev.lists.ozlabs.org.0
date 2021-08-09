Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACBB3E3E43
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 05:27:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GjhNd6hYVz3bYV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 13:27:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=nDgmCI6q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=nDgmCI6q; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GjhN82fjMz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 13:27:19 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GjhN51KYxz9sWl; Mon,  9 Aug 2021 13:27:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628479637;
 bh=456y4KvnKaHy9PkGWvL8sCUF99c8t5cS62jonFAxXjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nDgmCI6qP1Smvm/FRg9Icf3YTtcRB9xHx+mwcExnyc6DF2GrTOwgPtlGHmtU619aC
 woTknBrdTdEjYrdEJrqG9sY58m/zi4u15AjypZTy30ETp1CMfKfhsrpHA6Aob0PCQP
 pazFya6RpI+DdSUVN2oF6MVkJ8ZieElrqYiBiK4w=
Date: Mon, 9 Aug 2021 13:27:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 6/6] powerpc/pseries: Consolidate form1 distance
 initialization into a helper
Message-ID: <YRCgjORVYipKWYYx@yekko>
References: <20210727100311.310969-1-aneesh.kumar@linux.ibm.com>
 <20210727100311.310969-7-aneesh.kumar@linux.ibm.com>
 <YQzbCxwfEdE3CQZw@yekko>
 <5caa933f-bf2e-6df6-40a9-9dd161711224@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oe7m5jZEvi20qfag"
Content-Disposition: inline
In-Reply-To: <5caa933f-bf2e-6df6-40a9-9dd161711224@linux.ibm.com>
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


--oe7m5jZEvi20qfag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 09:53:59PM +0530, Aneesh Kumar K.V wrote:
> On 8/6/21 12:17 PM, David Gibson wrote:
> > On Tue, Jul 27, 2021 at 03:33:11PM +0530, Aneesh Kumar K.V wrote:
> > > Currently, we duplicate parsing code for ibm,associativity and
> > > ibm,associativity-lookup-arrays in the kernel. The associativity arra=
y provided
> > > by these device tree properties are very similar and hence can use
> > > a helper to parse the node id and numa distance details.
> >=20
> > Oh... sorry.. comments on the earlier patch were from before I read
> > and saw you adjusted things here.
> >=20
> > >=20
> > > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > > ---
> > >   arch/powerpc/mm/numa.c | 83 ++++++++++++++++++++++++++-------------=
---
> > >   1 file changed, 51 insertions(+), 32 deletions(-)
> > >=20
> > > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > > index fffb3c40f595..7506251e17f2 100644
> > > --- a/arch/powerpc/mm/numa.c
> > > +++ b/arch/powerpc/mm/numa.c
> > > @@ -171,19 +171,19 @@ static void unmap_cpu_from_node(unsigned long c=
pu)
> > >   }
> > >   #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> > > -/*
> > > - * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> > > - * info is found.
> > > - */
> > > -static int associativity_to_nid(const __be32 *associativity)
> > > +static int __associativity_to_nid(const __be32 *associativity,
> > > +				  int max_array_sz)
> > >   {
> > >   	int nid =3D NUMA_NO_NODE;
> > > +	/*
> > > +	 * primary_domain_index is 1 based array index.
> > > +	 */
> > > +	int index =3D primary_domain_index  - 1;
> > > -	if (!numa_enabled)
> > > +	if (!numa_enabled || index >=3D max_array_sz)
> > >   		goto out;
> >=20
> > You don't need a goto, you can just return NUMA_NO_NODE.
>=20
> updated
>=20
> >=20
> > > -	if (of_read_number(associativity, 1) >=3D primary_domain_index)
> > > -		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> > > +	nid =3D of_read_number(&associativity[index], 1);
> > >   	/* POWER4 LPAR uses 0xffff as invalid node */
> > >   	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> > > @@ -191,6 +191,17 @@ static int associativity_to_nid(const __be32 *as=
sociativity)
> > >   out:
> > >   	return nid;
> > >   }
> > > +/*
> > > + * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> > > + * info is found.
> > > + */
> > > +static int associativity_to_nid(const __be32 *associativity)
> > > +{
> > > +	int array_sz =3D of_read_number(associativity, 1);
> > > +
> > > +	/* Skip the first element in the associativity array */
> > > +	return __associativity_to_nid((associativity + 1), array_sz);
> > > +}
> > >   static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32=
 *cpu2_assoc)
> > >   {
> > > @@ -295,24 +306,41 @@ int of_node_to_nid(struct device_node *device)
> > >   }
> > >   EXPORT_SYMBOL(of_node_to_nid);
> > > -static void __initialize_form1_numa_distance(const __be32 *associati=
vity)
> > > +static void ___initialize_form1_numa_distance(const __be32 *associat=
ivity,
> > > +					     int max_array_sz)
> > >   {
> > >   	int i, nid;
> > >   	if (affinity_form !=3D FORM1_AFFINITY)
> > >   		return;
> > > -	nid =3D associativity_to_nid(associativity);
> > > +	nid =3D __associativity_to_nid(associativity, max_array_sz);
> > >   	if (nid !=3D NUMA_NO_NODE) {
> > >   		for (i =3D 0; i < distance_ref_points_depth; i++) {
> > >   			const __be32 *entry;
> > > +			int index =3D be32_to_cpu(distance_ref_points[i]) - 1;
> > > +
> > > +			/*
> > > +			 * broken hierarchy, return with broken distance table
> >=20
> > WARN_ON, maybe?
>=20
>=20
> updated
>=20
> >=20
> > > +			 */
> > > +			if (index >=3D max_array_sz)
> > > +				return;
> > > -			entry =3D &associativity[be32_to_cpu(distance_ref_points[i])];
> > > +			entry =3D &associativity[index];
> > >   			distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> > >   		}
> > >   	}
> > >   }
> > > +static void __initialize_form1_numa_distance(const __be32 *associati=
vity)
> >=20
> > Do you actually use this in-between wrapper?
>=20
> yes used in
>=20
> static void initialize_form1_numa_distance(struct device_node *node)
> {
> 	const __be32 *associativity;
>=20
> 	associativity =3D of_get_associativity(node);
> 	if (!associativity)
> 		return;
>=20
> 	__initialize_form1_numa_distance(associativity);

Right, but I mean in more than one place.  If this is the only user,
you might as well expand it inline here.

> }
>=20
>=20
>=20
> >=20
> > > +{
> > > +	int array_sz;
> > > +
> > > +	array_sz =3D of_read_number(associativity, 1);
> > > +	/* Skip the first element in the associativity array */
> > > +	___initialize_form1_numa_distance(associativity + 1, array_sz);
> > > +}
> > > +
> > >   static void initialize_form1_numa_distance(struct device_node *node)
> > >   {
> > >   	const __be32 *associativity;
> > > @@ -586,27 +614,18 @@ static int get_nid_and_numa_distance(struct drm=
em_lmb *lmb)
> > >   	if (primary_domain_index <=3D aa.array_sz &&
> > >   	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_=
arrays) {
> > > -		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
> > > -		nid =3D of_read_number(&aa.arrays[index], 1);
> > > +		const __be32 *associativity;
> > > -		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> > > -			nid =3D default_nid;
> > > +		index =3D lmb->aa_index * aa.array_sz;
> > > +		associativity =3D &aa.arrays[index];
> > > +		nid =3D __associativity_to_nid(associativity, aa.array_sz);
> > >   		if (nid > 0 && affinity_form =3D=3D FORM1_AFFINITY) {
> > > -			int i;
> > > -			const __be32 *associativity;
> > > -
> > > -			index =3D lmb->aa_index * aa.array_sz;
> > > -			associativity =3D &aa.arrays[index];
> > >   			/*
> > > -			 * lookup array associativity entries have different format
> > > -			 * There is no length of the array as the first element.
> > > +			 * lookup array associativity entries have
> > > +			 * no length of the array as the first element.
> > >   			 */
> > > -			for (i =3D 0; i < distance_ref_points_depth; i++) {
> > > -				const __be32 *entry;
> > > -
> > > -				entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1=
];
> > > -				distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> > > -			}
> > > +			___initialize_form1_numa_distance(associativity,
> > > +							  aa.array_sz);
> >=20
> > Better, thanks.
> >=20
> > >   		}
> > >   	}
> > >   	return nid;
> > > @@ -632,11 +651,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *l=
mb)
> > >   	if (primary_domain_index <=3D aa.array_sz &&
> > >   	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_=
arrays) {
> > > -		index =3D lmb->aa_index * aa.array_sz + primary_domain_index - 1;
> > > -		nid =3D of_read_number(&aa.arrays[index], 1);
> > > +		const __be32 *associativity;
> > > -		if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> > > -			nid =3D default_nid;
> > > +		index =3D lmb->aa_index * aa.array_sz;
> > > +		associativity =3D &aa.arrays[index];
> > > +		nid =3D __associativity_to_nid(associativity, aa.array_sz);
> > >   	}
> > >   	return nid;
> > >   }
> >=20
>=20
>=20
> -aneesh
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oe7m5jZEvi20qfag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEQoIoACgkQbDjKyiDZ
s5Jm/BAAgEK6unJDlGLq2xg72q1MDlDAeF7fw739rlcnK/IFURAqyTDB72uueEZu
02LVi0SUmlOrBPrupK4pIo/tGbXQagKlzd3F6BiH8JUJ9EG0pczy8rXRNByLTW8L
Pj16vwRD6VPEcROtMgsPf66B2/1CsNCapM1sN/O828MRestl+PA0gNZU9AFpNcdb
xyYno65mTCSTGkQLAdN1PoKLXzuMr6B9ipXUug2FaGsi6m7TfbB0QYJ41DaG7um7
JlueZAlnX0qdzkc666Tqw8vnSDDyK8nsB0GkY+BL+pNs3GLtBJyhN9yqTlFmaRCm
z9gvs9DvU3JgvEplzVp2JnX28dOAbmZDG0u++k3YKB/3sobxGHDQ0dI2+RuNKjXQ
Z3t0AEhoCqjdMXyn0sXVNggVx0hFSfR+kv+TbyUTyhZgPweFsCVvE1vQNwLOH7Uk
d+c9sc7VNsFuK1eFSOoLrHnd9sUVueFOOKhqP8YMoQbRhlv7kAfZbx6ueIG68V9k
Ac1gcNCGOkOt004nybPUs/GThVuZZaBxaL+9Zte0inmZ3D5+TBvVlNhTWvlFtoby
fiWQ2SCPs4NrLTn9/IWTAFqdwroCfrUrob94Hq6NGl131WfuX8sPlyX/qv6G2Sii
HVwroaNio+p/NuTz3er+ZUJF81o/0jfdmM6tWku0ia8YIxnHTuQ=
=5/gY
-----END PGP SIGNATURE-----

--oe7m5jZEvi20qfag--
