Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B70813A7574
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vdR2Wlfz3bt1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:56:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=ljfuaHEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=ljfuaHEY; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vd11kkKz2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:56:20 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3vcz2zWfz9sjD; Tue, 15 Jun 2021 13:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623729379;
 bh=aajB0TStzRERv9jkEHDMi2wWKYL1wqIR/XV6ikzTPUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ljfuaHEYs9O4Uro08lKM3/whhzjI+vZ3rCsXBkgjlx2e48c0/thU9/GO0S3ZudqYg
 n52kIUneCuJcbnxnce4CBeUlW2cRBUeb2g5dD4yCtnjU5bkkV3f+btevej6CoY2jPq
 fXs9KC2ayb9VO4AEdH7OtBS6o5tFLLPbFk0vHOr0=
Date: Tue, 15 Jun 2021 13:01:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 2/8] powerpc/pseries: rename
 distance_ref_points_depth to max_domain_index
Message-ID: <YMgYCwpQ+rzkZ8tx@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-3-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dliwKLvGoerAq8Kd"
Content-Disposition: inline
In-Reply-To: <20210614164003.196094-3-aneesh.kumar@linux.ibm.com>
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


--dliwKLvGoerAq8Kd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:09:57PM +0530, Aneesh Kumar K.V wrote:
> No functional change in this patch

As with 1/8 an explanation of what this actually means and therefore
why this is a better name would be very helpful.

>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 8365b298ec48..5941da201fa3 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -56,7 +56,7 @@ static int n_mem_addr_cells, n_mem_size_cells;
>  static int form1_affinity;
> =20
>  #define MAX_DISTANCE_REF_POINTS 4
> -static int distance_ref_points_depth;
> +static int max_domain_index;
>  static const __be32 *distance_ref_points;
>  static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS];
> =20
> @@ -169,7 +169,7 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_ass=
oc)
> =20
>  	int i, index;
> =20
> -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> +	for (i =3D 0; i < max_domain_index; i++) {
>  		index =3D be32_to_cpu(distance_ref_points[i]);
>  		if (cpu1_assoc[index] =3D=3D cpu2_assoc[index])
>  			break;
> @@ -193,7 +193,7 @@ int __node_distance(int a, int b)
>  	if (!form1_affinity)
>  		return ((a =3D=3D b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
> =20
> -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> +	for (i =3D 0; i < max_domain_index; i++) {
>  		if (distance_lookup_table[a][i] =3D=3D distance_lookup_table[b][i])
>  			break;
> =20
> @@ -213,7 +213,7 @@ static void initialize_distance_lookup_table(int nid,
>  	if (!form1_affinity)
>  		return;
> =20
> -	for (i =3D 0; i < distance_ref_points_depth; i++) {
> +	for (i =3D 0; i < max_domain_index; i++) {
>  		const __be32 *entry;
> =20
>  		entry =3D &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
> @@ -240,7 +240,7 @@ static int associativity_to_nid(const __be32 *associa=
tivity)
>  		nid =3D NUMA_NO_NODE;
> =20
>  	if (nid > 0 &&
> -		of_read_number(associativity, 1) >=3D distance_ref_points_depth) {
> +		of_read_number(associativity, 1) >=3D max_domain_index) {
>  		/*
>  		 * Skip the length field and send start of associativity array
>  		 */
> @@ -310,14 +310,14 @@ static int __init find_primary_domain_index(void)
>  	 */
>  	distance_ref_points =3D of_get_property(root,
>  					"ibm,associativity-reference-points",
> -					&distance_ref_points_depth);
> +					&max_domain_index);
> =20
>  	if (!distance_ref_points) {
>  		dbg("NUMA: ibm,associativity-reference-points not found.\n");
>  		goto err;
>  	}
> =20
> -	distance_ref_points_depth /=3D sizeof(int);
> +	max_domain_index /=3D sizeof(int);
> =20
>  	if (firmware_has_feature(FW_FEATURE_OPAL) ||
>  	    firmware_has_feature(FW_FEATURE_TYPE1_AFFINITY)) {
> @@ -328,7 +328,7 @@ static int __init find_primary_domain_index(void)
>  	if (form1_affinity) {
>  		index =3D of_read_number(distance_ref_points, 1);
>  	} else {
> -		if (distance_ref_points_depth < 2) {
> +		if (max_domain_index < 2) {
>  			printk(KERN_WARNING "NUMA: "
>  				"short ibm,associativity-reference-points\n");
>  			goto err;
> @@ -341,10 +341,10 @@ static int __init find_primary_domain_index(void)
>  	 * Warn and cap if the hardware supports more than
>  	 * MAX_DISTANCE_REF_POINTS domains.
>  	 */
> -	if (distance_ref_points_depth > MAX_DISTANCE_REF_POINTS) {
> +	if (max_domain_index > MAX_DISTANCE_REF_POINTS) {
>  		printk(KERN_WARNING "NUMA: distance array capped at "
>  			"%d entries\n", MAX_DISTANCE_REF_POINTS);
> -		distance_ref_points_depth =3D MAX_DISTANCE_REF_POINTS;
> +		max_domain_index =3D MAX_DISTANCE_REF_POINTS;
>  	}
> =20
>  	of_node_put(root);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dliwKLvGoerAq8Kd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIGAsACgkQbDjKyiDZ
s5LZURAAmzicCUY9+8BnKK+xGStdAa5zB0FZkxJdjKE4Po1xegoQG4wIV9DbOc0H
kztQvzI3u5ACvcMKBVUvdi0c9Fd0quPBPU+fYEw7u2DSqdbzcu4I/DM+/0rtWEfP
170RR8oj2grNupcHgYmItBHvajA5gA5XzmHvV22GY54NiaA8P59aV/y6ubLjsrUH
fxjLvmli19F5EWR+gemKpnjOcLfCW3GZL2LlgDx88z/a6hz40h8EYVEw0W4i7Zm5
AQHowdSs8UXY5xoBgWg+pKfwNgkZFDWPIQhnedEqyLYJ3P8xoAivzaIygiq+yTw/
SagpbSjbM1EBYPWn4TGrzQufGULqKcYrP0itgW5va9tgTOsU/1d039mrTQwSf/+H
5fKoAf45L86kTivo+YWmGDZ/oX15MhOmcxgG/fAjRKOxBoa6YOeqiR5Z8S0b43a3
Tnjcgf8g2GIfbVUkwmS3w1o5SIul+BH+ZFHWuBG4d0t4BJLibD2VdGuJRD2lnJh+
poZGaqdhAy6AUIf/FxnbA2s1fjJy2Ate1LlvIE361SN4XJn9nOXhfVjL5AsQ627n
yF8nBfsg/ST3xab3bPO8CBuDtvKiSS2ijje+5LFwGH/M2+pklSxQ1oWPc02WwcO2
+Wq54/qCt13Wfci3ZsaO5TLHvJ0m9rdAX9K8tMyWSvVSJ+SK5T4=
=Li6N
-----END PGP SIGNATURE-----

--dliwKLvGoerAq8Kd--
