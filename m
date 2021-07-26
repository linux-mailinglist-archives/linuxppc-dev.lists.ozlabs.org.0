Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A09D3D5155
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 04:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY42l0Lxbz3bmQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 12:42:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=OxlPmKE4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=OxlPmKE4; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY41y6yNgz30C7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 12:41:42 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GY41s4dCKz9snk; Mon, 26 Jul 2021 12:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627267297;
 bh=JcVe+rz8EKkOVZhUp3Iu4IUwLE92GNBZvoDgjeJZ+Z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxlPmKE4TerqsvoTk/f03nHAK+0QDlLc3vTyJ/LCmqAVwaevV4msyl5hy2qIXyzz+
 xTan3dlnfKprJ7C2cBLBNexO43or703RJDFnggHQWgAmCPRg56XUiQFmdl3QDbleN7
 01uRyM7/OoSiRtN4ln0xb6JKd10stDgZhONJhloo=
Date: Mon, 26 Jul 2021 12:38:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 5/6] powerpc/pseries: Add a helper for form1 cpu
 distance
Message-ID: <YP4gLx6JFMFk38GP@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-6-aneesh.kumar@linux.ibm.com>
 <YPjM/5/KdKs4MNj1@yekko> <87wnpiu8ns.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bWKlhv6IpgIdiu/M"
Content-Disposition: inline
In-Reply-To: <87wnpiu8ns.fsf@linux.ibm.com>
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


--bWKlhv6IpgIdiu/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 12:39:27PM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Jun 28, 2021 at 08:41:16PM +0530, Aneesh Kumar K.V wrote:
> >> This helper is only used with the dispatch trace log collection.
> >> A later patch will add Form2 affinity support and this change helps
> >> in keeping that simpler. Also add a comment explaining we don't expect
> >> the code to be called with FORM0
> >>=20
> >> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >
> > What makes it a "relative_distance" rather than just a "distance"?
>=20
> I added that to indicate that the function is not returning the actual
> distance but a number indicative of 'near', 'far' etc. (it actually retur=
ns
> 1, 2 etc).

Hm... ok.  To me at least it doesn't really convey that meaning, but
then I'm not sure what would.  To be "relative distance" means the
distance relative to some other object, but then all the NUMA
distances are that - the distance of one node relative to another.

