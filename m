Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB433A7721
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3z8k6Y6Vz3bsK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:35:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=HRJbjw/3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=HRJbjw/3; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3z8D5ClVz301q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:35:08 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3z864BGzz9sW7; Tue, 15 Jun 2021 16:35:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623738902;
 bh=JDZVG8B9YsgID5c8STdiDJBrFz4SghGb5vTtr91v6GU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HRJbjw/3xtXLGeLSPS9a9p9tje0oOJp/GDfqk5V84TdVSV0/e5Nj+TfLMb8fBG+4e
 Vh8ypnsFKFjr3Nqo6hBL5OqFwKOno1/Y7b3YpwLYjE41m8f9/jaCX76DgNK1+Fnf/+
 emlXTB8dzckiYfi+g2OMea2VWZDxzwha/fSyk8jY=
Date: Tue, 15 Jun 2021 16:34:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
Message-ID: <YMhKEJ9WSlapuSE6@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko> <87czsnoejl.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6g8/Cn5V6W5N3eKK"
Content-Disposition: inline
In-Reply-To: <87czsnoejl.fsf@linux.ibm.com>
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


--6g8/Cn5V6W5N3eKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Jun 14, 2021 at 10:10:03PM +0530, Aneesh Kumar K.V wrote:
> >> FORM2 introduce a concept of secondary domain which is identical to the
> >> conceept of FORM1 primary domain. Use secondary domain as the numa node
> >> when using persistent memory device. For DAX kmem use the logical doma=
in
> >> id introduced in FORM2. This new numa node
> >>=20
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  arch/powerpc/mm/numa.c                    | 28 +++++++++++++++++++++++
> >>  arch/powerpc/platforms/pseries/papr_scm.c | 26 +++++++++++++--------
> >>  arch/powerpc/platforms/pseries/pseries.h  |  1 +
> >>  3 files changed, 45 insertions(+), 10 deletions(-)
> >>=20
> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> >> index 86cd2af014f7..b9ac6d02e944 100644
> >> --- a/arch/powerpc/mm/numa.c
> >> +++ b/arch/powerpc/mm/numa.c
> >> @@ -265,6 +265,34 @@ static int associativity_to_nid(const __be32 *ass=
ociativity)
> >>  	return nid;
> >>  }
> >> =20
> >> +int get_primary_and_secondary_domain(struct device_node *node, int *p=
rimary, int *secondary)
> >> +{
> >> +	int secondary_index;
> >> +	const __be32 *associativity;
> >> +
> >> +	if (!numa_enabled) {
> >> +		*primary =3D NUMA_NO_NODE;
> >> +		*secondary =3D NUMA_NO_NODE;
> >> +		return 0;
> >> +	}
> >> +
> >> +	associativity =3D of_get_associativity(node);
> >> +	if (!associativity)
> >> +		return -ENODEV;
> >> +
> >> +	if (of_read_number(associativity, 1) >=3D primary_domain_index) {
> >> +		*primary =3D of_read_number(&associativity[primary_domain_index], 1=
);
> >> +		secondary_index =3D of_read_number(&distance_ref_points[1], 1);
> >
> > Secondary ID is always the second reference point, but primary depends
> > on the length of resources?  That seems very weird.
>=20
> primary_domain_index is distance_ref_point[0]. With Form2 we would find
> both primary and secondary domain ID same for all resources other than
> persistent memory device. The usage w.r.t. persistent memory is
> explained in patch 7.

Right, I misunderstood

>=20
> With Form2 the primary domainID and secondary domainID are used to identi=
fy the NUMA nodes
> the kernel should use when using persistent memory devices.

This seems kind of bogus.  With Form1, the primary/secondary ID are a
sort of heirarchy of distance (things with same primary ID are very
close, things with same secondary are kinda-close, etc.).  With Form2,
it's referring to their effective node for different purposes.

Using the same terms for different meanings seems unnecessarily
confusing.

> Persistent memory devices
> can also be used as regular memory using DAX KMEM driver and primary doma=
inID indicates
> the numa node number OS should use when using these devices as regular me=
mory. Secondary
> domainID is the numa node number that should be used when using this devi=
ce as
> persistent memory.

It's weird to me that you'd want to consider them in different nodes
for those different purposes.

> In the later case, we are interested in the locality of the
> device to an established numa node. In the above example, if the last row=
 represents a
> persistent memory device/resource, NUMA node number 40 will be used when =
using the device
> as regular memory and NUMA node number 0 will be the device numa node whe=
n using it as
> a persistent memory device.

I don't really get what you mean by "locality of the device to an
established numa node".  Or at least how that's different from
anything else we're handling here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6g8/Cn5V6W5N3eKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIShAACgkQbDjKyiDZ
s5KvQA/9ESXmna3ZpU5VgL0Q0aClyE78Co+xlWnA0TbZigFo4mhxX+8Cu8m4cj1l
ZSWCAkbxkDtVBPGPe4JMdKTKVf1rd9zN0VWqY+a3ZmnOg0JD8qSUzeeBSPUNCEJ6
HYy+2zEXjzTsMtQQ9oxw7EDcErTpXoVSvir5NFyleINRVgbxLeTTv4KT7VHoNj1o
fZ1HijtA2fQZokv4B6LLGsY3wZZfjTAalXR35LRF2rxEZyluHO53nD6/A9W/S6MS
NXnFSMTax4czX/ggNXKkjO2BvIs5k4b/JvztLEweekXCf2fGnf4/eD9g88qCqqkH
nFSA8PfLhpLCYm58B/CLFXw/QemCShnqvqeiWVp9Eam31Cp3oxyQ2PE0NrNHes4v
nLxkkGqQbxLpOsy1zBicnkIAnMAcCy+tvbO9vb4xQJtJDPhWOJZn2b/e52pJdoS2
1SxfxLw2ndKJJ0R9b+HQa+MeD1vU4/U+pWjB8PDEhP5Dsi2NG5C0hxfFQSClPDqc
tb8pEgMWBp9stcZbXA7pDB/0S3hZSmp7rnr7Q5Yd5B0AuqG9g1LWMcd2Zrvar7rR
m4JeoBV7CQwRtRNE1dGDwoM1gUdrnQASbjuUYhv75Z0JoBuBy0A305S1qQQU1a2n
aibEPyH6CLbnXujKReT+p35Agw2KM6C4MPw/iXQUlrKP6tVl0v0=
=wTLI
-----END PGP SIGNATURE-----

--6g8/Cn5V6W5N3eKK--
