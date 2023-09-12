Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954479D3BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 16:32:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzfFF5eS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlQzJ6v5Rz3dH6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:32:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IzfFF5eS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlQyQ32Xxz3cJ0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 00:31:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A2F1BCE1AE5;
	Tue, 12 Sep 2023 14:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C545DC433C7;
	Tue, 12 Sep 2023 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694529113;
	bh=nCDXCDraqsGo2IZGYAIOuK+jrylfUNs1NltItNEvSsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzfFF5eS0jKjFYDvO5isyKITSFx9Gnoou/xv7WTkxJg7qowQ87WM6A8bDeU4fZUs1
	 v+AU3kBJHoO/qvhkLBzY1LHIpY+mFTnKXIPiUxYl/w3RS3wkGKbFB69UBKlSVcpHoO
	 R9UMiesRBocyKoVCX9r61gVBb0m6a5HpXfKUD+oA6NSEynLpVPIsfvefLOWbcbq1lx
	 JGxEqnf0JXnj8shzNl1oXaeaaONd/2cX0VDR3d3YkhmkxsgAFwQcbMbGIsdIR/eV5I
	 SgC7qCUyKhiuK2IY0LWMINLlX//w2erE1Q9rltkmWhDbYoOgH/htDJbxJx4vH1fshy
	 XtHNCvawzd3Vg==
Date: Tue, 12 Sep 2023 15:31:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256
 pinmux
Message-ID: <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101505.225899-1-herve.codina@bootlin.com>
 <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rHoxlvq7D/pkDAXf"
Content-Disposition: inline
In-Reply-To: <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
X-Cookie: Mickey Mouse wears a Spiro Agnew watch.
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Simon Horman <horms@kernel.org>, lin
 uxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rHoxlvq7D/pkDAXf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 01:04:56PM +0200, Linus Walleij wrote:
> On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@bootl=
in.com> wrote:

> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*

> I think SPDX mandates that you start the tag with C99 comments

> // SPDX-License-Identifier: GPL-2.0-only

Not for headers, they should use C style since they might be included in
contexts where C++ isn't supported.

--rHoxlvq7D/pkDAXf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUAdlAACgkQJNaLcl1U
h9AGMQf/fLsnOOVZlCeXkVRLWX87qtu4s7nr7P5jfwyYxnA4Bhl8MwftHW5rxDOf
TJcMOnHaQLx46ThWnYrWFopJsLO9g5x+NTP78wZTRCXJaJp4usJtpbNzUm4JAgfr
wJ7T2LLNlVFW5eJfODg+A+sL23DKqJ0B6MwZDixKhNM0tRYibE5ULV+DGzqxyvgz
yBkeRf5GWl9c4qVLP9Qg2VGx/9jbeOjiYGTd3LWeqJ6HxR8EItWZvKS72fGhOw+t
dp3VMrMnK9/HtTllRrE+m9GWdtkjG+FjaBGfp8LhzJ1IvYZb+Hyic+EVrTIQ+aC3
xmRd5GYPdrIG1w50Eci2Fa5Zqd4N4A==
=vkfj
-----END PGP SIGNATURE-----

--rHoxlvq7D/pkDAXf--
