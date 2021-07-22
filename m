Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF003D1BCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 04:37:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVc6q3Ms4z3bh8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 12:37:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=atDFfZCt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=atDFfZCt; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVc6H0jc9z2yMT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 12:36:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVc6D22Yxz9sW8; Thu, 22 Jul 2021 12:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626921412;
 bh=IC6unVPlDlq4qdZDTLb8/WWpYJfxGOj4R36Fqfv7fLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=atDFfZCtqcpfY0MU980C9RszpYwLvrYPXfb1ILIGO8TWzVCNzkn2HcAweDeFABUK1
 +iUJ6KXIuFEuIGkLAp/Bak5SQy3b/ClDhrindQwXgKWgnFiC/37ZwR4gmysFjY4lgf
 heQ7lN9m0BR/U2JInG7FZ/obZYXuHPLubbNsdtP0=
Date: Thu, 22 Jul 2021 11:19:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 2/6] powerpc/pseries: rename distance_ref_points_depth
 to max_associativity_domain_index
Message-ID: <YPjHkKkrTOT31qsE@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-3-aneesh.kumar@linux.ibm.com>
 <YPjC3W9BFbD+wMZz@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zcr5U4CsBcAaWkoA"
Content-Disposition: inline
In-Reply-To: <YPjC3W9BFbD+wMZz@yekko>
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


--Zcr5U4CsBcAaWkoA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 10:59:09AM +1000, David Gibson wrote:
> On Mon, Jun 28, 2021 at 08:41:13PM +0530, Aneesh Kumar K.V wrote:
> > No functional change in this patch
> >=20
> > Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

No... wait, I take that back.  This change makes the code *more*
confusing.

"distance_ref_points_depth" is accurate - it's the length of the
distance_ref_points array.

"max_associativity_domain_index" is not.  That implies it's the
maximum value that a domain index can have - which it isn't.  You
could have 15 entries in every associativity array, but if only 2 of
them are referenced in distance_ref_points, then
"max_associativity_domain_index" would only be 2.

