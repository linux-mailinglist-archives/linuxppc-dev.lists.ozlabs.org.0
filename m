Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF57B001D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 11:30:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I46iMBzn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwWYg61Rbz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 19:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I46iMBzn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwWXp2BTpz2yW6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 19:29:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19E576163D;
	Wed, 27 Sep 2023 09:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BF5C433C7;
	Wed, 27 Sep 2023 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695806981;
	bh=PoynAhC42Ct+N5LxHx/oBa8Zl3onSqNPhKu1yqqfuCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I46iMBznA20yjD8uhY5Qh9Ki6oMk1pBVm3P7nWXi/Mt6g5XG/sSBgeI+alGlhDjyv
	 Rp+wcfJ+1yNmiLkI99DrGrHYZ57KbA+kccDiooBhQPHxymj/oL5MCv0lxJAVPnAn0c
	 y9Ds7V8pNS/a4vQqy/nJD5Jo19U6zjcNoNokZKHlMZLpNbPHtCZeCDEbJDpQ5STvGa
	 tV0DK2K8ZhNPWhyjn2iIrCcc5mUAHbMHsupiyOzBrUjFuJEznhfEXWM8puzd8oxvMX
	 Kk2fxTFBxUct64Pg2DCGj4ceXwRsSe0W1gsCVHN/P3jRUPsls15U3mfVG7+Dn1TxKa
	 A+sG9yBWlHU5Q==
Date: Wed, 27 Sep 2023 11:29:39 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM
 endpoints ignoring system suspend
Message-ID: <ZRP2A1hvuB8ZymBK@finisterre.sirena.org.uk>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
 <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
 <DB9PR04MB94987AC750B4AB02DCBC44C8E3C2A@DB9PR04MB9498.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M0KDERL2YfXElnfx"
Content-Disposition: inline
In-Reply-To: <DB9PR04MB94987AC750B4AB02DCBC44C8E3C2A@DB9PR04MB9498.eurprd04.prod.outlook.com>
X-Cookie: Save energy:  Drive a smaller shell.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--M0KDERL2YfXElnfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 27, 2023 at 03:07:49AM +0000, Chancel Liu wrote:

> > This is a fairly standard DSP playback case as far as I can see so it
> > should work with DAPM without needing this obviously use case specific
> > stuff peering into the Linux implementation.  Generally this is done by
> > tagging endpoint widgets and DAIs as ignore_suspend, DAPM will then
> > figure out the rest of the widgets in the path.

> Yes, indeed I meant to let driver get DAPM endpoints from the "fsl,lpa-widgets"
> property and then set these endpoints as ignore_suspend if the sound card is
> running in this use case. Do you think the description for the use case can be
> simplified since it's a common use case?

This is a card problem - the driver for rpmsg shouldn't need to worry
about it.  Any bindings extensions should be at the card level rather
than in a specific driver, we could probably use something in the
generic properties that they're all using.

--M0KDERL2YfXElnfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUT9gIACgkQJNaLcl1U
h9Co/gf/YdAlws18Znc1Leg2ZPsdDGFeaWbgTuNgdJBfXu7DkM5EBpJwJitNdYBH
ee4d/A5s4cPYEwNBF6APc8Kuoo6ZLSzUUVTIoEVo3hx90x3VMkYHMG4ZrmbGHM1j
Q2Nb8wflfskYqPjLus1P4DcBWKulBIM1xfQGN3G4XZefa653qnNWGAoJLrIJr0BT
z5wh8S+9QtDJosvub7my40MWeV9d4i3yNywRESPCV7oFQd6c0WwDPrW6XxUClSEt
sKPmpp8TyP7AfzZoFiHYh3/97Qhm04LSjlNAybae7/XqRS6zFJGYi1rCSaT5Oaol
AklEsC5VrCYgCthrJITSvQd79yOuyg==
=w/+0
-----END PGP SIGNATURE-----

--M0KDERL2YfXElnfx--
