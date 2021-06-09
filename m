Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA3C3A0C2C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 08:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0GsM4R6Fz2yyv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 16:09:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=Yv4zdTTf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=Yv4zdTTf; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0Grs01DPz2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 16:09:00 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G0Grh1tDCz9sRf; Wed,  9 Jun 2021 16:08:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623218932;
 bh=zMBN5dUHeVSexpTWTBruELzP24ku4FDDcQkso9GAa2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yv4zdTTfZ4CMY+/g4dd3fFuZL2X05/zOYIdeBioEvckTFh5Cryrz+fBrQktzNyGs5
 t0B0+ruWT/N08bU4MmCKYjCqB4uxhWxu4KHPeErhxeCF370Z3eRYryrQWCwvdhXAQP
 hRpt6KJ/ByEBy+JFosg/b1/g8ftFRNvHl268kKKE=
Date: Wed, 9 Jun 2021 16:08:48 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc/mm/hash: Avoid multiple HPT resize-downs
 on memory hotunplug
Message-ID: <YMBa8Ms9rL795OdS@yekko>
References: <20210430143607.135005-1-leobras.c@gmail.com>
 <20210430143607.135005-4-leobras.c@gmail.com>
 <YL2sjKM7ByS0Xeko@yekko>
 <fa7a0e981a067445beb1ae01d53db932990717b7.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GYNQ/kifoVnYIDex"
Content-Disposition: inline
In-Reply-To: <fa7a0e981a067445beb1ae01d53db932990717b7.camel@gmail.com>
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
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--GYNQ/kifoVnYIDex
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 02:30:36AM -0300, Leonardo Br=E1s wrote:
> On Mon, 2021-06-07 at 15:20 +1000, David Gibson wrote:
> > On Fri, Apr 30, 2021 at 11:36:10AM -0300, Leonardo Bras wrote:
> > > During memory hotunplug, after each LMB is removed, the HPT may be
> > > resized-down if it would map a max of 4 times the current amount of
> > > memory.
> > > (2 shifts, due to introduced histeresis)
> > >=20
> > > It usually is not an issue, but it can take a lot of time if HPT
> > > resizing-down fails. This happens=A0 because resize-down failures
> > > usually repeat at each LMB removal, until there are no more bolted
> > > entries
> > > conflict, which can take a while to happen.
> > >=20
> > > This can be solved by doing a single HPT resize at the end of
> > > memory
> > > hotunplug, after all requested entries are removed.
> > >=20
> > > To make this happen, it's necessary to temporarily disable all HPT
> > > resize-downs before hotunplug, re-enable them after hotunplug ends,
> > > and then resize-down HPT to the current memory size.
> > >=20
> > > As an example, hotunplugging 256GB from a 385GB guest took 621s
> > > without
> > > this patch, and 100s after applied.
> > >=20
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> >=20
> > Hrm.=A0 This looks correct, but it seems overly complicated.
> >=20
> > AFAICT, the resize calls that this adds should in practice be the
> > *only* times we call resize, all the calls from the lower level code
> > should be suppressed.=A0
>=20
> That's correct.
>=20
> >  In which case can't we just remove those calls
> > entirely, and not deal with the clunky locking and exclusion here.
> > That should also remove the need for the 'shrinking' parameter in
> > 1/3.
>=20
>=20
> If I get your suggestion correctly, you suggest something like:
> 1 - Never calling resize_hpt_for_hotplug() in
> hash__remove_section_mapping(), thus not needing the srinking
> parameter.
> 2 - Functions in hotplug-memory.c that call dlpar_remove_lmb() would in
> fact call another function to do the batch resize_hpt_for_hotplug() for
> them

Basically, yes.

> If so, that assumes that no other function that currently calls
> resize_hpt_for_hotplug() under another path, or if they do, it does not
> need to actually resize the HPT.
>=20
> Is the above correct?
>=20
> There are some examples of functions that currently call
> resize_hpt_for_hotplug() by another path:
>=20
> add_memory_driver_managed
> 	virtio_mem_add_memory
> 	dev_dax_kmem_probe

