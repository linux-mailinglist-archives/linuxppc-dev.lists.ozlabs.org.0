Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFD93A7579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:57:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vfn0x27z3c8R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:57:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=hUR8gCNe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=hUR8gCNe; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vd11CRWz2yWp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:56:20 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3vcz3hlNz9t0k; Tue, 15 Jun 2021 13:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623729379;
 bh=H6kj4ErF2F3gkQGwUV8Eqr+Y0KT9Z5XrfChLFH0dFVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hUR8gCNeZWBy1LoFRV69Zn+PbphrZClNCIqFXwkBN8q3Q/qiMptqFeGTknANcdu6I
 wJm+eseyJjT2l3IFANLL7LQXqebCrS5rH/vR0hmnpdMTSoBlnQH1N+CkCNBuSq7lsz
 8XYEPivAxO1RSSuSPxTdX6TVn+QVr9u3y0oB/ifI=
Date: Tue, 15 Jun 2021 13:04:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 3/8] powerpc/pseries: Rename TYPE1_AFFINITY to
 FORM1_AFFINITY
Message-ID: <YMgYqstK9sbUWTSf@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-4-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CM9zG6gJx/W5XFf4"
Content-Disposition: inline
In-Reply-To: <20210614164003.196094-4-aneesh.kumar@linux.ibm.com>
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


