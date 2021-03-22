Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A881E343855
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 06:25:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3jcV0d0Qz301M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:24:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=KRNu2jb9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=KRNu2jb9; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3jc245Tmz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 16:24:33 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3jc10vTKz9sVS; Mon, 22 Mar 2021 16:24:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616390673;
 bh=VmntQM0bUJEv9iglvyXrces4GlDbVzNrigbUfQujlEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KRNu2jb9CpEkhdsaEFst1w4kg7Ymx4IdDzaSgTtUtqOfoR6pEotXusPWdsn1KVvje
 rxQqNlKwfx39cMMsm1n+9XfPFwLeq04rm+o/gEy+eE1FGPzZGaIEXOEO8Y+7sVQNu7
 T9bdcvPoqZPY6BQzwZKw19LGwZr2xHInhRzC7s9w=
Date: Mon, 22 Mar 2021 16:19:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
Message-ID: <YFgo26FoqgM5+eHc@yekko.fritz.box>
References: <20210316122437.3571843-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uQnH2xl3pk102oI/"
Content-Disposition: inline
In-Reply-To: <20210316122437.3571843-1-clg@kaod.org>
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--uQnH2xl3pk102oI/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:24:37PM +0100, C=E9dric Le Goater wrote:
> The topology-id of a CPU in a pSeries machine can be queried from
> sysfs but under PowerVM the value is always -1 even if NUMA nodes are
> defined. This is because the topology_physical_package_id() routine is
> using the "ibm,chip-id" property which is not specified in PAPR.
>=20
> Under QEMU/KVM, things are different because QEMU populates the CPU DT
> node with "ibm,chip-id" property. However, its value can be incorrect
> for uncommon SMT configuration and expose a bogus topology-id value in
> sysfs.

Incorrect in what sense?  It's still indicating the (admittedly
arbitrary) qemu socket number, isn't it?  And isn't that what it
should be?

> The use of cpu_to_node() guarantees to have a correct NUMA node id
> under both environments QEMU/KVM and PowerVM. This introduces a slight
> change for the QEMU/KVM guest, as the topology-id now matches the NUMA
> node and not the socket-id as before. Since QEMU also needs to remove
> "ibm,chip-id" property for the DT to follow the PAPR specs, both
> hypervisor environments will be in sync.
>=20
> On the PowerNV side, the NUMA node id returned by cpu_to_node() is
> computed from the "ibm,associativity" property of the CPU. Its value
> is built from the OPAL chip id and is equivalent to "ibm,chip-id".

Like mpe, I'm not convinced this is the right approach.  "physical
packate" and NUMA node are not the same thing, except sometimes by
accident.

>=20
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/a=
sm/topology.h
> index 3beeb030cd78..887c42a4e43d 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>  #ifdef CONFIG_PPC64
>  #include <asm/smp.h>
> =20
> -#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
> +#define topology_physical_package_id(cpu)	(cpu_to_node(cpu))
> =20
>  #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>  #define topology_core_cpumask(cpu)	(cpu_cpu_mask(cpu))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--uQnH2xl3pk102oI/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYKNsACgkQbDjKyiDZ
s5K0bhAA2/r52dWvK0gZuMlAzcFr71G2iwcgjvzpvfsr2MpeuUSeBnWiRRuwTUrS
TBLnXlEtCKlwbGi9sUBOGOg+l3vxEDhyjX8neABbbm9LR9PF63lseduWP6ZhPm55
PMiC8Ks0AyJPFYbY4BOul3W/r8kNoxm9lqzMj6uKdS/KEbIXGKjTV2JIgOYHPkfO
v12khi9FROeYmX2RmzVv/K2DL1FTm99hlcZYYrwHfUCp/ihmmN0iiM1VuL3I/qy7
oaoYz0uVu0CNO4HkWvKfNZYVOXJZpDdtDtQW49pFCUyYyLNmPvW8mkyrH8uqilFJ
10Ck154aaxyASNzM3njwqqWeIXZR3Et3fbATz+EUWtdKe6qG9BJVvymqkGIOGnlu
YJ3DOUJXmRNqma6Xdnty0+J/xAuvSDS+umQsv18rbtCM6FyoZxRRranEavjlDGxr
OuolDel9qxyDP07ayMVRvPIdNVUcHh3a7XqUsG1hOEta6yphCKg5YsxX+iZYaZkF
cVSnJkQ3SmqXJwNhW9PFszq2PkPCQKdOUrb9dpJ/6hvgyFpyBndz4bX86uQQAbl0
SjZKLPXfwNeua66aC9mkmKU31IkiogHGhPeMsexP+pQlkDoxlldOLFCSjEV7BYOq
BaROoGoDPMPYBSz9NxmyEcxrQ5Tu3NzptQm5RedzwvmOyqDYbTg=
=PHrJ
-----END PGP SIGNATURE-----

--uQnH2xl3pk102oI/--
