Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB53A7576
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vdt6bFMz3c15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:57:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=jVn8A3Gu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=jVn8A3Gu; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vd11G5Pz2yXK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:56:20 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3vcz45y1z9t0p; Tue, 15 Jun 2021 13:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623729379;
 bh=j1g6Y4duzu8lXroal7e/EVBoZKlsdhIyHUaKHwIJvIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jVn8A3Gukhv1uw5kCn6ngq8IAt/8cNspWruPPPeSnfj2JAOXY+0LdKRM7s+oHt260
 YRs0ZMGvYZeMlzBjLfFEGFqA3SPvLDFxqseeazeR68dcWE0KDCATdsIdxGViJszPC3
 KfDD1AUq979PvicIOAFEGuFU7Kiir3F1E5PG+7oE=
Date: Tue, 15 Jun 2021 13:13:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 4/8] powerpc/pseries: Consolidate DLPAR NUMA distance
 update
Message-ID: <YMga6CtDlIB0wLbp@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-5-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NWr3IvVJjHvk5f4P"
Content-Disposition: inline
In-Reply-To: <20210614164003.196094-5-aneesh.kumar@linux.ibm.com>
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


--NWr3IvVJjHvk5f4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 10:09:59PM +0530, Aneesh Kumar K.V wrote:
> The associativity details of the newly added resourced are collected from
> the hypervisor via "ibm,configure-connector" rtas call. Update the numa
> distance details of the newly added numa node after the above call. In
> later patch we will remove updating NUMA distance when we are looking
> for node id from associativity array.
>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c                        | 41 +++++++++++++++++++
>  arch/powerpc/platforms/pseries/hotplug-cpu.c  |  2 +
>  .../platforms/pseries/hotplug-memory.c        |  2 +
>  arch/powerpc/platforms/pseries/pseries.h      |  1 +
>  4 files changed, 46 insertions(+)
>=20
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 192067991f8a..fec47981c1ef 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -287,6 +287,47 @@ int of_node_to_nid(struct device_node *device)
>  }
>  EXPORT_SYMBOL(of_node_to_nid);
> =20
> +static void __initialize_form1_numa_distance(const __be32 *associativity)
> +{
> +	int i, nid;
> +
> +	if (of_read_number(associativity, 1) >=3D primary_domain_index) {
> +		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> +
> +		for (i =3D 0; i < max_domain_index; i++) {
> +			const __be32 *entry;
> +
> +			entry =3D &associativity[be32_to_cpu(distance_ref_points[i])];
> +			distance_lookup_table[nid][i] =3D of_read_number(entry, 1);
> +		}
> +	}
> +}

This logic is almost identicaly to initialize_distance_lookup_table()
- it would be good if they could be consolidated, so it's clear that
coldplugged and hotplugged nodes are parsing the NUMA information in
the same way.

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
> +	return;
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
> index 8377f1f7c78e..0e602c3b01ea 100644
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
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
> index 1f051a786fb3..663a0859cf13 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -113,4 +113,5 @@ extern u32 pseries_security_flavor;
>  void pseries_setup_security_mitigations(void);
>  void pseries_lpar_read_hblkrm_characteristics(void);
> =20
> +void update_numa_distance(struct device_node *node);
>  #endif /* _PSERIES_PSERIES_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NWr3IvVJjHvk5f4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIGugACgkQbDjKyiDZ
s5LPnRAA5nXA3ymO0WGCJm1KNqzmnYwBaf3NKLjsiCiiDAx2r9FZUnQ93IUhdsA6
t3bInjsWjnKQro3DGZs8T+KwOKTOwpa8eVyf+5DQ1yxx2FsycS8LK1Jelppc72V4
cFPabhmalfXBI3crB3jGvq/JQLeL9eFoDqpHm3ik+Pmu9c10DorywG0qKZsoP+0i
CsKTG1ycwG0LsUAHGT7NvmcnVEcDRD6napCQnkjKzTaRQeC5Y0/ubFXpNxCmJS/x
QNXe+o0u8DT5zQ2nJsvHdfRkRk7/aYsRYXcaHJDq+4XCTMTW2YdBVoXa93gtTFPb
m7VFZuTug0u4lyFuSsvy+i/g88FNYxXyihqPD+QFB6q2dpJnSRf4wHR9TQtAjT4H
eIoPfEmO9G0Wg2anVk8MRwXESVwtFkFcMRTRohOOjXiIhLeVVm6TF7dRa5a8lsOt
/e/GAlZ8SK68vN6u5K1IRS3UndGXG6CBGa4Eub68RHbAzUNB4y2qRF0RnNI9LZPz
JIZwqsLoT8OkqqtsfBHU+OcOpP/udSqLSf5VeS3X4PXMErNdfJmm1qZDSxzLHoYG
JRebYiirMM3ffvazbqPfcd3oVXEmFbZXrFjksEpP7N9tNfBUyraTCz5ZjDbw7dEJ
MWlc7WW/zWduLU9wU1v+GSXqsGtJGRrPz9rH991gTAxSm9g3vK8=
=uI/N
-----END PGP SIGNATURE-----

--NWr3IvVJjHvk5f4P--
