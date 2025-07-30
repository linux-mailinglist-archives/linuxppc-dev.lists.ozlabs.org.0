Return-Path: <linuxppc-dev+bounces-10465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68CB162DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 16:31:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsZRD59mxz3bkg;
	Thu, 31 Jul 2025 00:31:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753885912;
	cv=none; b=RUC+H2eLxLVbsr6ol2oCYrS+q6IFfBquVip8VyHTMieagxRyijvOAMoK1ecgMqpaQ3gaATNHhx4fEdiQFuVyFtXxsVx9KQyF8LKbncz7DD9xrNTWefv1cwYUz/mOzxpE0VseqLJtuPHUVFC72NUt9w3miM70N6spFl5tmkNMqiJd6b3BGrO/C+fuekcR0ZpisyBn91ZRfxevjIZAJZovfi8dEjNad3WIAcbSApvxXg8miZjhCbrF2BcrlmSYuIJPm58x7rwzGut9rnOivfbwNzhFiv/C1+x5uQH06/CGYiSeoAdtYyn3Oft4RTpDP29pCcoLm7672MY2QXNcvdXmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753885912; c=relaxed/relaxed;
	bh=kLrwclfc8DAyKhc5QwmGDJFM1rT+vOw8cAV0CK2t0ck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBEC0TnO+LSDNOfNg3QzsGWsFV0KShXgqlOx4yqpjDHDqXV52HI7nlPzRUEGoqulHD1ke3/rmlHwnx98bRv5TsjiK/7DZwhvlAdd/8cwpUCdnBACk7QSOYQh3/+heNE6JP6ZRm2hbZf7UVQ9Zxs6kKxxrxe4wfxvrVXZWZpjmjSCFf3h21IimMsX3toYB1l+RTkuz15vMypOGpT773t4baaw2oLhWfOyVtRnYBTEL7Is6LYxvSjjjRXB8vFC1/Cxh7q+MMUNkkaC2MaNL+Hq9BHnONs1vE6M4hLcpQhMr4kt+oupNiO/EjtaLCyi42ovfe3fMJnnWhz/4t9o6bE9gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=HmSkARWA; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=HmSkARWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsZRD2DCgz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 00:31:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753885693;
	bh=kLrwclfc8DAyKhc5QwmGDJFM1rT+vOw8cAV0CK2t0ck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HmSkARWA8cjqdgTiRSIMn9jPI5i6vhF9cgTtNKGSS0hLHzS/kTaYdkg67BEh5Lrfl
	 /lXeHSJTNhVY3iSaWjUkit63o4xSLdxFqCxOK+0mDINTWYWyXWwemq/wUau3pGNstu
	 mT9AzjafCKXyxm6o1/AYU46mX8f2ucve2e1Tbp0IRFP5+jncEOjqEMzRHUo5os4Mqp
	 gPf4tylysTZistakmtGvCUXQYQuHFlkqa+usPVWfbV11DjgLUJ/wkfBHMxKfVq/CEv
	 zxihRUFIuTTGIo7Xcpag/JmM9iDzk1PxzT0wYJDPbG4YHLsvnzAuNbBxvU1tnC3oW3
	 dzE8fhGShIZOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsZM12TVBz4x4m;
	Thu, 31 Jul 2025 00:28:12 +1000 (AEST)
Date: Thu, 31 Jul 2025 00:31:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Vishal
 Parmar <vishistriker@gmail.com>, Brigham Campbell <me@brighamcampbell.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20250731003149.3fa05f7f@canb.auug.org.au>
In-Reply-To: <87cy9hx272.fsf@trenco.lwn.net>
References: <20250730102931.6334022c@canb.auug.org.au>
	<87cy9hx272.fsf@trenco.lwn.net>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vUeU2YtpEMwmihA3.3V/gBH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/vUeU2YtpEMwmihA3.3V/gBH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Wed, 30 Jul 2025 07:01:21 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > Hi all,
> >
> > After merging the jc_docs tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found=
 in toctree: arch/powerpc/htm
> >
> > Introduced by commit
> >
> >   c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")
> >
> > interacting with commit
> >
> >   19122a7c28ed ("docs: powerpc: add htm.rst to toctree")
> >
> > from the powerpc tree. =20
>=20
> Did that just get added there?  I've had that fix since early June...I'd
> rather not drop it (and have to redo my 6.17 pull request) now if
> possible...

Yeah, it was added to the powerpc tree last night (or yesterday).  Just
tell Linus to take your version (I think) when he merges the 2 trees.

Or a fix patch could be sent after both are merged.
--=20
Cheers,
Stephen Rothwell

--Sig_/vUeU2YtpEMwmihA3.3V/gBH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKLNUACgkQAVBC80lX
0GyCTQf/ce5bU85QuQzMnMJ2JXqNVsue0OnGeTYvqrDZXbGvUAlKdtcTZeTT3Enm
p6F2fzNQVSyjtEYOnHhAxZuV2hu2SRxgCf6koPqttan09BZ+7b/b+IfRMFVngwrr
/eLdqSIDxa8MuT15imMXwBFSOYDuhehrrd8QtMn5Mw4m3jI6622oM1Od7zzM/6On
ooIP78j0KxrBRK+n9xYPBx8YCWBJStefBqE3WwR9YT8L/lwXEXtTwAgR675vmBar
UH/OqHDtBZg8hbogENY9kuWG3sOwxoznoUlLBGIm5QHEC0E4CnMPQ809lFlM5dPs
XsMMfr2LMiPNscb4PJsjeWAm9mQP1g==
=uJID
-----END PGP SIGNATURE-----

--Sig_/vUeU2YtpEMwmihA3.3V/gBH--

