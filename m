Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A85522D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 19:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRcN74Rc9z3cgB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 03:39:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2q2bkio;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2q2bkio;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRcMT06b8z3bkQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 03:39:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 22CD0B812A8;
	Mon, 20 Jun 2022 17:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FF1C3411B;
	Mon, 20 Jun 2022 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655746734;
	bh=jCwwSbElt83m1PQ7z2IHVu8qIm0sTyIZfWwdyaDXEQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2q2bkioPo6HKogBWHFyliQxaUyYq4YadB4+we/O/kmjDp2ubf8jEByZzv2C1QZeg
	 hrO8b1Tzg74CpGc68N9s8iDq6ieZyCQT1QkyAMjcBQZ4Y3DAKcu7akqiN6I+fn/U86
	 NTHNCRCwRQwl8V9dLT2oQ0VoUib8vhdriDganxqrsl10KvsvypFY4QO1+j1AurQ62U
	 56raSyAcpfFlQk4E7TbEJSGMydpmzHHI68czU4V/IoOWkyuupgdgnBVNShYSda2idy
	 Gqum8+7O+1hv8lzELpb3UQQ+2fMw9sWBn0h5KgZEnHECBVoIldbeAxre/5y3xmJKUu
	 OrcId64AICnaw==
Date: Mon, 20 Jun 2022 18:38:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrCwqKeHQJe/Tzzi@sirena.org.uk>
References: <AM6PR08MB437600972B26E3A56E1190C0FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fom1qi4IkRF41iWN"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB437600972B26E3A56E1190C0FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
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


--fom1qi4IkRF41iWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 03:30:45PM +0000, Pierluigi Passaro wrote:

> Just for my understanding, are you suggesting to set a device tree property to force a fixed behavior in the driver ?

Yes.

> WM8904 allows using both a DMIC and LINEIN, switching between one or the other and this is how we currently use it.
> Why the user should not be allowed to switch between DMIC and LINEIN ?

The device shares pins between the line inputs and the DMIC inputs so at
least some of the configuration is going to be determinted at system
design time, that will fix the usable values of at least one of the
controls which ought to be reflected in the runtime behaviour.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--fom1qi4IkRF41iWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwsKcACgkQJNaLcl1U
h9CUdwf+JtglBbVYwWNdDwBJD3f6LDH+Nl/J2ZnnHyJ6UdOmqtk7L+sj0nDb4Q/U
2syrbcHJ/dHoJMRrdT/UXGhbeWCeZ4eQIbkY8hR8cRZQUteNZI73B9ccXbhMDAhf
GHiJAE4dQWqj0ziFIGLbR9uhsOL26AYd65dgKRDOnSvA1kyWM6f+UwvGH3Xs2Rfd
I8Ni+NwD2VBKJCzINFsEFqecPl7885vtD95jTnqu2eeDysBbEQ/Iuyh8h2G407gv
gSy6lMRRQUAHu8lX5vOOWKgAXi/5rv9jy+gI89b8iehRkMreEZ78kBHtIU6FnCMf
RPkRUcBSL7sTTTErsDGRhSUDVJmYBw==
=1FAH
-----END PGP SIGNATURE-----

--fom1qi4IkRF41iWN--
