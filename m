Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E63D1BCF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 04:38:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVc7h4pyQz3bx8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 12:38:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=qLt8Yx1x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=qLt8Yx1x; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVc6J16rYz2yMm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 12:36:55 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GVc6D2lydz9sXM; Thu, 22 Jul 2021 12:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626921412;
 bh=nNpstGd5As8mWaYtd+B4PDdsAIFg5hO9obmHU7wyxv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qLt8Yx1xXJsb4Gt5LpC/K2RBDii+YwUpgYO3GQeGc2la5XWsdpqYQp6dcgPA4rKA4
 i35mY6535RfN2gSSGXaJfsdhupKgT3+ulMlz+gRms7jWf5MioKPBy7uX/4HPQeupWq
 1T0dJg18Yr1Nu11L1GF+SAIdzuTPJU/k94BupFEk=
Date: Thu, 22 Jul 2021 11:42:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 5/6] powerpc/pseries: Add a helper for form1 cpu
 distance
Message-ID: <YPjM/5/KdKs4MNj1@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-6-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YOiJ9teSuunXYCPo"
Content-Disposition: inline
In-Reply-To: <20210628151117.545935-6-aneesh.kumar@linux.ibm.com>
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


--YOiJ9teSuunXYCPo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 08:41:16PM +0530, Aneesh Kumar K.V wrote:
> This helper is only used with the dispatch trace log collection.
> A later patch will add Form2 affinity support and this change helps
> in keeping that simpler. Also add a comment explaining we don't expect
> the code to be called with FORM0
>=20
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

What makes it a "relative_distance" rather than just a "distance"?

> ---
>  arch/powerpc/include/asm/topology.h   |  4 ++--
>  arch/powerpc/mm/numa.c                | 10 +++++++++-
>  arch/powerpc/platforms/pseries/lpar.c |  4 ++--
>  3 files changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/a=
sm/topology.h
> index e4db64c0e184..ac8b5ed79832 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -36,7 +36,7 @@ static inline int pcibus_to_node(struct pci_bus *bus)
>  				 cpu_all_mask :				\
>  				 cpumask_of_node(pcibus_to_node(bus)))
> =20
> -extern int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
> +int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
>  extern int __node_distance(int, int);
>  #define node_distance(a, b) __node_distance(a, b)
> =20
> @@ -83,7 +83,7 @@ static inline void sysfs_remove_device_from_node(struct=
 device *dev,
> =20
>  static inline void update_numa_cpu_lookup_table(unsigned int cpu, int no=
de) {}
> =20
> -static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> +static inline int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2=
_assoc)
>  {
>  	return 0;
>  }
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 7b142f79d600..c6293037a103 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -166,7 +166,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
>  }
>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> =20
> -int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> +static int __cpu_form1_relative_distance(__be32 *cpu1_assoc, __be32 *cpu=
2_assoc)
>  {
>  	int dist =3D 0;
> =20
> @@ -182,6 +182,14 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_as=
soc)
>  	return dist;
>  }
> =20
> +int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> +{
> +	/* We should not get called with FORM0 */
> +	VM_WARN_ON(affinity_form =3D=3D FORM0_AFFINITY);
> +
> +	return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
> +}
> +
>  /* must hold reference to node during call */
>  static const __be32 *of_get_associativity(struct device_node *dev)
>  {
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platfor=
ms/pseries/lpar.c
> index dab356e3ff87..afefbdfe768d 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -261,7 +261,7 @@ static int cpu_relative_dispatch_distance(int last_di=
sp_cpu, int cur_disp_cpu)
>  	if (!last_disp_cpu_assoc || !cur_disp_cpu_assoc)
>  		return -EIO;
> =20
> -	return cpu_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
> +	return cpu_relative_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
>  }
> =20
>  static int cpu_home_node_dispatch_distance(int disp_cpu)
> @@ -281,7 +281,7 @@ static int cpu_home_node_dispatch_distance(int disp_c=
pu)
>  	if (!disp_cpu_assoc || !vcpu_assoc)
>  		return -EIO;
> =20
> -	return cpu_distance(disp_cpu_assoc, vcpu_assoc);
> +	return cpu_relative_distance(disp_cpu_assoc, vcpu_assoc);
>  }
> =20
>  static void update_vcpu_disp_stat(int disp_cpu)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YOiJ9teSuunXYCPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD4zP8ACgkQbDjKyiDZ
s5IbuxAAqd+bUaLxCULNpPHnJeO/UTnhzVdSANBbIG6vuvEhGzlo5GvefausyHzQ
12I+u3mi7h7+V2D8gyfCtO5wMHtQLehk1g05FhS6um8PVGwajmon7u/1FnFGYIo/
8i4qvtLApvw6Oynpu3EJd6VpEOsTKyo7oJ7Cpqn1TKUNfCOiR703pmM4f4YUAkpj
RppTz2kml2iBHhS7oQKlaLRc/gukGwHx/3itIgDloEhKcf9i0vq/DFOaTE7v5cgD
6/WZRg1gLiNNuxg32nuDSUYpPCot5UiMzhAnJdFxHZKsrVRIVWvju19PqLc0SBel
laWgYOm5zcNxqkNpmMdPZ1zqZ1rK0Ssqf8Dsk2Wx8pYYnFAd1m67I3RKaIHtno+S
StemsvXjIlOrul5CL1pkX+ZqjvfyRy1q9K0/+WrlVY33RnFFOALZ97142c/QbZTk
m7aQH0hkwM35iGsa4eAetZwQn281PcSkdhCGrOVvDGEubVsGeknnuj3TsdPIJ4ug
CL3rV4I/nXpd6+a8XVa3K7oKtxMm6rcL7MWo8QWqiZWrmld49u+XZjEgw8Nt6wpz
CbXU159vk0954nRLLasK6ewUtpu9OSj18D6fgtc4K//Wk54Ft+Ew3TmTATPCBxFL
tSk2igly8d2RUWgFuUf+7KbRhJFs2sKbLeU06emKKFkBo1q00Dk=
=4AQT
-----END PGP SIGNATURE-----

--YOiJ9teSuunXYCPo--
