Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3C552382
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 20:05:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRcxq3qSyz3cfv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 04:05:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDbsfohM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PDbsfohM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRcxB6lJgz3brS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 04:04:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A33F961586;
	Mon, 20 Jun 2022 18:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8716C3411B;
	Mon, 20 Jun 2022 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655748282;
	bh=w6vacAfaqohw95S+mHKQgM+EKeWnz+yRbKl9pZAYgT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDbsfohMbYv3MffqWofo0S7UAM3OWif/Gh/rKbWiB5wStzqG5O9JTSUqCxbcdE0QC
	 R/gf2j1b5t9kZBUtQHuHnZCby4kToF6ZQz8v25NCzG35JTNUA9cascUN+S073vlodc
	 747BGINyYhkum55MlnQPY8NgidJYQETduCBfJE5A9qcQLGtD/NX5B3SDxToS08R8zW
	 QczCMm7/qmod4Dj1zd4PhHwZxjs0ft4iu8z/zXspS/6BzPCOojI/0tjp4NrGKMyer5
	 Yn4WJ/mWub0Pq9N6Cf4r5eu01pjH3Bh2o/AVSJBcJ8HwigExQEsdjrModduyoJzPRf
	 7e8dlrFn6tAOQ==
Date: Mon, 20 Jun 2022 19:04:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrC2tLI+nUxOGsIX@sirena.org.uk>
References: <AM6PR08MB43760A5F78137DAE68FE99C7FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VOCVAPjBvueWLvm9"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB43760A5F78137DAE68FE99C7FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Eran Matityahu <eran.m@variscite.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Alifer Willians de Moraes <alifer.m@variscite.com>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>, "festevam@gmail.com" <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--VOCVAPjBvueWLvm9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 05:52:43PM +0000, Pierluigi Passaro wrote:
> > > Just for my understanding, are you suggesting to set a device tree
> > > property to force a fixed behavior in the driver ?

> > Yes.

> Why should we use a fixed behavior ?

The things that are fixed by the design should be fixed.

> > The device shares pins between the line inputs and the DMIC inputs so at
> > least some of the configuration is going to be determinted at system
> > design time, that will fix the usable values of at least one of the
> > controls which ought to be reflected in the runtime behaviour.

> In our design we use:
> - pin 1: DMIC_CLK
> - pin 24: LINEIN2R
> - pin 26: LINEIN2L
> - pin 27: DMIC_DATA

> we have no pins shared among DMIC and LINEIN.

This means that DMICDAT2 is not usefully selectable at runtime, you've
got IN1 as digital and IN2 as analogue, so while the DMIC/ADC switch is
useful the DMIC1/2 switch is not.

--VOCVAPjBvueWLvm9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwtrMACgkQJNaLcl1U
h9AVVAf8CNJ1pKU5n40o+hAHDCPrpMkjTpft6KOXuI6XY7ImplHB1hCdT7Q6WATf
aBd0+QPrVbh1F8JPhUXGwsovT2NTqxO3mnuv8rf3W6/q+sBvebRFd6JFtqPixkRx
it74je2CMTZXE5dCFp/IC6RfN1A73ommQqkSbMHv/ISFBDJXFwCtBXCkip3sHmIu
ogp7fB7pZYgfsxh24nHeREBI+HAiwbqefgu7wDTBQ3DEIbWYq3xRffqucidYnUwp
yenPU0ysSpOEBZXcU9QxvKxlh+H3dPNF4xNKNHXzqIt3IPWJF2WFF4JLdxKGzvoF
pAKrexCNszAQZt19PrBca61dzOHDeg==
=G8Fe
-----END PGP SIGNATURE-----

--VOCVAPjBvueWLvm9--
