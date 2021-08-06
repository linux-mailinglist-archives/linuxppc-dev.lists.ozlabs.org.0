Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8559E3E237B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 08:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggx0z32Ymz3dD3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 16:49:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=YGqVhbGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=YGqVhbGx; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggx0V3Y6kz2xZZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 16:49:14 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Ggx0T25tSz9sWX; Fri,  6 Aug 2021 16:49:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628232553;
 bh=YmpFpoiEfr+/N+ueRfiOrqx805rdsFWST4xQBGT40+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YGqVhbGxTOlPcFVE4/0AJCxBiEwLOizbVEX6A4jQo4dQu3DI9/Yvh4illHqz2cDv6
 IrkPxIshbvCoT/RlPrLR3U6/zQjTtesLmk4KoT1HuUMDMgLMI1xnzsx+K33Jl/3qsU
 EzjCvlQGm2AvUvJ5IWzKRwtwmEq++OYlKGzaRyO0=
Date: Fri, 6 Aug 2021 16:47:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 6/6] powerpc/pseries: Consolidate form1 distance
 initialization into a helper
Message-ID: <YQzbCxwfEdE3CQZw@yekko>
References: <20210727100311.310969-1-aneesh.kumar@linux.ibm.com>
 <20210727100311.310969-7-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5llNyI6Ko7/15Mxy"
Content-Disposition: inline
In-Reply-To: <20210727100311.310969-7-aneesh.kumar@linux.ibm.com>
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


--5llNyI6Ko7/15Mxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 03:33:11PM +0530, Aneesh Kumar K.V wrote:
> Currently, we duplicate parsing code for ibm,associativity and
> ibm,associativity-lookup-arrays in the kernel. The associativity array pr=
ovided
> by these device tree properties are very similar and hence can use
> a helper to parse the node id and numa distance details.

Oh... sorry.. comments on the earlier patch were from before I read
and saw you adjusted things here.

>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 83 ++++++++++++++++++++++++++----------------
>  1 file changed, 51 insertions(+), 32 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index fffb3c40f595..7506251e17f2 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -171,19 +171,19 @@ static void unmap_cpu_from_node(unsigned long cpu)
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
>  	int nid =3D NUMA_NO_NODE;
> +	/*
> +	 * primary_domain_index is 1 based array index.
> +	 */
> +	int index =3D primary_domain_index  - 1;
> =20
> -	if (!numa_enabled)
> +	if (!numa_enabled || index >=3D max_array_sz)
>  		goto out;

You don't need a goto, you can just return NUMA_NO_NODE.

> =20
> -	if (of_read_number(associativity, 1) >=3D primary_domain_index)
> -		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> +	nid =3D of_read_number(&associativity[index], 1);
> =20
>  	/* POWER4 LPAR uses 0xffff as invalid node */
>  	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> @@ -191,6 +191,17 @@ static int associativity_to_nid(const __be32 *associ=
ativity)
>  out:
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
> @@ -295,24 +306,41 @@ int of_node_to_nid(struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_node_to_nid);
> =20
> -static void __initialize_form1_numa_distance(const __be32 *associativity)
> +static void ___initialize_form1_numa_distance(const __be32 *associativit=
y,
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

WARN_ON, maybe?

> +			 */
> +			if (index >=3D max_array_sz)
> +				return;
> =20
> -			entry =3D &associativity[be32_to_cpu(distance_ref_points[i])];
> +			entry =3D &associativity[index];
>  			distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
>  		}
>  	}
>  }
> =20
> +static void __initialize_form1_numa_distance(const __be32 *associativity)

Do you actually use this in-between wrapper?

> +{
> +	int array_sz;
> +
> +	array_sz =3D of_read_number(associativity, 1);
> +	/* Skip the first element in the associativity array */
> +	___initialize_form1_numa_distance(associativity + 1, array_sz);
> +}
> +
>  static void initialize_form1_numa_distance(struct device_node *node)
>  {
>  	const __be32 *associativity;
> @@ -586,27 +614,18 @@ static int get_nid_and_numa_distance(struct drmem_l=
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
> +			___initialize_form1_numa_distance(associativity,
> +							  aa.array_sz);

Better, thanks.

>  		}
>  	}
>  	return nid;
> @@ -632,11 +651,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5llNyI6Ko7/15Mxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEM2wsACgkQbDjKyiDZ
s5IwrRAAjo+Bcq/XveY1NwYJKobAUdrcKGEFslDoo0SZVunZHLRdYbmLrD808sFe
30pykPmSc2sF4PJDK6PGtpL/d9sGZM+s4vEZAib4H1WKUPe/+ZgOnTRb+uTtB1zl
+4EEgZhv12X9BnMpJkidSTz/AkND8jvp8f/Vn0Hgm5U5/BS0fMYxc145NXqge/mq
aU1xGzfWIy3kKSWdbqDPdI8g8KOiA2xVXTmif5CxwFhGeZj+0ePw7xaM1GitSpo4
iD4n2ymW+LfK43rHTBhYasUwyYBQZTQ/wFlAByR9A3TrTZ1Vi9kMFXgl/Pr8GmFJ
eLTJrXSXMxFb+8gH10jzneVunj2XyusN8OgtkuVnxfF4betPomynUb21436DuMZ+
PeKULeu/wNMl6xJKA2pQddU07I4L//06zzk6k+B7rqnqaeHjqzbHRTOZ62LofLeB
SnqF5WqPzWgfgP9C88nWGaRc/pbVZUpyutMTmNeiejNQQpu+hoCrefSHEwbvyTSu
rcNctEZzegjVHmPt4jtV3Y1ZQcjV9B2NrreJBmQJM5BI8ozE7M1Hsx4R4gVdgP+G
l8c6roW97UpZbr2yXWq+4r2aDuc766tI7oSnJ5neBvg7uU944TYviEXSc7oUgqfC
p+ZS9HAn5qXGkH17/jKZWVqUn0+bcTOoHUYj1J6aAas8h9uH8vg=
=F4R8
-----END PGP SIGNATURE-----

--5llNyI6Ko7/15Mxy--