> >> ---
> >>  arch/powerpc/include/asm/topology.h   |  4 ++--
> >>  arch/powerpc/mm/numa.c                | 10 +++++++++-
> >>  arch/powerpc/platforms/pseries/lpar.c |  4 ++--
> >>  3 files changed, 13 insertions(+), 5 deletions(-)
> >>=20
> >> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/includ=
e/asm/topology.h
> >> index e4db64c0e184..ac8b5ed79832 100644
> >> --- a/arch/powerpc/include/asm/topology.h
> >> +++ b/arch/powerpc/include/asm/topology.h
> >> @@ -36,7 +36,7 @@ static inline int pcibus_to_node(struct pci_bus *bus)
> >>  				 cpu_all_mask :				\
> >>  				 cpumask_of_node(pcibus_to_node(bus)))
> >> =20
> >> -extern int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
> >> +int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
> >>  extern int __node_distance(int, int);
> >>  #define node_distance(a, b) __node_distance(a, b)
> >> =20
> >> @@ -83,7 +83,7 @@ static inline void sysfs_remove_device_from_node(str=
uct device *dev,
> >> =20
> >>  static inline void update_numa_cpu_lookup_table(unsigned int cpu, int=
 node) {}
> >> =20
> >> -static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> >> +static inline int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *c=
pu2_assoc)
> >>  {
> >>  	return 0;
> >>  }
> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> >> index 7b142f79d600..c6293037a103 100644
> >> --- a/arch/powerpc/mm/numa.c
> >> +++ b/arch/powerpc/mm/numa.c
> >> @@ -166,7 +166,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
> >>  }
> >>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> >> =20
> >> -int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> >> +static int __cpu_form1_relative_distance(__be32 *cpu1_assoc, __be32 *=
cpu2_assoc)
> >>  {
> >>  	int dist =3D 0;
> >> =20
> >> @@ -182,6 +182,14 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2=
_assoc)
> >>  	return dist;
> >>  }
> >> =20
> >> +int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> >> +{
> >> +	/* We should not get called with FORM0 */
> >> +	VM_WARN_ON(affinity_form =3D=3D FORM0_AFFINITY);
> >> +
> >> +	return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
> >> +}
> >> +
> >>  /* must hold reference to node during call */
> >>  static const __be32 *of_get_associativity(struct device_node *dev)
> >>  {
> >> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/plat=
forms/pseries/lpar.c
> >> index dab356e3ff87..afefbdfe768d 100644
> >> --- a/arch/powerpc/platforms/pseries/lpar.c
> >> +++ b/arch/powerpc/platforms/pseries/lpar.c
> >> @@ -261,7 +261,7 @@ static int cpu_relative_dispatch_distance(int last=
_disp_cpu, int cur_disp_cpu)
> >>  	if (!last_disp_cpu_assoc || !cur_disp_cpu_assoc)
> >>  		return -EIO;
> >> =20
> >> -	return cpu_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
> >> +	return cpu_relative_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc=
);
> >>  }
> >> =20
> >>  static int cpu_home_node_dispatch_distance(int disp_cpu)
> >> @@ -281,7 +281,7 @@ static int cpu_home_node_dispatch_distance(int dis=
p_cpu)
> >>  	if (!disp_cpu_assoc || !vcpu_assoc)
> >>  		return -EIO;
> >> =20
> >> -	return cpu_distance(disp_cpu_assoc, vcpu_assoc);
> >> +	return cpu_relative_distance(disp_cpu_assoc, vcpu_assoc);
> >>  }
> >> =20
> >>  static void update_vcpu_disp_stat(int disp_cpu)
> >
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bWKlhv6IpgIdiu/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD+IC8ACgkQbDjKyiDZ
s5IOlg/5AWzH8uYFh+/F6Ial8t78iFUsa+cm2Tby1UhlUdk5GdLsko3AhZUEGvMF
/bNMRdAzeqDNkLWk6ogYD5O9M7e2R8nRfr5bgj3E03BjtLp0wrDODZFrjSFKPO+S
tegnAy1IPTb1AbdUg4Wb2iq1kBlh9hEM34zRG6dLcwj7H5db9x7EG6bEZnt+NLkv
eSJkohVUMKqZpIuOW/6+JfyewWnJBlOTv3wOemGrwjWvBLGmEBsdLIehK9fuVXux
s5mO0EGUt9HDDTuzuSZPA3LklI8GQAhdbA3haJaLSSSt2Vwj7h7BWPOpZXLvgQM8
3+AsCfMemmarzN6q88elb/MidWUvP8NazIV6C1v/94M0VUSnpOnGQTaO0mG9EuNa
ycnxrHy3bEfswa/9pB6CD6Rd/YqDB3GGPxouuZY3T2zkbp0u9Ev05AIFXTy1Ft+v
6q1j4Usw2LVIhCV9/lrBhzkC2Sx1lZ+9BW0+Kmc22d2i9tRB8p4DqESGSjUyFN6d
kVNWsfQaNslRsOf1U2PSIQAuoU+yYZiGJ0zu5zdoWHvUCpdY6URLcgE0WgfinEyQ
tazzr+iEAByOEGTcHontiV54tNL41oaCZLIr8AZa/DccdBqMEnvUaEN45O3bfeuo
AYhYBFzASKMKbarPZR7MDzHFem5uO6fz9/z0N5ZbKJ80GcI2lYo=
=OXk4
-----END PGP SIGNATURE-----

--bWKlhv6IpgIdiu/M--
