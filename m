Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5D3EE52A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 05:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpcKb3T41z3bZ9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 13:42:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=lgfpA3Mp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=lgfpA3Mp; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpcJC40Hgz2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 13:40:59 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GpcJ551fmz9sRN; Tue, 17 Aug 2021 13:40:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629171653;
 bh=5R1jJQ3MqtTt/FHi6sl01NEhHeqMvpaqrA+as/U8+Tk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lgfpA3Mpo+bykio9InltzEzk5/1YLCCPZBMTfaQYhkkyiFdQdmCBTRuqkaTPkaPLV
 2rBb+nb4wJzshaDqQ0w/Dfwlzd5pHDeyftZRTEcBKj8nmqn/5ZTLEeCxeSXzIEi8jS
 TDqk02Gvmnqe4P0OrXKUOg/Mp88ZUaBVDc1d7vjY=
Date: Tue, 17 Aug 2021 13:40:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v8 5/5] powerpc/pseries: Add support for FORM2
 associativity
Message-ID: <YRsvudTd3+J5WSgR@yekko>
References: <20210812132223.225214-1-aneesh.kumar@linux.ibm.com>
 <20210812132223.225214-6-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZCXx6icfyNANLU8H"
Content-Disposition: inline
In-Reply-To: <20210812132223.225214-6-aneesh.kumar@linux.ibm.com>
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


--ZCXx6icfyNANLU8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 06:52:23PM +0530, Aneesh Kumar K.V wrote:
> PAPR interface currently supports two different ways of communicating res=
ource
> grouping details to the OS. These are referred to as Form 0 and Form 1
> associativity grouping. Form 0 is the older format and is now considered
> deprecated. This patch adds another resource grouping named FORM2.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Though there a couple of cosmetic issues and one bad memory access
issue (though only in the case of buggy firmware).

[snip]
> +Form 2
> +-------
> +Form 2 associativity format adds separate device tree properties represe=
nting NUMA node distance
> +thereby making the node distance computation flexible. Form 2 also allow=
s flexible primary
> +domain numbering. With numa distance computation now detached from the i=
ndex value in
> +"ibm,associativity-reference-points" property, Form 2 allows a large num=
ber of primary domain
> +ids at the same domainID index representing resource groups of different=
 performance/latency
> +characteristics.
> +
> +Hypervisor indicates the usage of FORM2 associativity using bit 2 of byt=
e 5 in the
> +"ibm,architecture-vec-5" property.
> +
> +"ibm,numa-lookup-index-table" property contains a list of one or more nu=
mbers representing
> +the domainIDs present in the system. The offset of the domainID in this =
property is
> +used as an index while computing numa distance information via "ibm,numa=
-distance-table".
> +
> +prop-encoded-array: The number N of the domainIDs encoded as with encode=
-int, followed by
> +N domainID encoded as with encode-int
> +
> +For ex:
> +"ibm,numa-lookup-index-table" =3D  {4, 0, 8, 250, 252}. The offset of do=
mainID 8 (2) is used when

Since you're using dts syntax below, it probably makes sense to use it
here as well.

> +computing the distance of domain 8 from other domains present in the sys=
tem. For the rest of
> +this document, this offset will be referred to as domain distance offset.
> +
> +"ibm,numa-distance-table" property contains a list of one or more number=
s representing the NUMA
> +distance between resource groups/domains present in the system.
> +
> +prop-encoded-array: The number N of the distance values encoded as with =
encode-int, followed by
> +N distance values encoded as with encode-bytes. The max distance value w=
e could encode is 255.
> +The number N must be equal to the square of m where m is the number of d=
omainIDs in the
> +numa-lookup-index-table.
> +
> +For ex:
> +ibm,numa-lookup-index-table =3D <3 0 8 40>;
> +ibm,numa-distace-table =3D <9>, /bits/ 8 < 10  20  80
> +					 20  10 160
> +					 80 160  10>;

