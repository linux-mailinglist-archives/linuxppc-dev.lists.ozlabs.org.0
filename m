Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F043AB13F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 12:20:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5J3B3tfdz3c7W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 20:20:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=WFwpbmoP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=WFwpbmoP; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5J2B5CSkz30Fm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 20:19:30 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G5J282N6Gz9sT6; Thu, 17 Jun 2021 20:19:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623925168;
 bh=5NBVDDYSlt6hX+Mngmjbj7Cgm0bNBxR+APDmAEPrNTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WFwpbmoP8w8nSJhLRl0FP4vEdrz/yb2KZFoKgQBRo6FyZZ1HGEhDePdwqprTrWbLi
 TMxH79yrpyPwyOvtgtXuk1zK+AgcaCFn2lRgeKCA8XgZ/Qr0bz4jFNcORn0TqsTLEs
 jlDltyJ+98xYACyDdp6ZHJ9NyP1eq/1gUl/aAFQA=
Date: Thu, 17 Jun 2021 17:46:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
Message-ID: <YMr92K2gaidDHeqC@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko> <87czsnoejl.fsf@linux.ibm.com>
 <YMhKEJ9WSlapuSE6@yekko> <87a6nrobf6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5znoaPUYMGnnxiRe"
Content-Disposition: inline
In-Reply-To: <87a6nrobf6.fsf@linux.ibm.com>
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


--5znoaPUYMGnnxiRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
> >> David Gibson <david@gibson.dropbear.id.au> writes:
> >>=20
> >> > On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
> >> >> FORM2 introduce a concept of secondary domain which is identical to=
 the
> >> >> conceept of FORM1 primary domain. Use secondary domain as the numa =
node
> >> >> when using persistent memory device. For DAX kmem use the logical d=
omain
> >> >> id introduced in FORM2. This new numa node
> >> >>=20
> >> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> >> ---
> >> >>  arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++=
++++
> >> >>  arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++------=
--
> >> >>  arch/powerpc/platforms/pseries/pseries.h  |  1 +
> >> >>  3 files changed, 45 insertions(+), 10 deletions(-)
> >> >>=20
> >> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> >> >> index 86cd2af014f7..b9ac6d02e944 100644
> >> >> --- a/arch/powerpc/mm/numa.c
> >> >> +++ b/arch/powerpc/mm/numa.c
> >> >> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *=
associativity)
> >> >>  	return nid;
> >> >>  }
> >> >> =20
> >> >> +int get_primary_and_secondary_domain(struct device_node *node, int=
 *primary, int *secondary)
