Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA37D74AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 21:48:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=agL6oJC/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFzy71WM3z3cV2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 06:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=agL6oJC/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFzxF28K1z2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 06:48:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D66E0CE3844;
	Wed, 25 Oct 2023 19:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD50C433C7;
	Wed, 25 Oct 2023 19:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698263279;
	bh=h4BRsvufsuFwSxNjBiJ/P4K5+hKj62Otlj2Fx1zE7Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agL6oJC/Uo/LtgyG6fI1q5xGq6xxjN+xbfVkC2zmSbjh56jDwuehSxu9XNKIPLCcU
	 3ms5dxw7YS84RoE9b4FIFpThw8BOo8/Qm/56ptNZYnBA6mD+xezsYYBvqPkOVUyE6J
	 2GZJTDRahrOnO41NemvJcqoLHZy7pJSU/qcMvrOu2pH5QcSIdwngBfz3OrC/F0h9GF
	 JzA8BxCpieNh17KRvAnXvQ6+ZfrJLotTNuPCYxN4Vu0y++c63fNtBQWIaiuGYDxlTD
	 cHRt8KC5SOvuc8C2beUaF3Q5iNSU/GKATpljTdsdxt8Ayjq7gksKr1CT24oRtY6iuQ
	 VMsVsTwfelZfw==
Date: Wed, 25 Oct 2023 20:47:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer infrastructure
 and PEF2256 framer
Message-ID: <a02dd435-9b7b-418e-a87c-28fad56f8004@sirena.org.uk>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
 <20231013164647.7855f09a@kernel.org>
 <20231025170051.27dc83ea@bootlin.com>
 <20231025123215.5caca7d4@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVHY9B7BnvBaREJ9"
Content-Disposition: inline
In-Reply-To: <20231025123215.5caca7d4@kernel.org>
X-Cookie: There's no time like the pleasant.
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Simon Horman <horms@kernel.o
 rg>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--TVHY9B7BnvBaREJ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 12:32:15PM -0700, Jakub Kicinski wrote:
> On Wed, 25 Oct 2023 17:00:51 +0200 Herve Codina wrote:
> > > Which way will those patches go? Via some FSL SoC tree? =20

> > This series seems mature now.
> > What is the plan next in order to have it applied ?

> > Don't hesitate to tell me if you prefer split series.

> FWIW we are happy to take the drivers/net/ parts if there is no hard
> dependency. But there's no point taking that unless the SoC bits
> also go in for 6.7.

> Li Yang, what are your expectations WRT merging this series?

I did previously ask for the generic framer bit as a tag so I could
apply the ASoC part but nobody responded and I've been getting repeated
resends of the series :(

--TVHY9B7BnvBaREJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU5cN4ACgkQJNaLcl1U
h9BOigf/QB+M3jhpcGgpYNTcVVEM0JK0u1Vxzv91903ZwQlHKd6PSPWKFGwkPrbV
PkNR8xoBtGJp1rgu8AIQMhy8U+OFmf9Bsgc9Fzvakvb5/5oUOIAEyjCqLVOi9oVl
JiN7xM7bMd9vOk6g+b0UxRJjsF7+gqTYApUqigiblxG72qBLI0PYj9WauqiNNXkQ
stdLTuSDHBvXROKADqtlrjsSfU9kGw51/ZAILd4/s845m68TP4zRa9Ajz4vBWuRU
Re9dpEoBUQpd6lSkvAAlYJiYeOIeW2/EJqo1pU9areKbPkS4xwyKJKw4FQaXhwOA
hpVhGkXT/PcTml0V0pDfQyKUsbFWMA==
=1u2S
-----END PGP SIGNATURE-----

--TVHY9B7BnvBaREJ9--
