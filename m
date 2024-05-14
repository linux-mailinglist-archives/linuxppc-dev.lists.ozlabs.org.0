Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD28C5E22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 01:40:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hjwQVxMH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfCWz6HX3z3bWH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 09:40:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hjwQVxMH;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfCW84RG4z2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 09:39:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715729969;
	bh=e2DG3IsZ7oBBAa7Iqm6QtAfU5IGUt1i/2Q720aYvmQk=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=hjwQVxMHUXg37zvDok7hl1Iws2HyueP7nZqKM6GLZILfbTe7zq+Hzb7hjmTIFLXr1
	 F5Hvzte8p1mt3i/OnhQHn6cPRtQydE2zmEb/bVaMvpG+a9rH8nwYaZyEtlBP96H0F0
	 tGAKNdks6sJ64tsPjm58ytilMoO/JmOheqk4yxEWIVkKyb8BNFf9TsdCMKNLcgqIQ1
	 caghn+uDEB5FFin+d/bUsORVSGmXHmcC+qTXTbg8WAiTpnOymU8Qskys1obGn+S6Y5
	 D5ghTj565C0QzCv3fcQvzgNai37OcxeRHjLwvldzBiQBiaTgp/xQKFWq+VJYl6qTVU
	 +7U6A8xwSF1jg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfCW51fjDz4wb0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 09:39:29 +1000 (AEST)
Date: Wed, 15 May 2024 09:39:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Administrivia: remove old list address
Message-ID: <20240515093926.285c2e6a@canb.auug.org.au>
In-Reply-To: <20240503133213.680fe1f9@canb.auug.org.au>
References: <20240503133213.680fe1f9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0Xh=mM5JsjwlPx1/O7R.gWl";
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/0Xh=mM5JsjwlPx1/O7R.gWl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 May 2024 13:32:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Many years ago, linuxppc-dev was moved from ozlabs.org to
> lists.ozlabs.org.  These days most of the mail sent to linuxppc-dev
> @ozlabs.org is spam (causing added burden to the list owner i.e. me),
> so I intend to drop that name.  Initially, it will bounce with a
> message pointing to the new name, but after some time it will just
> bounce.

Having heard no nays, I have set up the "bounce with a message pointing
to the new name" action.

--=20
Cheers,
Stephen Rothwell

--Sig_/0Xh=mM5JsjwlPx1/O7R.gWl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZD9i4ACgkQAVBC80lX
0Gz+vwf/Wt4IAbeOcE+5smcNowgjqH29g7/31y9NRYUzvDCAfEcW52hL74JdBHNV
Ml77P7xkzAJoxdV3MAgQ3KeWnprj+byQJkfV/z/+eYATNWuszhDq++aGBKogw2Dy
A92tfl8yFXtO/fu+v9K9TU/C6MgWiOi76ilMM1iXXwUqkedc6L0HbipL+jr+2EqP
flp57m6bk9A8N/JfZxmcxFecnuHrnalXECUSOW/jQ4+rNWi1fmQZH69lVGkZSeh4
75UNUg7nS6+00LJ5PDjgeSURYN0JtiBxKzQbMI8E0o4a1E6Pb5x0OWDceykhHEJp
hUhHO8peZDS6pXfAIGa/LUpGOQgJYA==
=RhvV
-----END PGP SIGNATURE-----

--Sig_/0Xh=mM5JsjwlPx1/O7R.gWl--
