Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76F3B2558
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 05:18:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9QMH4gclz3c7w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:18:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=LY38kyez;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=LY38kyez; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9QKx1THJz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:17:24 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9QKr37jwz9sfG; Thu, 24 Jun 2021 13:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624504640;
 bh=X8k9iaQB3LCdzp/BpYKxY4NoILBPk8GF7Il2o3bO3ow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LY38kyezF/3xNyr3eISvAmuVfQ7F5rRH5HUALuZmpmhh7dQrehD1Pd94o8pbVWYTL
 LtJG1v+9hs4JgELdfTmAQK1AoaDB1VOJoAJ+tK23B06ZJq/h5VDE2OdSSog9tGrxbL
 nB9PlON6mIkQhLqhBez36DWm5J2xb5nzmXT6jxnQ=
Date: Thu, 24 Jun 2021 13:10:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 2/7] powerpc/pseries: rename distance_ref_points_depth
 to max_associativity_domain_index
Message-ID: <YNP3tdIojvDCOyJt@yekko>
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
 <20210617165105.574178-3-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QJXngOsWO/pFgh6v"
Content-Disposition: inline
In-Reply-To: <20210617165105.574178-3-aneesh.kumar@linux.ibm.com>
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


--QJXngOsWO/pFgh6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 10:21:00PM +0530, Aneesh Kumar K.V wrote:
> No functional change in this patch

I've been convinced of your other rename, but I'm not yet convinced
this one actually clarifies anything.

>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 8365b298ec48..132813dd1a6c 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -56,7 +56,7 @@ static int n_mem_addr_cells, n_mem_size_cells;
>  static int form1_affinity;
> =20
>  #define MAX_DISTANCE_REF_POINTS 4
> -static int distance_ref_points_depth;
> +static int max_associativity_domain_index;
>  static const __be32 *distance_ref_points;
>  static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS];
> =20
> @@ -169,7 +169,7 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_ass=
oc)
> =20
>  	int i, index;
> =20
> -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> +	for (i =3D 0; i < max_associativity_domain_index; i++) {
>  		index =3D be32_to_cpu(distance_ref_points[i]);
>  		if (cpu1_assoc[index] =3D=3D cpu2_assoc[index])
>  			break;
> @@ -193,7 +193,7 @@ int __node_distance(int a, int b)
>  	if (!form1_affinity)
>  		return ((a =3D=3D b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
> =20
> -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> +	for (i =3D 0; i < max_associativity_domain_index; i++) {
>  		if (distance_lookup_table[a][i] =3D=3D distance_lookup_table[b][i])
>  			break;
> =20
> @@ -213,7 +213,7 @@ static void initialize_distance_lookup_table(int nid,
>  	if (!form1_affinity)
>  		return;
> =20
> -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> +	for (i =3D 0; i < max_associativity_domain_index; i++) {
>  		const __be32 *entry;
> =20
>  		entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
> @@ -240,7 +240,7 @@ static int associativity_to_nid(const __be32 *associa=
tivity)
>  		nid =3D NUMA_NO_NODE;
> =20
>  	if (nid > 0 &&
> -		of_read_number(associativity, 1) >=3D distance_ref_points_depth) {
> +		of_read_number(associativity, 1) >=3D max_associativity_domain_index) {
>  		/*
>  		 * Skip the length field and send start of associativity array
>  		 */
> @@ -310,14 +310,14 @@ static int __init find_primary_domain_index(void)
>  	 */
>  	distance_ref_points =3D of_get_property(root,
>  					"ibm,associativity-reference-points",
> -					&distance_ref_points_depth);
> +					&max_associativity_domain_index);
> =20
>  	if (!distance_ref_points) {
>  		dbg("NUMA: ibm,associativity-reference-points not found.\n");
>  		goto err;
>  	}
> =20
> -	distance_ref_points_depth /=3D sizeof(int);
> +	max_associativity_domain_index /=3D sizeof(int);
> =20
>  	if (firmware_has_feature(FW_FEATURE_OPAL) ||
>  	    firmware_has_feature(FW_FEATURE_TYPE1_AFFINITY)) {
> @@ -328,7 +328,7 @@ static int __init find_primary_domain_index(void)
>  	if (form1_affinity) {
>  		index =3D of_read_number(distance_ref_points, 1);
>  	} else {
> -		if (distance_ref_points_depth < 2) {
> +		if (max_associativity_domain_index < 2) {
>  			printk(KERN_WARNING "NUMA: "
>  				"short ibm,associativity-reference-points\n");
>  			goto err;
> @@ -341,10 +341,10 @@ static int __init find_primary_domain_index(void)
>  	 * Warn and cap if the hardware supports more than
>  	 * MAX_DISTANCE_REF_POINTS domains.
>  	 */
> -	if (distance_ref_points_depth > MAX_DISTANCE_REF_POINTS) {
> +	if (max_associativity_domain_index > MAX_DISTANCE_REF_POINTS) {
>  		printk(KERN_WARNING "NUMA: distance array capped at "
>  			"%d entries\n", MAX_DISTANCE_REF_POINTS);
> -		distance_ref_points_depth =3D MAX_DISTANCE_REF_POINTS;
> +		max_associativity_domain_index =3D MAX_DISTANCE_REF_POINTS;
>  	}
> =20
>  	of_node_put(root);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QJXngOsWO/pFgh6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT97UACgkQbDjKyiDZ
s5IrdRAAhWKmJIDs6hD2FLKaHIEr2mN/hvBd6zlLX2eS7NjHoRFqc4nUq7TreGA0
0/Qk4DbDMdsA97lMK/fc8JRXiQ01zE1Lryo38EwSv62yUcRVtW/SRJpCsI5yG/Gg
QcX1NTAOfT7sy5TtUhKFIy2sI93mGg7/I7i2Ht1gbhFJZUaoDeVMk2+wQwvSNi6v
N5sVf/isBbmLqfYVHl55U69n5ec/mk5l85+TV+EfekB4ven8bX7+NWdXeNr6kKYN
19Ql8fSXNOZLjTH6KbKm3NSqcN0odl5MlB4Mw0XvHWPxllQjkxzYiyDomXZmNSOI
1OR/tEqUL4Q4+FvBKoHpDFrbrlid+skAnfQ7xN5c/XQd8UbXmmIWjJWxxAeSb79D
U9hOfghsBvm6lyeU62expgXh1V7c1hizvwNWzs48X7HoT1/qvBj6y8rS9zqsgBGX
OkI578xNzoPy3QVZjLX+U5gopAh3ixxFIpNauO6iZwPbprsojtmFL2w6WI9L4499
jgL+TtthnlxHuI3dM3Ix2csrrWdJaXGiTYiVSCKUXnybaLMq3g8G6Jqb3NS7pcPH
B33aFTy201HxkzhbxNs5ulR7cwSt+6IKBujl1yQxLAHVy4xNfosp7swHyTB467kX
mYlDTwHuZp5FQHWmdRetB8460ICgoA7QwjE0v2ftZJzj99Ck2Pw=
=mD2u
-----END PGP SIGNATURE-----

--QJXngOsWO/pFgh6v--
