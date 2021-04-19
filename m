Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17199363B13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 07:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNwbL04GTz3bTp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=p3cfQPwG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=p3cfQPwG; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNwZN3dqJz2ysp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 15:37:47 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNwZM15p1z9vFP; Mon, 19 Apr 2021 15:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618810667;
 bh=QTO/JmKonyWowSuB9ptog568D8fxSsKUTGolY+teoLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p3cfQPwGqHiIebmsm3t1zK9po09rMyOJ5XhAri8tMCywYbjZnmvwsuIVuS6H+RIe2
 ec0NJn6aE1DXx8vlI/TLncnMzVc99JPrQMXaeko5Dp8YpM4NgYEaIFq/R8di1Sl/eo
 FLo9evkxzsb7fftYNHnTGJVeQXQvF5/nIsmCfDOM=
Date: Mon, 19 Apr 2021 15:37:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/mm/hash: Avoid multiple HPT resize-downs on
 memory hotunplug
Message-ID: <YH0XJYKlBTFQz/4v@yekko.fritz.box>
References: <20210312072940.598696-1-leobras.c@gmail.com>
 <20210312072940.598696-4-leobras.c@gmail.com>
 <YFksMw8Hw/mC48yb@yekko.fritz.box>
 <418f044aab385389681529b0b6057e75825b0e5f.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cd90VBRJ04ikWx9V"
Content-Disposition: inline
In-Reply-To: <418f044aab385389681529b0b6057e75825b0e5f.camel@gmail.com>
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


