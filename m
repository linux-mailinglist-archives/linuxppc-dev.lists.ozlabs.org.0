Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A668F380
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 17:40:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBm2n49yqz3f3g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 03:40:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rm1BIDwV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rm1BIDwV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBm1q073sz3bVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 03:39:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD4546172F;
	Wed,  8 Feb 2023 16:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C217C433EF;
	Wed,  8 Feb 2023 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675874394;
	bh=k2WDmJefTVbmF4UtYjVTRVt38vEfq5VHOD9s78R7eyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rm1BIDwVjM+vtyitHjo1e7C/8O3osDSw3ddUWkl4Wx2bC5t9PAYPPNOMyPOnhDGBE
	 x0/ntl8Z+mYIwUFJ4SJYgRaphWg6Yt4w739Gu/lXfntdZ6JeZX0Y+rfAbGvNs2ZHt8
	 st0eJcGbt8o4IXvW5Pd80HgnuHqj+dz7ZtRrgPBzs0UpJBQvPfkACmHMCJmVksp2u1
	 7j+OBIBzFLzMDdGcGKQCjlEbr0xBVw1CpjWop+Te/iJBfsS4i7ncKglT5iTBbI8VBo
	 HOM9qBR39AlYqQf2ZmUflFWYvSQAKch5roLODmzzrvB8D8QMKelVKI/xJc21XFfhdD
	 dus+tchf6H0SA==
Date: Wed, 8 Feb 2023 16:39:44 +0000
From: Mark Brown <broonie@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 04/26] arm/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <Y+PQUMwH4AZSVpjb@sirena.org.uk>
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-5-david@redhat.com>
 <Y+GcDFMNHw2cdDN1@sirena.org.uk>
 <39fd91e3-c93b-23c6-afc6-cbe473bb0ca9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W0tQR/5xWRekS1hu"
Content-Disposition: inline
In-Reply-To: <39fd91e3-c93b-23c6-afc6-cbe473bb0ca9@redhat.com>
X-Cookie: Walk softly and carry a megawatt laser.
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.
 org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--W0tQR/5xWRekS1hu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 03:12:06PM +0100, David Hildenbrand wrote:
> On 07.02.23 01:32, Mark Brown wrote:

> > Today's -next (and at least back to Friday, older logs are unclear - I
> > only noticed -next issues today) fails to NFS boot on an AT91SAM9G20-EK
> > (an old ARMv5 platform) with multi_v5_defconfig, a bisect appears to
> > point to this patch (20aae9eff5acd8f5 in today's -next) as the culprit.

> It's been in -next for quite a while, thanks for the report!

Yeah, there's been some other things obscuring the issue.

> Could you give the following a test?
>=20
>=20
> From 8c4bdbd9862f85782d5919d044c172b584063e83 Mon Sep 17 00:00:00 2001
> From: David Hildenbrand <david@redhat.com>
> Date: Wed, 8 Feb 2023 15:08:01 +0100
> Subject: [PATCH] arm/mm: Fix swp type masking in __swp_entry()
>=20
> We're masking with the number of type bits instead of the type mask, which
> is obviously wrong.

Tested-by: Mark Brown <broonie@kernel.org>

but note that I had to manually apply it, though it's pretty trivial so
I probably applied the right thing.

--W0tQR/5xWRekS1hu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPj0FAACgkQJNaLcl1U
h9C7hQf/VKRwP16M1jInUqUdUtyzPdvalnHTpasxKVZ8Sy0U3jwXMqNUqmnpEOSO
UB3Q8audVEzRc8pj92dk3jilZBDPHyP58UUKRsjkrZVz22Q2/R16FcjaLrdlwNlj
GWMfEWv5OKYPHaxP4W/VX0sXzS0XMTuulvAF1BOQRlOAS3L3jYsYUtzI2pkzJm1G
64ICND0ZQRerzQmdQd6oO2tVhymhv8Y1LPY4TT0HikINGVpwwCJoOiocmstgqqGW
uE+M+XJ9Lp/p78SIjfccjF1rdCWlc5MJJLS/qZzYnm6OnkKMOlBAUX9bwqvyrvE9
quDK6fshhrFo/uJ5YVAQnAEuDKLv9g==
=rC9E
-----END PGP SIGNATURE-----

--W0tQR/5xWRekS1hu--