> >> >> +{
> >> >> +	int secondary_index;
> >> >> +	const __be32 *associativity;
> >> >> +
> >> >> +	if (!numa_enabled) {
> >> >> +		*primary =3D NUMA_NO_NODE;
> >> >> +		*secondary =3D NUMA_NO_NODE;
> >> >> +		return 0;
> >> >> +	}
> >> >> +
> >> >> +	associativity =3D of_get_associativity(node);
> >> >> +	if (!associativity)
> >> >> +		return -ENODEV;
> >> >> +
> >> >> +	if (of_read_number(associativity, 1) >=3D primary_domain_index) {
> >> >> +		*primary =3D of_read_number(&associativity[primary_domain_index]=
, 1);
> >> >> +		secondary_index =3D of_read_number(&distance_ref_points[1], 1);
> >> >
> >> > Secondary ID is always the second reference point, but primary depen=
ds
> >> > on the length of resources?  That seems very weird.
> >>=20
> >> primary_domain_index is distance_ref_point[0]. With Form2 we would find
> >> both primary and secondary domain ID same for all resources other than
> >> persistent memory device. The usage w.r.t. persistent memory is
> >> explained in patch 7.
> >
> > Right, I misunderstood
> >
> >>=20
> >> With Form2 the primary domainID and secondary domainID are used to ide=
ntify the NUMA nodes
> >> the kernel should use when using persistent memory devices.
> >
> > This seems kind of bogus.  With Form1, the primary/secondary ID are a
> > sort of heirarchy of distance (things with same primary ID are very
> > close, things with same secondary are kinda-close, etc.).  With Form2,
> > it's referring to their effective node for different purposes.
> >
> > Using the same terms for different meanings seems unnecessarily
> > confusing.
>=20
> They are essentially domainIDs. The interpretation of them are different
> between Form1 and Form2. Hence I kept referring to them as primary and
> secondary domainID. Any suggestion on what to name them with Form2?

My point is that reusing associativity-reference-points for something
with completely unrelated semantics seems like a very poor choice.

> >> Persistent memory devices
> >> can also be used as regular memory using DAX KMEM driver and primary d=
omainID indicates
> >> the numa node number OS should use when using these devices as regular=
 memory. Secondary
> >> domainID is the numa node number that should be used when using this d=
evice as
> >> persistent memory.
> >
> > It's weird to me that you'd want to consider them in different nodes
> > for those different purposes.
>=20
>=20
>    --------------------------------------
>   |                            NUMA node0 |
>   |    ProcA -----> MEMA                  |
>   |     |                                 |
>   |	|                                 |
>   |	-------------------> PMEMB        |
>   |                                       |
>    ---------------------------------------
>=20
>    ---------------------------------------
>   |                            NUMA node1 |
>   |                                       |
>   |    ProcB -------> MEMC                |
>   |	|                                 |
>   |	-------------------> PMEMD        |
>   |                                       |
>   |                                       |
>    ---------------------------------------
> =20
>=20
> For a topology like the above application running of ProcA wants to find =
out
> persistent memory mount local to its NUMA node. Hence when using it as
> pmem fsdax mount or devdax device we want PMEMB to have associativity
> of NUMA node0 and PMEMD to have associativity of NUMA node 1. But when
> we want to use it as memory using dax kmem driver, we want both PMEMB
> and PMEMD to appear as memory only NUMA node at a distance that is
> derived based on the latency of the media.

I'm still not understanding why the latency we care about is different
in the two cases.  Can you give an example of when this would result
in different actual node assignments for the two different cases?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5znoaPUYMGnnxiRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDK/dYACgkQbDjKyiDZ
s5J/DBAAmVqws8hBmu9XcecG8WAkbkxOtTah9GO8AL9pv/3Ptx5HZNFzV6FdS/aK
1SUk65hDw3OvUanwoXgaj4n66g0awGclG+jEuiEgsOPvK0rWKuTCa/OU944wjdhY
JiCrdlRlD5lfwjwQPRG7likyG1aJ7XyNpeDn0ynqk3yN3LZbnwZaJ4bf0pCg7ElT
dYX9PyLIHhJwo92DB1HgztECxn4clEOKdqyoAPx/MeTsuHhe3AzdVaBVIx/YfJ1i
UuOLhDaBslEPw91BgdEyg4REKVbDcfwHqr0IK2mxJo3DHnTHJH6aKZ1Ihhb0lpVw
5ZN2fTcIJE4PBCsDKMMUcjF5ULqIcKpQ/esXjHyPe+8Mdfk3CB0/RyRnGB5TH7RY
AQHiDtQxkkjYzq7JSL3HeLW7SImeEuWYgR2IfXVlUj7ySz/52khVlxN7x4KP2+c/
/cSf8i+/587UvMWNNE7kw6YmcNRiEqboftcvEYFxV9BN4NttyXn6cIuXcoEsNRnJ
IpW9FKaQxDIWATiVIxKcYPhwgB3QEazZT+TIy7XZWZwe0FQpjrNrenUfcLYC6E06
Ipkwu2dTIika3x0i33K0j0NzK1vJMV5WV+bZjzwyTf6IPO/DTkD669OeCm0G2Qkq
S9rIsvz7Jraq5F/wmxZZQp8yoAG2/vUrWEDF4IVdNX1MnfUn2P0=
=pf+J
-----END PGP SIGNATURE-----

--5znoaPUYMGnnxiRe--
