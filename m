Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE53A0D0E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 09:02:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0J2p3QWHz3bwM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 17:02:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=WM1nVdSY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=WM1nVdSY; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0J2L0qV1z2yRQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 17:02:18 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G0J2K13lPz9sRf; Wed,  9 Jun 2021 17:02:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623222137;
 bh=4m/RYQw+ykvKqTPlxfPVQz0sQ7S6mTcGNkg/VBAqJGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WM1nVdSY3T7V6f+jcXmncKbJPHY80L9XED5LaFFHZy6QhHQy0RR1eSfaUasPCZrvK
 pocd9do1+fQ/031/fgK4ZXrikndEpWM2atj2nokokAg6XZuUMk73nU8Y8sOFjC4JIO
 LYlFT1xYzO+dRvRiEuUeEOq6H/mA65vGVyRf0f8U=
Date: Wed, 9 Jun 2021 16:59:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/mm/hash: Avoid resizing-down HPT on first
 memory hotplug
Message-ID: <YMBm5ctf19lT4mj4@yekko>
References: <20210430143607.135005-1-leobras.c@gmail.com>
 <20210430143607.135005-2-leobras.c@gmail.com>
 <YL2obsnp4rWbW6CV@yekko>
 <648b382159009c5f4277d9b9c3f896142ea75d6c.camel@gmail.com>
 <YMBGW3RQOzoQxBqy@yekko>
 <a69f18159b90c5ede95e6d3769e224b883cc974f.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ub8InhVlSAu4bvbq"
Content-Disposition: inline
In-Reply-To: <a69f18159b90c5ede95e6d3769e224b883cc974f.camel@gmail.com>
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


--Ub8InhVlSAu4bvbq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 02:51:49AM -0300, Leonardo Br=C3=A1s wrote:
> On Wed, 2021-06-09 at 14:40 +1000, David Gibson wrote:
> > On Tue, Jun 08, 2021 at 09:52:10PM -0300, Leonardo Br=C3=A1s wrote:
> > > On Mon, 2021-06-07 at 15:02 +1000, David Gibson wrote:
> > > > On Fri, Apr 30, 2021 at 11:36:06AM -0300, Leonardo Bras wrote:
> > > > > Because hypervisors may need to create HPTs without knowing the
> > > > > guest
> > > > > page size, the smallest used page-size (4k) may be chosen,
> > > > > resulting in
> > > > > a HPT that is possibly bigger than needed.
> > > > >=20
> > > > > On a guest with bigger page-sizes, the amount of entries for
> > > > > HTP
> > > > > may be
> > > > > too high, causing the guest to ask for a HPT resize-down on the
> > > > > first
> > > > > hotplug.
> > > > >=20
> > > > > This becomes a problem when HPT resize-down fails, and causes
> > > > > the
> > > > > HPT resize to be performed on every LMB added, until HPT size
> > > > > is
> > > > > compatible to guest memory size, causing a major slowdown.
> > > > >=20
> > > > > So, avoiding HPT resizing-down on hot-add significantly
> > > > > improves
> > > > > memory
> > > > > hotplug times.
> > > > >=20
> > > > > As an example, hotplugging 256GB on a 129GB guest took 710s
> > > > > without
> > > > > this
> > > > > patch, and 21s after applied.
> > > > >=20
> > > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > >=20
> > > > Sorry it's taken me so long to look at these
> > > >=20
> > > > I don't love the extra statefulness that the 'shrinking'
> > > > parameter
> > > > adds, but I can't see an elegant way to avoid it, so:
> > > >=20
> > > > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > >=20
> > > np, thanks for reviewing!
> >=20
> > Actually... I take that back.=C2=A0 With the subsequent patches my
> > discomfort with the complexity of implementing the batching grew.
> >=20
> > I think I can see a simpler way - although it wasn't as clear as I
> > thought it might be, without some deep history on this feature.
> >=20
> > What's going on here is pretty hard to follow, because it starts in
> > arch-specific code (arch/powerpc/platforms/pseries/hotplug-memory.c)
> > where it processes the add/remove requests, then goes into generic
> > code __add_memory() which eventually emerges back in arch specific
> > code (hash__create_section_mapping()).
> >=20
> > The HPT resizing calls are in the "inner" arch specific section,
> > whereas it's only the outer arch section that has the information to
> > batch properly.=C2=A0 The mutex and 'shrinking' parameter in Leonardo's
> > code are all about conveying information from the outer to inner
> > section.
> >=20
> > Now, I think the reason I had the resize calls in the inner section
> > was to accomodate the notion that a) pHyp might support resizing in
> > future, and it could come in through a different path with its drmgr
> > thingy and/or b) bare metal hash architectures might want to
> > implement
> > hash resizing, and this would make at least part of the path common.
> >=20
> > Given the decreasing relevance of hash MMUs, I think we can now
> > safely
> > say neither of these is ever going to happen.
> >=20
> > Therefore, we can simplify things by moving the HPT resize calls into
> > the pseries LMB code, instead of create/remove_section_mapping.=C2=A0 T=
hen
> > to do batching without extra complications we just need this logic
> > for
> > all resizes (both add and remove):
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0let new_hpt_order =3D e=
xpected HPT size for new mem size;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (new_hpt_order > cur=
rent_hpt_order)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0resize to new_hpt_order
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0add/remove memory
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (new_hpt_order < cur=
rent_hpt_order - 1)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0resize to new_hpt_order
> >=20
> >=20
>=20
>=20
> Ok, that really does seem to simplify a lot the batching.
>=20
> Question:
> by LMB code, you mean dlpar_memory_{add,remove}_by_* ?
> (dealing only with dlpar_{add,remove}_lmb() would not be enough to deal
> with batching)

