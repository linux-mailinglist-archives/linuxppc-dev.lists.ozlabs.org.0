Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC143B255A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 05:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9QNB6xYCz3cML
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=G2p/inYV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=G2p/inYV; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9QKx3FVMz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:17:24 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G9QKr4cZsz9srZ; Thu, 24 Jun 2021 13:17:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624504640;
 bh=nCddQKpIHGjqFeRTdanIYKY6vH9JEp+uDSf4CmNkwB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2p/inYVpSaJFHD7LYTZsSY30AwDV5ecBpEGSum4lbnDZMgyPnw/0n8OJIbuwlA0l
 cXzf9aABPZw9ESmeXHLXy9anNSSmJHbVW5s/trySA/wFAeU1NWbYaKfiZZx1GdNsM2
 MI16/11x81lCBYVd5y9+B325P4Ovm3AUH/9ijjbw=
Date: Thu, 24 Jun 2021 13:16:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 8/8] powerpc/papr_scm: Use FORM2 associativity details
Message-ID: <YNP49Vnwa3b+A2ox@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-9-aneesh.kumar@linux.ibm.com>
 <YMgkyfc4g+na5GJZ@yekko> <87czsnoejl.fsf@linux.ibm.com>
 <YMhKEJ9WSlapuSE6@yekko> <87a6nrobf6.fsf@linux.ibm.com>
 <YMr92K2gaidDHeqC@yekko>
 <f88ac56a-646b-7c9b-1d01-5db38dc2a789@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OkuiGtqI46g5nPNN"
Content-Disposition: inline
In-Reply-To: <f88ac56a-646b-7c9b-1d01-5db38dc2a789@linux.ibm.com>
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


--OkuiGtqI46g5nPNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 04:29:01PM +0530, Aneesh Kumar K.V wrote:
> On 6/17/21 1:16 PM, David Gibson wrote:
> > On Tue, Jun 15, 2021 at 12:35:17PM +0530, Aneesh Kumar K.V wrote:
> > > David Gibson <david@gibson.dropbear.id.au> writes:
> > >=20
> > > > On Tue, Jun 15, 2021 at 11:27:50AM +0530, Aneesh Kumar K.V wrote:
> > > > > David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> ...
>=20
> > > > It's weird to me that you'd want to consider them in different nodes
> > > > for those different purposes.
> > >=20
> > >=20
> > >     --------------------------------------
> > >    |                            NUMA node0 |
> > >    |    ProcA -----> MEMA                  |
> > >    |     |                                 |
> > >    |	|                                 |
> > >    |	-------------------> PMEMB        |
> > >    |                                       |
> > >     ---------------------------------------
> > >=20
> > >     ---------------------------------------
> > >    |                            NUMA node1 |
> > >    |                                       |
> > >    |    ProcB -------> MEMC                |
> > >    |	|                                 |
> > >    |	-------------------> PMEMD        |
> > >    |                                       |
> > >    |                                       |
> > >     ---------------------------------------
> > >=20
> > > For a topology like the above application running of ProcA wants to f=
ind out
> > > persistent memory mount local to its NUMA node. Hence when using it as
> > > pmem fsdax mount or devdax device we want PMEMB to have associativity
> > > of NUMA node0 and PMEMD to have associativity of NUMA node 1. But when
> > > we want to use it as memory using dax kmem driver, we want both PMEMB
> > > and PMEMD to appear as memory only NUMA node at a distance that is
> > > derived based on the latency of the media.
> >=20
> > I'm still not understanding why the latency we care about is different
> > in the two cases.  Can you give an example of when this would result
> > in different actual node assignments for the two different cases?
> >=20
>=20
> In the above example in order allow use of PMEMB and PMEMD as memory only
> NUMA nodes
> we need platform to represent them in its own domainID. Let's assume that
> platform assigned id 40 and 41 and hence both PMEMB and PMEMD will have
> associativity array like below
>=20
> { 4, 6, 0}  -> PROCA/MEMA
> { 4, 6, 40} -> PMEMB
> { 4, 6, 41} -> PMEMD
> { 4, 6, 1} ->  PROCB/MEMB
>=20
> When we want to use this device PMEMB and PMEMD as fsdax/devdax devices, =
we
> essentially look for the first nearest online node. Which means both PMEMB
> and PMEMD will appear as devices attached to node0. That is not ideal for
> for many applications.

Not if you actually look at the distance table which tells you that
PMEMB is closer to node0 and PMEMD is closer to node1.  That's exactly
what the distance table is for - making this information explicit,
rather than intuited from a confusing set of nested domains.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OkuiGtqI46g5nPNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDT+PUACgkQbDjKyiDZ
s5J5rg/+LUWsteC29TYTQTPkbFXTKDkRb9b48quGid1cSqrJPqRxwWNDcL5Ml+yc
0QqQnmLzAE6eSW3s68icKp3aV7vMUiRG+o0v1rPLsnpKSeR+rLWlmV06/TFXSPYR
ZdodWOEx0ES0Ish/ZtauI0KvZHhAuMUjt8c8wM4ryX8TI9+D5hqOdNzQTLRrzLXM
NRwdGyRtu3sCz0EhRIVzCNbd9dCJyWlSjL9o3SSLCXACFYz4rlXJgPVZlwRy/A6u
b3ZNKMnQ4VURABFA3jii1OlqRIHnQ/VaAcJSAXaS6/FnRKL658doyZfcsdSocUdW
VQYSihnJW5FCmIojU5QzgbvGcwQjCWoLb9EcZhhDtPxOBj/JlMihCm+ysYrRD/jQ
nWkU9RhC//ma2tRv8Xmqyn1nXPNdCPBlxSgYiVLNEH2KecJIPfLjylBDjeSltmwy
HKaWOO7eq4TfOkQrkYbridsGQfYYkgmsFum/lC9hnvNI8EiHVPQL5saNFbQs52O/
FvYGoA054yiNlCH15VOPCbfbTbbXbRzEdRLmyvMYd7c26pbmvlaKPD+pZCO9KSg3
JtBJMKadMlS6XWMmYPjurLxABMmkxb5dyFgYUGVpYgF30JmJIR/wCU8bKmbc6QA8
cac1TnyMDjlB5Mg9eV2xcaafFVOAm375n+bRKDqFhK8OQeLGMuU=
=dCuj
-----END PGP SIGNATURE-----

--OkuiGtqI46g5nPNN--