--cd90VBRJ04ikWx9V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 12:31:03AM -0300, Leonardo Bras wrote:
> Hello David, thanks for commenting.
>=20
> On Tue, 2021-03-23 at 10:45 +1100, David Gibson wrote:
> > > @@ -805,6 +808,10 @@ static int resize_hpt_for_hotplug(unsigned long =
new_mem_size, bool shrinking)
> > > =A0	if (shrinking) {
> > >=20
> > > +		/* When batch removing entries, only resizes HPT at the end. */
> > > +		if (atomic_read_acquire(&hpt_resize_disable))
> > > +			return 0;
> > > +
> >=20
> > I'm not quite convinced by this locking.  Couldn't hpt_resize_disable
> > be set after this point, but while you're still inside
> > resize_hpt_for_hotplug()?  Probably better to use an explicit mutex
> > (and mutex_trylock()) to make the critical sections clearer.
>=20
> Sure, I can do that for v2.
>=20
> > Except... do we even need the fancy mechanics to suppress the resizes
> > in one place to do them elswhere.  Couldn't we just replace the
> > existing resize calls with the batched ones?
>=20
> How do you think of having batched resizes-down in HPT?

I think it's a good idea.  We still have to have the loop to resize
bigger if we can't fit everything into the smallest target size, but
that still only makes the worst case as bad at the always-case is
currently.

> Other than the current approach, I could only think of a way that would
> touch a lot of generic code, and/or duplicate some functions, as
> dlpar_add_lmb() does a lot of other stuff.
>=20
> > > +void hash_memory_batch_shrink_end(void)
> > > +{
> > > +	unsigned long newsize;
> > > +
> > > +	/* Re-enables HPT resize-down after hot-unplug */
> > > +	atomic_set_release(&hpt_resize_disable, 0);
> > > +
> > > +	newsize =3D memblock_phys_mem_size();
> > > +	/* Resize to smallest SHIFT possible */
> > > +	while (resize_hpt_for_hotplug(newsize, true) =3D=3D -ENOSPC) {
> > > +		newsize *=3D 2;
> >=20
> > As noted earlier, doing this without an explicit cap on the new hpt
> > size (of the existing size) this makes me nervous.=A0
> >=20
>=20
> I can add a stop in v2.
>=20
> >  Less so, but doing
> > the calculations on memory size, rather than explictly on HPT size /
> > HPT order also seems kinda clunky.
>=20
> Agree, but at this point, it would seem kind of a waste to find the
> shift from newsize, then calculate (1 << shift) for each retry of
> resize_hpt_for_hotplug() only to point that we are retrying the order
> value.

Yeah, I see your poiint.

>=20
> But sure, if you think it looks better, I can change that.=20
>=20
> > > +void memory_batch_shrink_begin(void)
> > > +{
> > > +	if (!radix_enabled())
> > > +		hash_memory_batch_shrink_begin();
> > > +}
> > > +
> > > +void memory_batch_shrink_end(void)
> > > +{
> > > +	if (!radix_enabled())
> > > +		hash_memory_batch_shrink_end();
> > > +}
> >=20
> > Again, these wrappers don't seem particularly useful to me.
>=20
> Options would be add 'if (!radix_enabled())' to hotplug-memory.c
> functions or to hash* functions, which look kind of wrong.

I think the if !radix_enabled in hotplug-memory.c isn't too bad, in
fact possibly helpful as a hint that this is HPT only logic.

>=20
> > > +	memory_batch_shrink_end();
> >=20
> > remove_by_index only removes a single LMB, so there's no real point to
> > batching here.
>=20
> Sure, will be fixed for v2.
>=20
> > > @@ -700,6 +712,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_=
add)
> > > =A0	if (lmbs_added !=3D lmbs_to_add) {
> > > =A0		pr_err("Memory hot-add failed, removing any added LMBs\n");
> > >=20
> > > +		memory_batch_shrink_begin();
> >=20
> >=20
> > The effect of these on the memory grow path is far from clear.
> >=20
>=20
> On hotplug, HPT is resized-up before adding LMBs.
> On hotunplug, HPT is resized-down after removing LMBs.
> And each one has it's own mechanism to batch HPT resizes...
>=20
> I can't understand exactly how using it on hotplug fail path can be any
> different than using it on hotunplug.
> >=20
>=20
> Can you please help me understanding this?
>=20
> Best regards,
> Leonardo Bras
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cd90VBRJ04ikWx9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9FyUACgkQbDjKyiDZ
s5Jd8hAAgYd5VNaWzqV/Ubm2ANlWLkjy5xitcPE1T0TgOc5cC0lhocQGs+l+Pa/f
Wf8GIzdddlJ61eS/SXSEPzVaw6cMAXfZ9SQ8XWOXOw/RGollDm8h4inGkWdnZ/o9
1P5VG4/F9lKzUtkEyqe9ztlqdy0bqmd1lts+BRfQSsEbuFUe8XSECpvM/COC7g85
w0EDiCGYYArIDNb/1tm3X2/glA89xmg0xt2Fv1d0uDrMDfDNhoR4Kx+UkvqPRbeO
S7/Y8Av9o8wlIUk+oojpUaJdHWeIsBvRfFYmEZsQw1nGIJQsUn0NC5XV6/36AZkr
lb2JPojicBDu/bsHixkQojtdxk8i+ibxPqco1CI3++Dhs+5GxHsxZkVnH1PC8cpW
7Oy/nK0VDSoGU5oxKlObv9eNCb9Wkepjkdtvl+6Bb1I/fJiklBivyVctGyC4enko
XOH7fGJ11jFUgtozJGqdpWT5IC1bfPn0T8Unuk5IFvlueBiD2LMx17y9yTNe+x3Y
30GBg1Yc78juzklG2YcH9dRuHzhiDUtXdW+RnSz5l6gjyUh0Ow40mW+ltcSd+P+H
NWzKtqvFzsws67JgE9b4BH29l0wxF0Y3qKZF1z+RL+mtrBQCJq54XTJNcuSHX/bL
TizB/SolcPju36R48/V4iVCLQ5T1cKusyomknNWtqwWhzaHRvMQ=
=OcHV
-----END PGP SIGNATURE-----

--cd90VBRJ04ikWx9V--