[snip]
> +
> +	/* FORM2 affinity  */
> +	nid =3D of_node_to_nid_single(node);
> +	if (nid =3D=3D NUMA_NO_NODE)
> +		return;
> +
> +	/*
> +	 * With FORM2 we expect NUMA distance of all possible NUMA
> +	 * nodes to be provided during boot.
> +	 */
> +	WARN(numa_distance_table[nid][nid] =3D=3D -1,
> +	     "NUMA distance details for node %d not provided\n", nid);
> +}
> +
> +/*
> + * ibm,numa-lookup-index-table=3D {N, domainid1, domainid2, ..... domain=
idN}
> + * ibm,numa-distance-table =3D { N, 1, 2, 4, 5, 1, 6, .... N elements}

=2E. and here too.

> + */
> +static void initialize_form2_numa_distance_lookup_table(void)
> +{
> +	int i, j;
> +	struct device_node *root;
> +	const __u8 *numa_dist_table;
> +	const __be32 *numa_lookup_index;
> +	int numa_dist_table_length;
> +	int max_numa_index, distance_index;
> +
> +	if (firmware_has_feature(FW_FEATURE_OPAL))
> +		root =3D of_find_node_by_path("/ibm,opal");
> +	else
> +		root =3D of_find_node_by_path("/rtas");
> +	if (!root)
> +		root =3D of_find_node_by_path("/");
> +
> +	numa_lookup_index =3D of_get_property(root, "ibm,numa-lookup-index-tabl=
e", NULL);
> +	max_numa_index =3D of_read_number(&numa_lookup_index[0], 1);
> +
> +	/* first element of the array is the size and is encode-int */
> +	numa_dist_table =3D of_get_property(root, "ibm,numa-distance-table", NU=
LL);
> +	numa_dist_table_length =3D of_read_number((const __be32 *)&numa_dist_ta=
ble[0], 1);
> +	/* Skip the size which is encoded int */
> +	numa_dist_table +=3D sizeof(__be32);
> +
> +	pr_debug("numa_dist_table_len =3D %d, numa_dist_indexes_len =3D %d\n",
> +		 numa_dist_table_length, max_numa_index);

You validate numa_dist_table_length below.  However, AFAICT you don't
anywhere check that the property actually has the length its first
element claims it does.  Yes, that represents a firmware bug, but it's
probably best if we don't ready past the end of the array in that
case, which I think is what will happen now.

Same applies for the lookup-index-table.

> +	for (i =3D 0; i < max_numa_index; i++)
> +		/* +1 skip the max_numa_index in the property */
> +		numa_id_index_table[i] =3D of_read_number(&numa_lookup_index[i + 1], 1=
);
> +
> +
> +	if (numa_dist_table_length !=3D max_numa_index * max_numa_index) {
> +		WARN(1, "Wrong NUMA distance information\n");
> +		/* consider everybody else just remote. */
> +		for (i =3D 0;  i < max_numa_index; i++) {
> +			for (j =3D 0; j < max_numa_index; j++) {
> +				int nodeA =3D numa_id_index_table[i];
> +				int nodeB =3D numa_id_index_table[j];
> +
> +				if (nodeA =3D=3D nodeB)
> +					numa_distance_table[nodeA][nodeB] =3D LOCAL_DISTANCE;
> +				else
> +					numa_distance_table[nodeA][nodeB] =3D REMOTE_DISTANCE;
> +			}
> +		}
> +	}
> +
> +	distance_index =3D 0;
> +	for (i =3D 0;  i < max_numa_index; i++) {
> +		for (j =3D 0; j < max_numa_index; j++) {
> +			int nodeA =3D numa_id_index_table[i];
> +			int nodeB =3D numa_id_index_table[j];
> +
> +			numa_distance_table[nodeA][nodeB] =3D numa_dist_table[distance_index+=
+];
> +			pr_debug("dist[%d][%d]=3D%d ", nodeA, nodeB, numa_distance_table[node=
A][nodeB]);
> +		}
> +	}
> +	of_node_put(root);
>  }
> =20
>  static int __init find_primary_domain_index(void)
> @@ -344,6 +449,9 @@ static int __init find_primary_domain_index(void)
>  	 */
>  	if (firmware_has_feature(FW_FEATURE_OPAL)) {
>  		affinity_form =3D FORM1_AFFINITY;
> +	} else if (firmware_has_feature(FW_FEATURE_FORM2_AFFINITY)) {
> +		dbg("Using form 2 affinity\n");
> +		affinity_form =3D FORM2_AFFINITY;
>  	} else if (firmware_has_feature(FW_FEATURE_FORM1_AFFINITY)) {
>  		dbg("Using form 1 affinity\n");
>  		affinity_form =3D FORM1_AFFINITY;
> @@ -388,9 +496,12 @@ static int __init find_primary_domain_index(void)
> =20
>  		index =3D of_read_number(&distance_ref_points[1], 1);
>  	} else {
> +		/*
> +		 * Both FORM1 and FORM2 affinity find the primary domain details
> +		 * at the same offset.
> +		 */
>  		index =3D of_read_number(distance_ref_points, 1);
>  	}
> -
>  	/*
>  	 * Warn and cap if the hardware supports more than
>  	 * MAX_DISTANCE_REF_POINTS domains.
> @@ -819,6 +930,12 @@ static int __init parse_numa_properties(void)
> =20
>  	dbg("NUMA associativity depth for CPU/Memory: %d\n", primary_domain_ind=
ex);
> =20
> +	/*
> +	 * If it is FORM2 initialize the distance table here.
> +	 */
> +	if (affinity_form =3D=3D FORM2_AFFINITY)
> +		initialize_form2_numa_distance_lookup_table();
> +
>  	/*
>  	 * Even though we connect cpus to numa domains later in SMP
>  	 * init, we need to know the node ids now. This is because
> diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/pla=
tforms/pseries/firmware.c
> index 5d4c2bc20bba..f162156b7b68 100644
> --- a/arch/powerpc/platforms/pseries/firmware.c
> +++ b/arch/powerpc/platforms/pseries/firmware.c
> @@ -123,6 +123,7 @@ vec5_fw_features_table[] =3D {
>  	{FW_FEATURE_PRRN,		OV5_PRRN},
>  	{FW_FEATURE_DRMEM_V2,		OV5_DRMEM_V2},
>  	{FW_FEATURE_DRC_INFO,		OV5_DRC_INFO},
> +	{FW_FEATURE_FORM2_AFFINITY,	OV5_FORM2_AFFINITY},
>  };
> =20
>  static void __init fw_vec5_feature_init(const char *vec5, unsigned long =
len)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZCXx6icfyNANLU8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEbL7cACgkQbDjKyiDZ
s5IjLhAAtBvNTaVGv9z1DHRG/iwF71REaCYFfvw8ta6UIOUzFi0eG0fs+t8VefYZ
KyWy4vc6WuXIKS7womsNu201C2k2lrNWKA/byE4jx7usmxNDZfxHsUw5g6+QE81X
hXLCT7MR/Fq1urOd+4+PbBHwpeKNyLAL3eN6A/6aU+wYkCZyc4VCeegZKtqhfjFG
sg4fqbfVTSBvR9uWpYPYovQYsMblaB5Gv9w9t1igUqVNaBNupvrIb95eZzARf5Qv
sQ4/JptwaCGCkNuWcOXkQasnQKQJXsTyLEqq5KNZdA4FgK9cFkUlYAyx5zNqclWo
7j+joYf/HW6d3rT+jlpiX6jrem2XzyiiGhW5UK6G+chqyL9Zod2Dj75ELtVQf7w+
0QlN30IVmIE3VN/MM1T6ly98gKjxAuxRuIGBQOwhbps+/P249kpDFf8DE94fkD6D
Dg2ECG8MAeY1YW9If/jDBCS3rdedxLXLPk1Si1UfnS4iO24cKK7mlIWPSyaNW+Bw
EVolCM1GU0YLJrokRFfO/emfNW6wp6Ju3utUE8x9SqfMQ17W+iu3cyoynejLIuiA
lpTeZEMQXWpI4GECuRnPhT8mLFHL77ffsT7RXyv2yqLjhlotnB0zvLX+dhWqFt2c
POHLmG9OYs+11d/5kyaBxNQpx5vp7iocLBio6PADZ2Tx0NTj3sw=
=oSlM
-----END PGP SIGNATURE-----

--ZCXx6icfyNANLU8H--