--CM9zG6gJx/W5XFf4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:09:58PM +0530, Aneesh Kumar K.V wrote:
> Also make related code cleanup that will allow adding FORM2_AFFINITY in
> later patches. No functional change in this patch.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  arch/powerpc/include/asm/firmware.h       |  4 +--
>  arch/powerpc/include/asm/prom.h           |  2 +-
>  arch/powerpc/kernel/prom_init.c           |  2 +-
>  arch/powerpc/mm/numa.c                    | 35 ++++++++++++++---------
>  arch/powerpc/platforms/pseries/firmware.c |  2 +-
>  5 files changed, 26 insertions(+), 19 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/a=
sm/firmware.h
> index 7604673787d6..60b631161360 100644
> --- a/arch/powerpc/include/asm/firmware.h
> +++ b/arch/powerpc/include/asm/firmware.h
> @@ -44,7 +44,7 @@
>  #define FW_FEATURE_OPAL		ASM_CONST(0x0000000010000000)
>  #define FW_FEATURE_SET_MODE	ASM_CONST(0x0000000040000000)
>  #define FW_FEATURE_BEST_ENERGY	ASM_CONST(0x0000000080000000)
> -#define FW_FEATURE_TYPE1_AFFINITY ASM_CONST(0x0000000100000000)
> +#define FW_FEATURE_FORM1_AFFINITY ASM_CONST(0x0000000100000000)
>  #define FW_FEATURE_PRRN		ASM_CONST(0x0000000200000000)
>  #define FW_FEATURE_DRMEM_V2	ASM_CONST(0x0000000400000000)
>  #define FW_FEATURE_DRC_INFO	ASM_CONST(0x0000000800000000)
> @@ -69,7 +69,7 @@ enum {
>  		FW_FEATURE_SPLPAR | FW_FEATURE_LPAR |
>  		FW_FEATURE_CMO | FW_FEATURE_VPHN | FW_FEATURE_XCMO |
>  		FW_FEATURE_SET_MODE | FW_FEATURE_BEST_ENERGY |
> -		FW_FEATURE_TYPE1_AFFINITY | FW_FEATURE_PRRN |
> +		FW_FEATURE_FORM1_AFFINITY | FW_FEATURE_PRRN |
>  		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
>  		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
>  		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
> diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/p=
rom.h
> index 324a13351749..df9fec9d232c 100644
> --- a/arch/powerpc/include/asm/prom.h
> +++ b/arch/powerpc/include/asm/prom.h
> @@ -147,7 +147,7 @@ extern int of_read_drc_info_cell(struct property **pr=
op,
>  #define OV5_MSI			0x0201	/* PCIe/MSI support */
>  #define OV5_CMO			0x0480	/* Cooperative Memory Overcommitment */
>  #define OV5_XCMO		0x0440	/* Page Coalescing */
> -#define OV5_TYPE1_AFFINITY	0x0580	/* Type 1 NUMA affinity */
> +#define OV5_FORM1_AFFINITY	0x0580	/* FORM1 NUMA affinity */
>  #define OV5_PRRN		0x0540	/* Platform Resource Reassignment */
>  #define OV5_HP_EVT		0x0604	/* Hot Plug Event support */
>  #define OV5_RESIZE_HPT		0x0601	/* Hash Page Table resizing */
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
> index 41ed7e33d897..64b9593038a7 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1070,7 +1070,7 @@ static const struct ibm_arch_vec ibm_architecture_v=
ec_template __initconst =3D {
>  #else
>  		0,
>  #endif
> -		.associativity =3D OV5_FEAT(OV5_TYPE1_AFFINITY) | OV5_FEAT(OV5_PRRN),
> +		.associativity =3D OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN),
>  		.bin_opts =3D OV5_FEAT(OV5_RESIZE_HPT) | OV5_FEAT(OV5_HP_EVT),
>  		.micro_checkpoint =3D 0,
>  		.reserved0 =3D 0,
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 5941da201fa3..192067991f8a 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -53,7 +53,10 @@ EXPORT_SYMBOL(node_data);
> =20
>  static int primary_domain_index;
>  static int n_mem_addr_cells, n_mem_size_cells;
> -static int form1_affinity;
> +
> +#define FORM0_AFFINITY 0
> +#define FORM1_AFFINITY 1
> +static int affinity_form;
> =20
>  #define MAX_DISTANCE_REF_POINTS 4
>  static int max_domain_index;
> @@ -190,7 +193,7 @@ int __node_distance(int a, int b)
>  	int i;
>  	int distance =3D LOCAL_DISTANCE;
> =20
> -	if (!form1_affinity)
> +	if (affinity_form =3D=3D FORM0_AFFINITY)
>  		return ((a =3D=3D b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
> =20
>  	for (i =3D 0; i < max_domain_index; i++) {
> @@ -210,7 +213,7 @@ static void initialize_distance_lookup_table(int nid,
>  {
>  	int i;
> =20
> -	if (!form1_affinity)
> +	if (affinity_form !=3D FORM1_AFFINITY)
>  		return;
> =20
>  	for (i =3D 0; i < max_domain_index; i++) {
> @@ -289,6 +292,17 @@ static int __init find_primary_domain_index(void)
>  	int index;
>  	struct device_node *root;
> =20
> +	/*
> +	 * Check for which form of affinity.
> +	 */
> +	if (firmware_has_feature(FW_FEATURE_OPAL)) {
> +		affinity_form =3D FORM1_AFFINITY;
> +	} else if (firmware_has_feature(FW_FEATURE_FORM1_AFFINITY)) {
> +		dbg("Using form 1 affinity\n");
> +		affinity_form =3D FORM1_AFFINITY;
> +	} else
> +		affinity_form =3D FORM0_AFFINITY;
> +
>  	if (firmware_has_feature(FW_FEATURE_OPAL))
>  		root =3D of_find_node_by_path("/ibm,opal");
>  	else
> @@ -318,23 +332,16 @@ static int __init find_primary_domain_index(void)
>  	}
> =20
>  	max_domain_index /=3D sizeof(int);
> -
> -	if (firmware_has_feature(FW_FEATURE_OPAL) ||
> -	    firmware_has_feature(FW_FEATURE_TYPE1_AFFINITY)) {
> -		dbg("Using form 1 affinity\n");
> -		form1_affinity =3D 1;
> -	}
> -
> -	if (form1_affinity) {
> -		index =3D of_read_number(distance_ref_points, 1);
> -	} else {
> +	if (affinity_form =3D=3D FORM0_AFFINITY) {
>  		if (max_domain_index < 2) {
>  			printk(KERN_WARNING "NUMA: "
> -				"short ibm,associativity-reference-points\n");
> +			       "short ibm,associativity-reference-points\n");
>  			goto err;
>  		}
> =20
>  		index =3D of_read_number(&distance_ref_points[1], 1);
> +	} else {
> +		index =3D of_read_number(distance_ref_points, 1);
>  	}
> =20
>  	/*
> diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/pla=
tforms/pseries/firmware.c
> index 4c7b7f5a2ebc..5d4c2bc20bba 100644
> --- a/arch/powerpc/platforms/pseries/firmware.c
> +++ b/arch/powerpc/platforms/pseries/firmware.c
> @@ -119,7 +119,7 @@ struct vec5_fw_feature {
> =20
>  static __initdata struct vec5_fw_feature
>  vec5_fw_features_table[] =3D {
> -	{FW_FEATURE_TYPE1_AFFINITY,	OV5_TYPE1_AFFINITY},
> +	{FW_FEATURE_FORM1_AFFINITY,	OV5_FORM1_AFFINITY},
>  	{FW_FEATURE_PRRN,		OV5_PRRN},
>  	{FW_FEATURE_DRMEM_V2,		OV5_DRMEM_V2},
>  	{FW_FEATURE_DRC_INFO,		OV5_DRC_INFO},

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CM9zG6gJx/W5XFf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIGKoACgkQbDjKyiDZ
s5I4og//WnGzZuJqCBBcp7BaVpnnhP9+Gx9cFJojUduuB8kuVkLwrfRFJl67zGcu
aQVPXC3fSq/QshZ02aG54/YpVyXuTbDA6MzR9awEGEmZ4nlACV68HzKKRYViIfHN
+oz0klgDjG4ZOfZrbZ3yWEa+idKjqcmMoH6T1rGzs4nsYmBILEnarT8U9iz2IfIp
6FAgxRxmpATqdGMByZ1zVumAo4EXmgu5z8G9rNBjVSfP6/Dnwx1g26Diisu1H1oF
gPZhNAi7aCk6YU4y7uDWrHonJAzd3p+mKa1WG+COJRriBKCnpywQj1O0XeMCdqNH
96r45A8Tqe4SP3uizi2eOlXvaTmE8Sa0jYTg97zBNKEDWZyWFkHFVqek2al/l6wh
SUclSswW1tXS34HxlnaowEuPCYOpYTNKOoRPLIYDN8HCn19BFVS+OIcl+TX775wR
0TF0iGlRAo8VpLvCHzeOW6FlfHF1/uU2BfsrDh1kGm9g3BP/aZjrZa1FVVEwCmqT
ZO7RldtepZN0y+QCJlD7RsBUpb8tkXrADM3Zad9nWcODj71qinEJtEqHZ2iV7cas
lbonGIsd+XSqhmTE3sQx8sJ4Ds17Eh7Rrm5jk4GK4aKz+IHbyJzX2As6FI/qcVzs
yhOQSAyo1Ernv5BE5/D2Q5ypvMpJDDQ1izMHl//dBcK5xq62hn8=
=2EAe
-----END PGP SIGNATURE-----

--CM9zG6gJx/W5XFf4--
