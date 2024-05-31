Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B43318D6652
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 18:07:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oNn7ecS+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrSgV6kzkz3fpl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 02:07:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oNn7ecS+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrSfn1KJJz3flj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 02:06:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99935CE1D13;
	Fri, 31 May 2024 16:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60699C116B1;
	Fri, 31 May 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171596;
	bh=xEdqlVv+yc6xxPC8F436pV7MA4qGjyS+19cc5fL/qdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNn7ecS+B1fnRsmy8+fl1HimszXdSyd42J3hvvDH6VHJHwaci4o+Ez3/vR/y4flHT
	 8aUVVrsXUEvmDdPEU3VsuOQAI6pib0urxj+kBakXS48rdyvD121L3v4+MlurlMs8q/
	 wkWU6mJcQCzyHSjOteiZcxQrXIAZU/nkb4DxRUGwSq0hBuUUZH37mkrkgT7NKDkGT9
	 AfgSO6wzjvces+aADq3LHoZdBoVTd/yqSQI2pvLq2lHLyb2BuiFxO2Gvq/I10XY++m
	 JzSw1s/zlo+7ZCXH99HZfZkwnpPe7283pyOHoxgiKzxImKdYesyl0n9HteStQ6EIyV
	 xjGVLgjyF8uXw==
Date: Fri, 31 May 2024 17:06:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <47a7a618-31d5-4dfc-9b6b-9426c6409e80@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
 <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
 <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk>
 <1220272166.706254.1717166894551.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yZnX6EMpaBNVB9zA"
Content-Disposition: inline
In-Reply-To: <1220272166.706254.1717166894551.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Serving suggestion.
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
Cc: devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, shengjiu wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--yZnX6EMpaBNVB9zA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 10:48:14AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>

> > Why not just use the existing compatible - why would someone not want to
> > be able to use the ASRC if it's available in their system?

> That's true but it will be a problem if both `fsl-asoc-card.c` and
> `imx-spdif.c` drivers have the same compatible, and they don't
> have the same DT properties.

So merge the two then?

--yZnX6EMpaBNVB9zA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZZ9YUACgkQJNaLcl1U
h9Ah0wf9F6py9uWrUIg1Rnm8ihwTDC9bWMpewQrTH27b7Ps5H2TxzLO6KV2GCTHH
bAcv+oyDym09iXKcPq3vvTrenJ0iPIaZWSOOwYS38JtGL5dAMnv07C3R6iWJJd98
z94n+vvDb3EL3UBU2+atXg0gUN5e4ekRdLRf7MmkjlGRszzVTuUafLdHUue4uPRw
gKDNcu2v2gC2e3OaZnA5jQh5ypP74fLrnWxyktzZg8acu482DkDBA7h13lSFCF7H
sZb+MsvHM7euPdKQ9nwfFk7bVErS0yb3PEPvNrd0ZJNvEE2aClUiFgNlKfNUY1hu
PvxfhbZEbZGiNyV8WXYwqtqGyzHB9w==
=o/G2
-----END PGP SIGNATURE-----

--yZnX6EMpaBNVB9zA--
