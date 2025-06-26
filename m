Return-Path: <linuxppc-dev+bounces-9804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D59AE9C30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 13:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSbXX37gcz2xYl;
	Thu, 26 Jun 2025 21:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750936124;
	cv=none; b=WMWMmLYwEUEyqDQkpthrK9lvn56oZfFuPZ0qrBgLsMjDfZW3eQjwJsSNIPJjhry8DojFwxIdatEJUH772NFqNdaE6v0isI/LRT2VcQGOteuqZgW11rhCjGmOjnVTHSjg/hWNdW5+/2cNw4sVPbKJT6h9ZaB0Xlejkj5W/vvckF6qlc9l7C1ahdC4frUnNDpc8V6qmB7ENloJCpoP9VWbz9JdroBgfE05G8ehiGdaLWoxn4V0xsWKHL0pMso12oEcKY2LtaZ9aYYRwFaRwVvDiRygfNgSf65erxWaq+FGnp1bTRbvWN0SJ09ZGIQoVdSrHvLNYyDUm2+8Z/5F36vnCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750936124; c=relaxed/relaxed;
	bh=up7Cs0PRFSAEYYIexNfbEfm+HjdkJ76x55E+y+QPstQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO+Qk+n5/VZAJpdq2IXFBaarOZit5Xm8N9fY/DRSbROgEgNVueMAOOAwtJCKrYlTZJQvDiVPAapOSy1SkxJvlLYJU+BZew2bK+gyQsDmVhsoE+NBd/KMuxP2FB84qUq9h0peXWFpfpd/1c99KGwS8xy0tIRdZ3ThOkK2XVy3SK3wh9opSm5rkWqDOWzHjG67/p2+G4BnCXzCuYupkpQCd8LbZAw0yO5ZzB9dZlG2cOBW5R6tASAgCn59sJlzmrmGnbJIv0B3b2N489g4y5/D+IpANaVzyAbqqppScZa449c6J1tr4sligKO0URXdIUZtuym6lpdN/hL0sYGWc2HkFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D+U7zJV4; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D+U7zJV4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSbXW00cwz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 21:08:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A407144F22;
	Thu, 26 Jun 2025 11:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D660C4CEEB;
	Thu, 26 Jun 2025 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750936120;
	bh=up7Cs0PRFSAEYYIexNfbEfm+HjdkJ76x55E+y+QPstQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+U7zJV4idWqfEM5gHGt2o+1C8t3tdx721UpgwtU0Epu+pjEbBa/VYRHV4BgrIm6w
	 M2mgTtV9FZBMNJBbr0Rx5DjdOp9959VO0YIOAF5LnubCdJS8y042DbxBUQ+6T9SZdh
	 R4zHirpioV7wBuwXZq6w0kNJj0yi5c+v6iV9nb6Tbv/9F87MhbWj6t9S4LD2ybC8ow
	 nFP3OFc+en+AEx90oX0A5tl1tsRm3xSXJtLXZeIbygEt+5prQ2veyML7Y6qy4SK9Nh
	 vb3klNPsdusKJEZgoIbURxCD3/ZRFqTDJ//uhBXGDrukPsV12gwFizFLhcBNQ1MzuU
	 suCHxygB/oGPw==
Date: Thu, 26 Jun 2025 12:08:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pieterjan Camerlynck <p.camerlynck@televic.com>,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Arun Raghavan <arun@asymptotic.io>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting
 in consumer mode
Message-ID: <aF0qMiPiNfDBXZld@finisterre.sirena.org.uk>
References: <20250625130648.201331-1-arun@arunraghavan.net>
 <20250625235757.68058-3-arun@arunraghavan.net>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K5z5oGHyWYUf3RoG"
Content-Disposition: inline
In-Reply-To: <20250625235757.68058-3-arun@arunraghavan.net>
X-Cookie: Do not cut switchbacks.
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--K5z5oGHyWYUf3RoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 07:56:16PM -0400, Arun Raghavan wrote:
> From: Arun Raghavan <arun@asymptotic.io>
>=20
> In a setup with an external clock provider, when running the receiver
> (arecord) and triggering an xrun with xrun_injection, we see a channel
> swap/offset. This happens sometimes when running only the receiver, but
> occurs reliably if a transmitter (aplay) is also concurrently running.

Please don't send new patches or versions in reply to old threads, it
makes it harder to follow what's going on.

--K5z5oGHyWYUf3RoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhdKi8ACgkQJNaLcl1U
h9A28wf+LigIwA5J/nqjjSzl5OykFKzStn0zkkz7CjEoM0S32nzT/hU7vMdAhhVl
0e9wF5rySlYduxZXG3Dhfw/4yPAPG/EudUxyaVw6Lpu7WjofNMQKZeDJgkpFp+nv
dsvj34UtK/HmHsE9EiuZfmbxWT9Mdk6q4EcZ6Fto/A17pYM177GMDXZcKir/+SWA
kzqN7tWuILE/thdnhkda9mKcmdm7kVh1cMI/qPt7NVNTcf+IrQBoIrxj02O+QqSr
4LyFMdg5OfMAUAslWpNgdvm2z7O+71PS6nFYGvxVeMuWc3L2qN8bG1WixPSjuMO/
11JrR/ldTRYL80Qgzz8+k6QYI3VIew==
=IlG0
-----END PGP SIGNATURE-----

--K5z5oGHyWYUf3RoG--