>=20
> > ---
> >  arch/powerpc/mm/numa.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index 8365b298ec48..132813dd1a6c 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -56,7 +56,7 @@ static int n_mem_addr_cells, n_mem_size_cells;
> >  static int form1_affinity;
> > =20
> >  #define MAX_DISTANCE_REF_POINTS 4
> > -static int distance_ref_points_depth;
> > +static int max_associativity_domain_index;
> >  static const __be32 *distance_ref_points;
> >  static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS=
];
> > =20
> > @@ -169,7 +169,7 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_a=
ssoc)
> > =20
> >  	int i, index;
> > =20
> > -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> > +	for (i =3D 0; i < max_associativity_domain_index; i++) {
> >  		index =3D be32_to_cpu(distance_ref_points[i]);
> >  		if (cpu1_assoc[index] =3D=3D cpu2_assoc[index])
> >  			break;
> > @@ -193,7 +193,7 @@ int __node_distance(int a, int b)
> >  	if (!form1_affinity)
> >  		return ((a =3D=3D b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
> > =20
> > -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> > +	for (i =3D 0; i < max_associativity_domain_index; i++) {
> >  		if (distance_lookup_table[a][i] =3D=3D distance_lookup_table[b][i])
> >  			break;
> > =20
> > @@ -213,7 +213,7 @@ static void initialize_distance_lookup_table(int ni=
d,
> >  	if (!form1_affinity)
> >  		return;
> > =20
> > -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> > +	for (i =3D 0; i < max_associativity_domain_index; i++) {
> >  		const __be32 *entry;
> > =20
> >  		entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
> > @@ -240,7 +240,7 @@ static int associativity_to_nid(const __be32 *assoc=
iativity)
> >  		nid =3D NUMA_NO_NODE;
> > =20
> >  	if (nid > 0 &&
> > -		of_read_number(associativity, 1) >=3D distance_ref_points_depth) {
> > +		of_read_number(associativity, 1) >=3D max_associativity_domain_index=
) {
> >  		/*
> >  		 * Skip the length field and send start of associativity array
> >  		 */
> > @@ -310,14 +310,14 @@ static int __init find_primary_domain_index(void)
> >  	 */
> >  	distance_ref_points =3D of_get_property(root,
> >  					"ibm,associativity-reference-points",
> > -					&distance_ref_points_depth);
> > +					&max_associativity_domain_index);
> > =20
> >  	if (!distance_ref_points) {
> >  		dbg("NUMA: ibm,associativity-reference-points not found.\n");
> >  		goto err;
> >  	}
> > =20
> > -	distance_ref_points_depth /=3D sizeof(int);
> > +	max_associativity_domain_index /=3D sizeof(int);
> > =20
> >  	if (firmware_has_feature(FW_FEATURE_OPAL) ||
> >  	    firmware_has_feature(FW_FEATURE_TYPE1_AFFINITY)) {
> > @@ -328,7 +328,7 @@ static int __init find_primary_domain_index(void)
> >  	if (form1_affinity) {
> >  		index =3D of_read_number(distance_ref_points, 1);
> >  	} else {
> > -		if (distance_ref_points_depth < 2) {
> > +		if (max_associativity_domain_index < 2) {
> >  			printk(KERN_WARNING "NUMA: "
> >  				"short ibm,associativity-reference-points\n");
> >  			goto err;
> > @@ -341,10 +341,10 @@ static int __init find_primary_domain_index(void)
> >  	 * Warn and cap if the hardware supports more than
> >  	 * MAX_DISTANCE_REF_POINTS domains.
> >  	 */
> > -	if (distance_ref_points_depth > MAX_DISTANCE_REF_POINTS) {
> > +	if (max_associativity_domain_index > MAX_DISTANCE_REF_POINTS) {
> >  		printk(KERN_WARNING "NUMA: distance array capped at "
> >  			"%d entries\n", MAX_DISTANCE_REF_POINTS);
> > -		distance_ref_points_depth =3D MAX_DISTANCE_REF_POINTS;
> > +		max_associativity_domain_index =3D MAX_DISTANCE_REF_POINTS;
> >  	}
> > =20
> >  	of_node_put(root);
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zcr5U4CsBcAaWkoA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD4x44ACgkQbDjKyiDZ
s5K36g//WpUK0zKwOXYF8OCPGwvJqVXfb+zsvEtmpHpWCukwYl0tPgbR8+R9iF3J
UHX3nYxZSUcu6nwHhP5NAUSwqFrPmCt2I7X6zzlkgER7jhRd5eddnr6ZRvjtUyi3
NKJ0g8JtbAG//Tzy6BwtbruYwGME5LSLATDBZU+eh5HUwXMTjVgNyrQQnPwQ7FKc
N8yU62YbhoFHwUkOqZEbcG1yzAFETcdYH7dLxX7zgInTUPnOSMPxDZ/wNA8twOZt
jEi48i2sCutUjaWclHIEeYjh8SFKswWnAaPveosOmZBdNuFwshNSN1Nx6t+gT/UA
Lp0CcihRkjN8EjcHEIGeT5AqPRM/DGiYZxolgL15WGAxBeFuxryuOkjmcH5aS5rz
irzv5fz3Q015tibUuC/7W6jDVvAiq8UfqK9abpF3HiahW1ST/iCuRtebCfiMtdfl
hsVkDEp607VVwAKkGuhRNsH1M/w3OeB5JV8N7XCa88YS8qf+QjVM+kwUmXf+sQcJ
GDG3DjUM5rtxHGELd/sERsabYwiA+9i514+H9hsCZru65yA92SkUPBLqQ9NM7nbP
iQ3VjZBcvnJaiAz++roBACkHhf1ZaEQFzGMzvgSVuPShzc5sNkigO+ACRs3SXKLI
sdFPOnoI/ouxoqgLJQtZiTUzZQqz+isZOtmfIilPSsWDmx5kyVM=
=wzzl
-----END PGP SIGNATURE-----

--Zcr5U4CsBcAaWkoA--