I was thinking of a two stage process.  First moving the resizes to
dlpar_{add,remote}_lmb() (not changing behaviour for the pseries dlpar
path), then implementing the batching by moving to the {add,remove}_by
functions.

But..

> In my 3/3 rep=C4=BAy I sent you some other examples of functions that
> currently end up calling resize_hpt_for_hotplug() without comming from=C2=
=A0
> hotplug-memory.c. Is that ok that they do not call it anymore?

=2E.as I replied there, I was wrong about it being safe to move the
resizes all to the pseries dlpar code.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Ub8InhVlSAu4bvbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDAZuUACgkQbDjKyiDZ
s5KODw/+Nz8CHW3Qkmd6dC7LfZ5F7LrdVZBnSSveTKnswcwJSZjMAdHmseCGlN7t
l9Sx8JPQapLGcqGbBFIZmFgc99IR3t3xlfibclMbUcNgQ9NMIdj29CvZQZphQHFr
2MAGPykp8j86UT7WsLauH6FQb34Cn7hsfZg2e2WLAVA1Coc95XvnJd1ApRugjhAF
m/aOW8wI1l7VsyQ2xmFv3AiKVS8gxVl80L9YLEz3aG5EwCowcz9HWPE55zY3KoOs
68AxHjUO2JYPBGgtBBuhZAGZYNjBYyYwnCu533rn0NnoS1lhXLDtBMIQbUckb9f3
+fFEq5cpIpx+Wss4QsBxQtpPQgNaeOhqaFLl5C1DJ2Cnn9i00emH1d6dbUpgyC3R
vkY/8xjzsYZTHs+a7XgkidfPpOIAQLMiQNA2RhJjDiLCDwSBjI90Gkst1/hG2+z1
cJu3oOVlHi2DM67eWEw/3pc7vKLxZCG9JwMkUdQa5EdUidnakSxUcOVJ5TKzBeDr
rblMh5uZ5+JGuFInN2f0rCgCA7dG4wegiMXQlNCC+mszK+bvRVOSZO01pWTfzvT+
2chriHSLQ98JrEONtpwzWe3ATgOflIlRqjBgDGnxrD8CR7k1wvyLQFI60dnzYzCq
i6j7rVGJzL3da2qY0fgenTERP6Ul31z5sijyeEuvsb/sf1siOPk=
=mgBM
-----END PGP SIGNATURE-----

--Ub8InhVlSAu4bvbq--
