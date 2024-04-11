Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C74D08A21DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 00:43:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=jW2k2sHO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFvr8492xz3vZl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 08:43:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=jW2k2sHO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFvqN5dm7z3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 08:43:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1712875392;
	bh=l6sGqsLkE9VvY8OPheWWPPl3KOp7bzJWio9ew4U591c=;
	h=Date:From:To:Cc:Subject:From;
	b=jW2k2sHORZZPkeGuVaDC2srfWSaAWGtAIWexg9Os3WXMombNRfGC2NscXnZzhZMub
	 8gky0KjFPHkffaD5m1rPm7cW0jR3pZOY6FgtAjbZ8TGSbzURADViNg2mS+k2Ig3uLQ
	 SsDjMktXxzg99SPmWJhsd6ETIi8DKkFANaS13wgCMt2M60yoIqWuaQVw2uaUaQnBp+
	 N8XJ1Z/cl7mtAW6uKKFxFuatA8GJNYp1FNJdwQxZWYiSyZGslfMmLnSC17+FJ0vgVS
	 srEqnGfX+RDmH9+D8Ul7Rkcr6s2n+DDTAlYbS4alexWdjkDWnRA84btp7sOclyJjpX
	 tlkNQDKcyek4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VFvqN3Xr9z4wcb;
	Fri, 12 Apr 2024 08:43:12 +1000 (AEST)
Date: Fri, 12 Apr 2024 08:43:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: duplicate patch in the driver-core.current tree
Message-ID: <20240412084310.035f018d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pbd5qS_hA7P5TURchJeP+18";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/Pbd5qS_hA7P5TURchJeP+18
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the powerpc-fixes tree as a different
commit (but the same patch):

  156539fd6501 ("Documentation: embargoed-hardware-issues.rst: Add myself f=
or Power")

This is commit

  36627111b568 ("Documentation: embargoed-hardware-issues.rst: Add myself f=
or Power")

in the powerpc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pbd5qS_hA7P5TURchJeP+18
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYYZ34ACgkQAVBC80lX
0Gw6eggAkf8O7uzCnhPw8CaP0yOZTph3HcrxefYLKfeFEmQU5VAow3gd61FRh0IE
5qz+8neJuwW9Wac0qgvgilJTD6Gj17250gkg/c8AEqCXWcCST2AvNIdGSLJKs9Hx
hIfIgr4LdbElWdKQzmbP1np2H2Ya1RROD8go5U/KHkRcEQRXge9GoOWsHWYqbCpk
hgcP+bmvmFXvqHGDephq2Tk91QaZz8zdk1PbWxZNyorb+DG3ZhbuwTDEV47SLwsP
sAib5wWi/JzdNKtcyaqxWuKJ9EL27TWdI3gU8D7fH1ZgFbkf9OhKZ8TwxtRriSrx
H/YR7H3IXoK2GGYXwNhZH+8aRPPgLQ==
=bYQM
-----END PGP SIGNATURE-----

--Sig_/Pbd5qS_hA7P5TURchJeP+18--
