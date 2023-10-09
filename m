Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BF7BE69D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 18:37:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ukqTw6yA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S44Sl0m2Bz3cRN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 03:37:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ukqTw6yA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S44Rv6gWNz3c76
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 03:36:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46E81CE181B;
	Mon,  9 Oct 2023 16:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2AFC433CC;
	Mon,  9 Oct 2023 16:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696869401;
	bh=jUtlqwEMn2KZFHhL84vsbzy62E/jQ9IHVeiIR+dgdME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukqTw6yAx9xZXzZu/8PsJbg/qq6AWNoyLzpX1TYC5EftTWC6ToteJaTiXhf6PzU0A
	 5wBCFj8oWtwhs9tVStKAZr5mZup5lvq9UU+J5l/qQsK2Dji9GMKDD1iDfHUP/Uwi98
	 vFd2kqCFIDYnbZrH0Xd3OicQR0UKp48FW3OnDlWpAwCujwIZXWRyiB5Wj8rtpAjlwc
	 4hDYebItl9tJtJ2PVIOfJ+bsFq6JmBAJrt0ungX/IrpO3fOlCe0nufcGBkNDiupZ2H
	 W67NEICrBvwMrkpjALwW0wf1QrN3tLRLHAFMz3Wh2TYHwUG4R4ngZBlYHgFjostCPW
	 wEQrpOfY+Ln0w==
Date: Mon, 9 Oct 2023 17:36:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [EXT] Re: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List
 DAPM endpoints ignoring system suspend
Message-ID: <50ad5eed-325c-457b-976e-4ffcf7696938@sirena.org.uk>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
 <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
 <DB9PR04MB94987AC750B4AB02DCBC44C8E3C2A@DB9PR04MB9498.eurprd04.prod.outlook.com>
 <ZRP2A1hvuB8ZymBK@finisterre.sirena.org.uk>
 <DB9PR04MB9498352BC1763048B8358D97E3C8A@DB9PR04MB9498.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YpmdxlIGHB5pmEP7"
Content-Disposition: inline
In-Reply-To: <DB9PR04MB9498352BC1763048B8358D97E3C8A@DB9PR04MB9498.eurprd04.prod.outlook.com>
X-Cookie: What is the sound of one hand clapping?
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


--YpmdxlIGHB5pmEP7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 11:13:49AM +0000, Chancel Liu wrote:

> Instead of "fsl,lpa-widgets", I would like to add a common property=20
> "ignore-suspend-widgets" in sound-card-common.yaml file. So not only rpmsg
> sound cards but also other sound cards which have such feature can use th=
is
> property to define wanted widgets ignoring suspend.
> What do you think about that?

We can perhaps bikeshed the name a bit to be more focused on the use
case but yes, that sounds reasonable.

--YpmdxlIGHB5pmEP7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUkLBEACgkQJNaLcl1U
h9BE7gf/e2k4KxlF2CXa8VUkiAAnGisQr0YxQGZ4hg6Qf2VNcqgvRgb12u3r5CqZ
MlMItmfRzSiUOhCXYtyl9Iq58MtkaxNK4iWbNCVrZ0+fvUvEI8B9C2izjeYR2Lwj
8RirJfNnircg4thI9oRxPgQEEIoK/SI5iAlI9RliJrADXD/EETYQ/iaJ778Rh1AN
RTNseFJXS+BHwZ7rP09Va1GsROiMb2P9xtRVxAw02wiE5dUge0h43O+3fRyY1yLo
9BmxluF+wyXuHiuaBR4hCvAyM8lvp5JWsRdgT+2z0MAWTXVwP6R2bTfs3Xnm4ej9
UnKuK53QIGytXgaFriLzbO2ZU4gIsw==
=r9Lx
-----END PGP SIGNATURE-----

--YpmdxlIGHB5pmEP7--
