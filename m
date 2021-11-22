Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1C0459022
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 15:23:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyTyP2TnKz3bhd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 01:23:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pa42aqND;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pa42aqND; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyTxh3lBpz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:22:32 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A50446023E;
 Mon, 22 Nov 2021 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637590944;
 bh=WKzltYKcWxxR0C3ceu4znEwrAGhBPzs0S1yq2paT+UY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pa42aqNDzulWRQi9OYypU8lYqnWjd/AgYdW+TB0RC1H/0owbOKtTb1kdVXY/obGu7
 zrNYvnC4z8kzKxth5diPD3kB7M5ir1Ctl6rlm2GeUUQb0P661lXvdQM808bBjNpXab
 SFbtDdSbLc7QjBAz9UaYKD4JOz9jjgkyaktulzKOOwU5Or5D2jRmHUFWFaWKyBphFv
 7ex/YGqtlVnGaILx/InZXt0AECbfrg+FAfTjeyBWvfHrPNLC9wNqoJsfInwEfYzUkT
 7Mq4rZVxQ/0Iphwozy55MUwJJ9mJ7q2r7OTLOANgZfjOl+G8si4bpByY7mA4GzXLd9
 EjL8PJCqM8yrA==
Date: Mon, 22 Nov 2021 14:22:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [RFC patch 2/5] ASoC: tlv320aic31xx: Add support for pll_r
 coefficient
Message-ID: <YZunmnHqemZRJ6JK@sirena.org.uk>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <20211119153248.419802-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PmgQRVULIqfojczT"
Content-Disposition: inline
In-Reply-To: <20211119153248.419802-3-ariel.dalessandro@collabora.com>
X-Cookie: Lake Erie died for your sins.
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
Cc: bkylerussell@gmail.com, lgirdwood@gmail.com,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 nicoleotsuka@gmail.com, perex@perex.cz, michael@amarulasolutions.com,
 festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--PmgQRVULIqfojczT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 12:32:45PM -0300, Ariel D'Alessandro wrote:
> When the clock used by the codec is BCLK, the operation parameters need
> to be calculated from input sample rate and format. Low frequency rates
> required different r multipliers, in order to achieve a higher PLL
> output frequency.
>=20
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Did Michael write this code (in which case there should be a From: from
him) or did he work on the code with you?  The signoffs are a little
confusing.

--PmgQRVULIqfojczT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGbp5oACgkQJNaLcl1U
h9CvBAf9GOA835hDgBLet04zGnfaBKpUlrl7hmECxdRr48Sa7/Px2zGXfjVQuTMm
DUlgYzbqInQKwYzyZc6fJZuckQ6rH1XE0I5abjYX2u1lmzxI+cZxFqXn36DIuzdh
vQ42B3TA6qTsYiXsu/gPqiOiXvnN/WQdTHY7tEI7EoOOBTZLJGqtMogLPC017BLL
nHeSmAeEnyWb3dPXEcgDGf5skYaKT9wTLIordEI801/mUn9a1vJO7eqFDSDcWoMe
U4uXqWun43CWTkzOa0TPQHx2/F3WGO5tOmnumCO+KYspRDmfGn2oh6dPsuF56IV1
kn4ax3imRAqnWphauh3/dilfO1kRsA==
=ZDS5
-----END PGP SIGNATURE-----

--PmgQRVULIqfojczT--
