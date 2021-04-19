Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86066363B0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 07:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNwZs2jZrz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:38:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=iMkY0Egh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=iMkY0Egh; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNwZN2PLCz2yYn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 15:37:47 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNwZM0kF9z9vFb; Mon, 19 Apr 2021 15:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618810667;
 bh=qpUO9S3O66BSu4YX34xr1pdZksoDkZkpJdUGiNd3Tgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMkY0EghaS/fiUSnxhrun3sGfCsC24otUo3gRcQMOjRb1uY8+uiqUmqQFdW00LwBE
 FVkGDc3ixEgX/RPwM1J+Va7DRn8DEJEcOPcUepW22yKdSzn5x/1qVii/6YWHXs9eYc
 eMDTVvsyQ0xdEFVX9YfQXerfDjl5fdRuHZhqHotY=
Date: Mon, 19 Apr 2021 15:34:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/mm/hash: Avoid multiple HPT resize-ups on
 memory hotplug
Message-ID: <YH0WYaXvGMf9YsWi@yekko.fritz.box>
References: <20210312072940.598696-1-leobras.c@gmail.com>
 <20210312072940.598696-3-leobras.c@gmail.com>
 <YFhNd42RvobCV8tF@yekko.fritz.box>
 <e5c924479839815c025de29d650d82419b18c0dc.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QWB28iAYYwWHvKxg"
Content-Disposition: inline
In-Reply-To: <e5c924479839815c025de29d650d82419b18c0dc.camel@gmail.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Scott Cheloha <cheloha@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Sandipan Das <sandipan@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Dan Williams <dan.j.williams@intel.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--QWB28iAYYwWHvKxg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 11:51:36PM -0300, Leonardo Bras wrote:
> Hello David, thanks for the feedback!
>=20
> On Mon, 2021-03-22 at 18:55 +1100, David Gibson wrote:
> > > +void hash_memory_batch_expand_prepare(unsigned long newsize)
> > > +{
> > > +	/*
> > > +	 * Resizing-up HPT should never fail, but there are some cases syst=
em starts with higher
> > > +	 * SHIFT than required, and we go through the funny case of resizin=
g HPT down while
> > > +	 * adding memory
> > > +	 */
> > > +
> > > +	while (resize_hpt_for_hotplug(newsize, false) =3D=3D -ENOSPC) {
> > > +		newsize *=3D 2;
> > > +		pr_warn("Hash collision while resizing HPT\n");
> >=20
> > This unbounded increase in newsize makes me nervous - we should be
> > bounded by the current size of the HPT at least.  In practice we
> > should be fine, since the resize should always succeed by the time we
> > reach our current HPT size, but that's far from obvious from this
> > point in the code.
>=20
> Sure, I will add bounds in v2.
>=20
> >=20
> > And... you're doubling newsize which is a value which might not be a
> > power of 2.  I'm wondering if there's an edge case where this could
> > actually cause us to skip the current size and erroneously resize to
> > one bigger than we have currently.
>=20
> I also though that at the start, but it seems quite reliable.
> Before using this value, htab_shift_for_mem_size() will always round it
> to next power of 2.=A0
> Ex.
> Any value between 0b0101 and 0b1000 will be rounded to 0b1000 for shift
> calculation. If we multiply it by 2 (same as << 1), we have that
> anything between 0b01010 and 0b10000 will be rounded to 0b10000.=20

Ah, good point.

> This works just fine as long as we are multiplying.=A0
> Division may have the behavior you expect, as 0b0101 >> 1 would become
> 0b010 and skip a shift.
> =09
> > > +void memory_batch_expand_prepare(unsigned long newsize)
> >=20
> > This wrapper doesn't seem useful.
>=20
> Yeah, it does little, but I can't just jump into hash_* functions
> directly from hotplug-memory.c, without even knowing if it's using hash
> pagetables. (in case the suggestion would be test for disable_radix
> inside hash_memory_batch*)
>=20
> >=20
> > > +{
> > > +	if (!radix_enabled())
> > > +		hash_memory_batch_expand_prepare(newsize);
> > > +}
> > > =A0#endif /* CONFIG_MEMORY_HOTPLUG */
> > > =A0
> > >=20
> > > +	memory_batch_expand_prepare(memblock_phys_mem_size() +
> > > +				     drmem_info->n_lmbs * drmem_lmb_size());
> >=20
> > This doesn't look right.  memory_add_by_index() is adding a *single*
> > LMB, I think using drmem_info->n_lmbs here means you're counting this
> > as adding again as much memory as you already have hotplugged.
>=20
> Yeah, my mistake. This makes sense.
> I will change it to something like=20
> memblock_phys_mem_size() + drmem_lmb_size()
>=20
> > >=20
> > > +	memory_batch_expand_prepare(memblock_phys_mem_size() + lmbs_to_add =
* drmem_lmb_size());
> > > +
> > > =A0	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> > > =A0		if (lmb->flags & DRCONF_MEM_ASSIGNED)
> > > =A0			continue;
> >=20
> > I don't see memory_batch_expand_prepare() suppressing any existing HPT
> > resizes.  Won't this just resize to the right size for the full add,
> > then resize several times again as we perform the add?  Or.. I guess
> > that will be suppressed by patch 1/3.=A0
>=20
> Correct.
>=20
> >  That's seems kinda fragile, though.
>=20
> What do you mean by fragile here?
> What would you suggest doing different?
>=20
> Best regards,
> Leonardo Bras
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QWB28iAYYwWHvKxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9FmEACgkQbDjKyiDZ
s5LB8w/+IiTNXicnDg25SlIXdFL+zxmS47BOOhuzopddRfEpfdtFSm+NNgX5MmLU
rSihXUQY56acJTKPlXhK7Zz2Ptf3CbZvlRQUAGFoS7kG1ZkakfwIS9cVFj/GCoE9
GmEBbfASv1u67sXzmWRDBzhyMKrfjJaKhIVgNKngm53pzBiMsQGNeTeYWRySoH9N
K3UTWkgRGX5/EHB5ezM/3V5dqZ+ugCm6iV7p6Frt7mcYN/YHlTwtO1oJHkPavaej
R2HULakqgKIZ0FjdDWq2JI2I4ZQSW4W+COFv53monMB2D0wFq2n9VtQMcCvU0bWN
RqfvLg3GGFK+3984hD/4/RaZDTC95NJ10o/OLfAG1fi+xfiT+vaOwUP1r+4EH5hC
BhjuOVYX7bbeCioSTCCGzoetk02A1irJM2ILMu4jMJLe9xTvjF7SeZo0Bv8f+qly
wO0KDiuCi3gyFG4XqJMIC/+IkvsNe06C/py9R7+8KWaCYcJ61rYCjlSn1calDDKV
aESXMsIGmNwQQrB/XZgxauYBM+p4u9pWpD0iuepEDervVtZrG4X8nhxZa1h1gHw5
FroXUmENas3fKNVuldk1J+hcNXI3T/1hPv7iTqm45miiG57f3YRjEl08ZzBhVijF
rDO/iaWTO6lUeNwgRRM0tFGzr6WItKzNZvGlpFrhiMgnysND2EA=
=uQtK
-----END PGP SIGNATURE-----

--QWB28iAYYwWHvKxg--