Oh... virtio-mem.  I didn't think of that.


> reserve_additional_memory
> 	balloon_process
> 	add_ballooned_pages

AFAICT this comes from drivers/xen, and Xen has never been a thing on
POWER.

> __add_memory
> 	probe_store

So this is a sysfs triggered memory add.  If the user is doing this
manually, then I think it's reasonable for them to manually manage the
HPT size as well, which they can do through debugfs.  I think it might
also be used my drmgr under pHyp, but pHyp doesn't support HPT
resizing.

> __remove_memory
> 	pseries_remove_memblock

Huh, this one comes through OF_RECONFIG_DETACH_NODE.  I don't really
know when those happen, but I strongly suspect it's only under pHyp
again.

> remove_memory
> 	dev_dax_kmem_remove
> 	virtio_mem_remove_memory

virtio-mem again.

> memunmap_pages
> 	pci_p2pdma_add_resource
> 	virtio_fs_setup_dax

And virtio-fs in dax mode.  Didn't think of that either.


Ugh, yeah, I'm used to the world where the platform provides the only
way of hotplugging memory, but virtio-mem does indeed provide another
one, and we could indeed need to manage the HPT size based on that.
Drat, so moving all the HPT resizing handling up into
pseries/hotplug-memory.c won't work.

I still think we can simplify the communication between the stuff in
the pseries hotplug code and the actual hash resizing.  In your draft
there are kind of 3 ways the information is conveyed: the mutex
suppresses HPT shrinks, pre-growing past what we need prevents HPT
grows, and the 'shrinking' flag handles some edge cases.

I suggest instead a single flag that will suppress all the current
resizes.  Not sure it technically has to be an atomic mutex, but
that's probably the obvious safe choice.  Then have a "resize up to
target" and "resize down to target" that ignore that suppression and
are no-ops if the target is in the other direction.
Then you should be able to make the path for pseries hotplugs be:

	suppress other resizes

	resize up to target

	do the actual adds or removes

	resize down to target

	unsuppress other resizes


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GYNQ/kifoVnYIDex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDAWu4ACgkQbDjKyiDZ
s5IZdRAAwOwgZ6dYIpOLXDclhHx4Gzd2DLYRzlmZq5nOmbSRXRMSD0zcQ/lZtErI
Oq7WmfPqqYlRmeC54d8zJsjf8tserDB6en5ev04oeZmdmBE/OV9FNYaZLfE73Vfx
oCCWEHKNm9aBza1essJh5/chU3sQXbY5FuboQLzsPBnN27HeTj6hK9p2qqHW+LBm
CXn1bTiAuvg6ONKU8ZRhuqTvqM+OnLXCU8/Jllluc8Q2rdAYIDyGlyFxD28d0hgO
uo6LmVINS0woliRhcMIFg5uAobOd1bqcb1xoWyIsXLsWVwMbxVsmK6idCptuozOM
GAlVXP57yZl+aGDgsRJ081sJq7e1AxQv8hlA5v/SNUo53koJpKt7ZAXY7x8TCKVJ
HsJrLfNmzOYvbZb/J4DecTJwCtSXRH1RM4VZEEji0MNxBc0u8GkBikRpqY3SgpDg
dgjJrR0B810mBfPYfJc+jKqSwXGCFqsCDWJX5zjaqxsYKgyLip8zIHE1BjeoGrNu
si3m5uFji3Po7OYP98Tu1AR4FmyU1dR5cGTX65g6/5GQGN209brbQRf9tYYDT9iA
d2z9/rt/YhoOa9X6qJkEQM5t+BY+O/8PBLqtXkl9Z5kjSWylO8ln+aQ7ZbVlwNWc
KgQkhdXKU5GXoC5sU8OYFYVrj65Ksc7Ic+2RjxHLEVHxnUGlNDc=
=GVzq
-----END PGP SIGNATURE-----

--GYNQ/kifoVnYIDex--
