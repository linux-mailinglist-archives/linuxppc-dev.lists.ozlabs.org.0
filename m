Return-Path: <linuxppc-dev+bounces-1-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 973CC94E67A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 08:19:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HJfjpsAY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj49J4rLyz2xbY;
	Mon, 12 Aug 2024 16:19:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HJfjpsAY;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj49J46T8z2xKg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 16:19:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723443554;
	bh=1WU3D8QXX/4bNu6+6CpJo24VJvpx3HDVfSMT6lZmwpM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HJfjpsAY9p7142Pd17wJsAU7ib7UgclzQLnMyo8kkipCNPFQKwYjO327RAebs2De7
	 F5T8CcgFPawm+ypCV4xHbgSgXcYkdMwnr5wNCksZ/RS87ShB4EhYs5jAZy/heE+sQt
	 YG5j1gz0cQXuxr26JWeSGNb+fgitifA8nCS2ImzBNQGQ/bj0BmapcU0c21AjMSGXzo
	 XPZiy09ddB6OGGORld2hZ4wP//GRyu9x+HPw/ONA4oEAAt3Ka5SCQnyW362yPlTkip
	 wAS+/6zU3vJ8jMpWUMeyDNw7GkksAf1MabxJ+SJBYfdmgik+IhjWLZYSS9qpCt6JEK
	 MidSAIuzFCwxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wj49F6R5tz4wx5;
	Mon, 12 Aug 2024 16:19:13 +1000 (AEST)
Date: Mon, 12 Aug 2024 16:19:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: List change - munging for From addresses
Message-ID: <20240812161913.082cd5ca@canb.auug.org.au>
In-Reply-To: <20240812155427.14dc2281@canb.auug.org.au>
References: <20240802130347.383a1b49@canb.auug.org.au>
	<20240802-agile-manipulative-dog-df4487@lemur>
	<20240805124204.49ed65df@canb.auug.org.au>
	<20240805-honored-weightless-kangaroo-71e79e@lemur>
	<20240812155427.14dc2281@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2x2WnltawwTf2PG9i0v8SDM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2x2WnltawwTf2PG9i0v8SDM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi ,

On Mon, 12 Aug 2024 15:54:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 5 Aug 2024 10:54:17 -0400 Konstantin Ryabitsev <konstantin@linuxf=
oundation.org> wrote:
> > =20
> So, I am going to try "mean and lean" (since I am the owner/moderator
> anyway).  Shortly (i.e. in the next hour or so), I will switch the
> linuxppc-dev mailing list to use Mlmmj.  Hopefully this will fix all
> our problems with DKIM/DMARC and delivery of posts from some domains.
>=20
> For the subscribers, to see how to manage you subscription, you will be
> able to end an email to <linuxppc-dev+help@lists.ozlabs.org> for
> instructions.  Hopefully you all won't find it too restrictive.
>=20
> Please report any problems with the list after the change to me.

The switch has happened, let's see how we go (starting wit this mail
:-)).

--=20
Cheers,
Stephen Rothwell

--Sig_/2x2WnltawwTf2PG9i0v8SDM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5qWEACgkQAVBC80lX
0Gx2bgf+O0A05615BVQJoeE9yfnKVZahTKA2Sp64m9xfU2GACVhtgfgFR8sdSNHY
4YMZDuyLWETQuJOmWJS1hAA0J2n5SNkM9dosHD3GDwmbYL0KRIcHHH1UdSEP+sLt
krADJTTCkmnxmRkc3t/nx1C4fxHjsNyoDcpeEQllpq//r5IeCf3xnvNjuw+rI3T2
oWcmNBoYt3kx2gnh/aRJe7SaCfs4kALhAPVP0ZYVaaXMBW8vJ2fzUE3kwuE6NJ2v
0mjlVCDOIlZ3MqZ4QZ1C8cmD5aWVjYHydjeU2sZZnluMVZe8xoOGnDnKndtJtY4E
vZiVusAx6tU2P31RIYzhcJDtG5/8oQ==
=kdDr
-----END PGP SIGNATURE-----

--Sig_/2x2WnltawwTf2PG9i0v8SDM--

