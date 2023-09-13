Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684379EFAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 19:00:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cPc5I0ZL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm6Cf6bfFz3c2X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 03:00:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cPc5I0ZL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm6Bm4gZ2z3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 03:00:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4E8D0CE23CB;
	Wed, 13 Sep 2023 16:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ACFC433C8;
	Wed, 13 Sep 2023 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694624397;
	bh=BnteqCpF/CAUK7DK9U9Ghtfp5dt4d9MfOz2/eAS/u7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPc5I0ZLysgdFaSm9d3iPjGsHib6No1WDfTfDNmZ8EJftw2ukgPJqbdTvFwfII6h5
	 XsjFCfQwy0hAhvcNI/zC1jAxOZx+xj3WkJy3PnXdFgBaTdKUmzEXfr8r119FUpA9ws
	 uEyzFAjE2f/LP5rj9F/N4Be4pbP/BK9uPoheaZ2R88lgsiTu9NUbtgyaz2XOX1oPZT
	 eklyhY3ZUUL2hQtxVd/re7fFxkttitCrig5ohr9Pm1WOgM5lChR8UOojrbVvjicS9G
	 gipMxf05N4nYGfN5v5g6bWOTb7T8iOMYlMWHXGVTPRzp+C5LHyalJK3Qgj/yIop80d
	 GuvQxVLkJ3wdg==
Date: Wed, 13 Sep 2023 17:59:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 24/31] net: wan: Add framer framework support
Message-ID: <e3245053-1d4c-4ee3-9e03-8a6ca54e26d1@sirena.org.uk>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101436.225781-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3d4xnD0OBUXwj5Mp"
Content-Disposition: inline
In-Reply-To: <20230912101436.225781-1-herve.codina@bootlin.com>
X-Cookie: Use extra care when cleaning on stairs.
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Simon Horman <horms@kernel.org>, li
 nuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--3d4xnD0OBUXwj5Mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 12:14:36PM +0200, Herve Codina wrote:
> A framer is a component in charge of an E1/T1 line interface.
> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> frames. It also provides information related to the E1/T1 line.
>=20
> The framer framework provides a set of APIs for the framer drivers
> (framer provider) to create/destroy a framer and APIs for the framer
> users (framer consumer) to obtain a reference to the framer, and
> use the framer.

If people are fine with this could we perhaps get it applied on a branch
with a tag?  That way we could cut down the size of the series a little
and I could apply the generic ASoC bit too, neither of the two patches
have any dependency on the actual hardware.

--3d4xnD0OBUXwj5Mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUB6oMACgkQJNaLcl1U
h9C6Xgf/eVzH2ZK88zsRlmvtdc+p6XZjgKPJFkUlIhE9Ma70SkaA+GvjpzFrSISC
0oFzEllaNXg3QA5Dql2eFFYQgtr5ubist5gEg7ySisIk/3GFEx1+bOqfE8Hd0wxS
EOmSRrnORoEywUsp1tI/CIh6s+FkPAwH0ZLtXwvWiKeWjQc8q9wKDnqqahC84N6Q
NESewhcaX2cQNfQXdyKGrnV9RVVSaVml3mQ4OvcjG21+FFq8IFvmn1HuLyhzj7ka
ACjNRWS9xgBsIqVyOOaYB2Ji62cf+WK4/DJig11BI34n9N7Tnbi80+kb0JX/WVno
ncpqIK4/jpD4JNn+BxeAIiICNG0cQw==
=nBcU
-----END PGP SIGNATURE-----

--3d4xnD0OBUXwj5Mp--
