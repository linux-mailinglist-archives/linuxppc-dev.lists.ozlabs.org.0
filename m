Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054C936399B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 05:08:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNsGB5jy4z3c0k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 13:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=gqxOC5yy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=gqxOC5yy; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNsFL6Wcwz30RG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 13:07:50 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNsFD5Mhpz9vGP; Mon, 19 Apr 2021 13:07:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618801664;
 bh=D4aFOk9iIBTmEBLZ9tpdnV9/EcjrL9FXbggNofbOtfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gqxOC5yyedj5NetDVbTSYnQYg6v6pzgCsmXLUaGCtn6jq3MEERZBx823awFX48ZLb
 SGTsGqmhdwq/r9Gro06WTkLFalsC3ydoyNTeFyaUGjSv7uUwy3thUO5uzr/XghBhhH
 QIuebsKwQTFrRd/5VAkbQlBdgLT2uCZvt5RiA0mU=
Date: Mon, 19 Apr 2021 11:19:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/smp: Cache CPU to chip lookup
Message-ID: <YHzaqqYDRtTuVEdH@yekko.fritz.box>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-4-srikar@linux.vnet.ibm.com>
 <20210415171921.GB16351@in.ibm.com>
 <20210415175110.GE2633526@linux.vnet.ibm.com>
 <20210416155748.GA26496@in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NARE3flw2kjIKyVm"
Content-Disposition: inline
In-Reply-To: <20210416155748.GA26496@in.ibm.com>
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
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--NARE3flw2kjIKyVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 09:27:48PM +0530, Gautham R Shenoy wrote:
> On Thu, Apr 15, 2021 at 11:21:10PM +0530, Srikar Dronamraju wrote:
> > * Gautham R Shenoy <ego@linux.vnet.ibm.com> [2021-04-15 22:49:21]:
> >=20
> > > >=20
> > > > +int *chip_id_lookup_table;
> > > > +
> > > >  #ifdef CONFIG_PPC64
> > > >  int __initdata iommu_is_off;
> > > >  int __initdata iommu_force_on;
> > > > @@ -914,13 +916,22 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
> > > >  int cpu_to_chip_id(int cpu)
> > > >  {
> > > >  	struct device_node *np;
> > > > +	int ret =3D -1, idx;
> > > > +
> > > > +	idx =3D cpu / threads_per_core;
> > > > +	if (chip_id_lookup_table && chip_id_lookup_table[idx] !=3D -1)
> > >=20
> >=20
> > > The value -1 is ambiguous since we won't be able to determine if
> > > it is because we haven't yet made a of_get_ibm_chip_id() call
> > > or if of_get_ibm_chip_id() call was made and it returned a -1.
> > >=20
> >=20
> > We don't allocate chip_id_lookup_table unless cpu_to_chip_id() return
> > !-1 value for the boot-cpuid. So this ensures that we dont
> > unnecessarily allocate chip_id_lookup_table. Also I check for
> > chip_id_lookup_table before calling cpu_to_chip_id() for other CPUs.
> > So this avoids overhead of calling cpu_to_chip_id() for platforms that
> > dont support it.  Also its most likely that if the
> > chip_id_lookup_table is initialized then of_get_ibm_chip_id() call
> > would return a valid value.
> >=20
> > + Below we are only populating the lookup table, only when the
> > of_get_cpu_node is valid.
> >=20
> > So I dont see any drawbacks of initializing it to -1. Do you see
> any?
>=20
>=20
> Only if other callers of cpu_to_chip_id() don't check for whether the
> chip_id_lookup_table() has been allocated or not. From a code
> readability point of view, it is easier to have that check  this inside
> cpu_to_chip_id() instead of requiring all its callers to make that
> check.

Even if they do, and the bad invalid value should never be read, I
think it's worth initializing that way.  If means if there's a mistake
and we do accidentally read the value, then the error is likely to be
much clearer.  Likewise if someone looks at this value from a
debugger, it will be clearer what's going on.

>=20
> >=20
> > > Thus, perhaps we can initialize chip_id_lookup_table[idx] with a
> > > different unique negative value. How about S32_MIN ? and check
> > > chip_id_lookup_table[idx] is different here ?
> > >=20
> >=20
> > I had initially initialized to -2, But then I thought we adding in
> > more confusion than necessary and it was not solving any issues.
> >=20
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NARE3flw2kjIKyVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB82qkACgkQbDjKyiDZ
s5LBiA//XZbMczDNargTsR+q7EcnrqGSZkt+mK8XB7f6mY9aoBm/vZQBt6UDx8sh
B1xI+/mPzbNpg6OAtbqzxAMe4bXwbm1TYtxQLQ+h0+1p1dlRdNdSHyMHpSFhMLj5
CafDuAe+uTFH4i6tXTm4oZq7VUqzn/KVb6i6mV/hIk9NJJLc1exhShJ/5eMc0HjQ
2tQTeEclZQKv180jh7MwFsn/pfhegn+pUbydhZJCVTpmGwfjExQDIajO7M76cMZH
9nHfz5Hnud2bgsDKC1b3sydIn+Hg9B9ju+GatV4nxrrbL6+DWGITbxfTi5TFLfPj
AgsVgmO1lWRU6ZJ5VOqqav7IV5BlZxRQU7th3gpCn892sFAhSNUqUseAJ3h8EOD4
fFJUw0NnepMEGEKvDPO8BnCkHE1R8pus+klmGjnVlGKyHwpd3FSpeZ/LjCCAZ7rN
BFZPjuGfSN9I0d9gqiX60g5DyrsvvxhgU/Trn5xefFFRjHd/A3wO5b6FJNFP8EEB
736DKBiWEryQ5J5H0f2b2dpmLC2yv3PjmpLNYScimImdWgtKAkZqMWurSsTwEfui
zpE+LwEmGzPG3OAl1xlBtn9MyuR60ULSfG+lwRI2DF71aIKzT0lsNPcXZU/ej1nU
R68cClaJ6rO+K6Gu//sYUDPFjCND7rA8saw8JO9ijf4TiNwBCaQ=
=Ddir
-----END PGP SIGNATURE-----

--NARE3flw2kjIKyVm--
