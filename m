Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 025B23A0BC7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:19:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0FlJ3grLz3bs8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 15:19:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=YiKkOry+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=YiKkOry+; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0Fkq0q7Gz2xvB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 15:18:42 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G0Fkm3LzRz9sSn; Wed,  9 Jun 2021 15:18:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623215920;
 bh=I2R81KysSK5UMKwKNmC/z1RaD1s+FY3px1l0EvD/X3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YiKkOry+fjLpYXVtDn+f+MROuDDfsmnSSteQ2BUjXqkkw9CVfOKckgZrE8pxnQoTi
 8G8m9Pdd5a8tHORJV/UsQWhDg7ORlqkr6Kx7erPLic8wrq9dlqw6znhIhXWaC90CRf
 YAvxFipYjrlSblqIwc12wzjF99NwEiAXiqSD4Law=
Date: Wed, 9 Jun 2021 14:40:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/mm/hash: Avoid resizing-down HPT on first
 memory hotplug
Message-ID: <YMBGW3RQOzoQxBqy@yekko>
References: <20210430143607.135005-1-leobras.c@gmail.com>
 <20210430143607.135005-2-leobras.c@gmail.com>
 <YL2obsnp4rWbW6CV@yekko>
 <648b382159009c5f4277d9b9c3f896142ea75d6c.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JIXKiScEiqVqxi4e"
Content-Disposition: inline
In-Reply-To: <648b382159009c5f4277d9b9c3f896142ea75d6c.camel@gmail.com>
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


--JIXKiScEiqVqxi4e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 09:52:10PM -0300, Leonardo Br=E1s wrote:
> On Mon, 2021-06-07 at 15:02 +1000, David Gibson wrote:
> > On Fri, Apr 30, 2021 at 11:36:06AM -0300, Leonardo Bras wrote:
> > > Because hypervisors may need to create HPTs without knowing the
> > > guest
> > > page size, the smallest used page-size (4k) may be chosen,
> > > resulting in
> > > a HPT that is possibly bigger than needed.
> > >=20
> > > On a guest with bigger page-sizes, the amount of entries for HTP
> > > may be
> > > too high, causing the guest to ask for a HPT resize-down on the
> > > first
> > > hotplug.
> > >=20
> > > This becomes a problem when HPT resize-down fails, and causes the
> > > HPT resize to be performed on every LMB added, until HPT size is
> > > compatible to guest memory size, causing a major slowdown.
> > >=20
> > > So, avoiding HPT resizing-down on hot-add significantly improves
> > > memory
> > > hotplug times.
> > >=20
> > > As an example, hotplugging 256GB on a 129GB guest took 710s without
> > > this
> > > patch, and 21s after applied.
> > >=20
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> >=20
> > Sorry it's taken me so long to look at these
> >=20
> > I don't love the extra statefulness that the 'shrinking' parameter
> > adds, but I can't see an elegant way to avoid it, so:
> >=20
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>=20
> np, thanks for reviewing!

Actually... I take that back.  With the subsequent patches my
discomfort with the complexity of implementing the batching grew.

I think I can see a simpler way - although it wasn't as clear as I
thought it might be, without some deep history on this feature.

What's going on here is pretty hard to follow, because it starts in
arch-specific code (arch/powerpc/platforms/pseries/hotplug-memory.c)
where it processes the add/remove requests, then goes into generic
code __add_memory() which eventually emerges back in arch specific
code (hash__create_section_mapping()).

The HPT resizing calls are in the "inner" arch specific section,
whereas it's only the outer arch section that has the information to
batch properly.  The mutex and 'shrinking' parameter in Leonardo's
code are all about conveying information from the outer to inner
section.

Now, I think the reason I had the resize calls in the inner section
was to accomodate the notion that a) pHyp might support resizing in
future, and it could come in through a different path with its drmgr
thingy and/or b) bare metal hash architectures might want to implement
hash resizing, and this would make at least part of the path common.

Given the decreasing relevance of hash MMUs, I think we can now safely
say neither of these is ever going to happen.

Therefore, we can simplify things by moving the HPT resize calls into
the pseries LMB code, instead of create/remove_section_mapping.  Then
to do batching without extra complications we just need this logic for
all resizes (both add and remove):

	let new_hpt_order =3D expected HPT size for new mem size;

	if (new_hpt_order > current_hpt_order)
		resize to new_hpt_order

	add/remove memory

	if (new_hpt_order < current_hpt_order - 1)
		resize to new_hpt_order


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JIXKiScEiqVqxi4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDARlkACgkQbDjKyiDZ
s5L1tRAAkuor5k1WYVSOmA9nSFxuvGLrZfHFGixzV8D5KZPdlEN7q3n7zx4XYhgl
OtbvwC6u9+K2C2m6+E4Nj/FWiycRgw7ZIBZgPSMQIzbWV4IB3UaYf72ZKT55E3q8
UONpFPaoi4xDic9lwMqUhf6vUrZ+l05GKV+osojSsNNxiSGuJ/6aOv301FSfptsK
D/lXVQYf1X2WLPWYJe2rJO3A/iWkhZ4UX0MrNRtfZ7WrRIFRuV4VCbfWqmcCuhI9
GBAGxSLB5VKRU8mTXTO1KQPLE32l0S+tknpMhAX/Vwp24E5DQDKoSBZvPIXPdi1q
QEnQT/5MokHSVd2obB944eLuylN5++PenUDbW/L+P9XyMIgvWJd6sIiFraqKOQNw
o32NJryjQ413KowxYIYa5vLVStWJ+AcQKVIIouzwKle5mGYSaBwXOh7kUjOMIFxh
QfNrOxtN5uWarxiVUbnVUM3BB425WJBP31jE+J7YnCi9tXtKAw5XBj2zaa4rxhvY
EgsUc1p3rz4PuI+jijBYI+KfBsTS6RaueB/LG4Fdl6PhIZuryfabbKSe4vtOLzUJ
ormnBmFEu9MPSpM3JoSON/UiDgjI1Ywm0W7VjtOyMc2BWXF/7E3gKSg6tMq//ePH
LaqFXRj6YlieGDbFMwNKr0aeY/KXAvGXsXMFmxYNyNaArZTbvMA=
=7p9d
-----END PGP SIGNATURE-----

--JIXKiScEiqVqxi4e--
