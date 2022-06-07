Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AB553FC02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 12:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHRt54jbjz3dv1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 20:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dvnmUkdN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dvnmUkdN;
	dkim-atps=neutral
X-Greylist: delayed 77341 seconds by postgrey-1.36 at boromir; Tue, 07 Jun 2022 20:48:06 AEST
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHRsL2Hz7z3cdY;
	Tue,  7 Jun 2022 20:48:03 +1000 (AEST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8AE33C0005;
	Tue,  7 Jun 2022 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654598874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq5/ssyPN5Y2d5mBYNCD8f8OJkz94AbXsY62iwSKIwk=;
	b=dvnmUkdNBgtcS2a46ed2tT2ngs19//jK3OYvXoJqzMjQ82TTe4fDkUNPnbINTFVZ9ntR03
	6mFmDyJ8H+yeQ4SYlEkluHLVJIUEV41V2AoxNv6REcRquM86cAt1d1s0Md1le6vMfO+2Z9
	kGyiACWguhKIT/NKA25XobYB8QTAi59XEjzZqqiqFhBLzzHuZM/jw++6plY2lpf5XvHDdp
	ElhYpXuRt62LVHSheq9LJ32GKQbTydvJxgwYwaVNXklcN3KO9cvB47IPBZLvI0/3UxdWRi
	ddcVEexyDY7gxd5IvFeEXJ8gueKYWoIk0nSfnbF23xUQmr4N/r5RYFPPenFdlA==
Date: Tue, 7 Jun 2022 12:47:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 00/14] mtd: Fix platform remove callbacks to always
 return 0
Message-ID: <20220607124746.20a2eaf0@xps-13>
In-Reply-To: <20220607093236.67txulke76mi6t75@ti.com>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
	<20220606151841.682a5939@xps-13>
	<20220607093236.67txulke76mi6t75@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joel Stanley <joel@jms.id.au>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>, Liang Yang <liang.yang@amlogic.com>, kernel@pengutronix.de, Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.or
 g, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pratyush, Uwe,

p.yadav@ti.com wrote on Tue, 7 Jun 2022 15:02:36 +0530:

> Hi Miquel,
>=20
> On 06/06/22 03:18PM, Miquel Raynal wrote:
> > Hi Folks,
> >=20
> > u.kleine-koenig@pengutronix.de wrote on Fri,  3 Jun 2022 23:07:44 +0200:
> >  =20
> > > Hello,
> > >=20
> > > this series prepares to make platform remove callbacks return void.
> > > Therefor first update them to always return 0. The rationale is that =
the
> > > Linux device model doesn't handle failures on remove and if a remove
> > > callback returns an error, it just emits a quite generic error message
> > > and still removes the device. =20
> >=20
> > Tudor, Pratyush, Richard, Vignesh,
> >=20
> > The series looks good to me (besides the atmel patch), I think it's
> > best to take it directly through mtd/next instead of going through all
> > the different internal branches, please let me know if you disagree
> > with the idea. =20
>=20
> Patch 2 does not look good to me. It modifies the aspeed-smc driver in=20
> drivers/mtd/spi-nor/controllers/ but the driver has been moved to=20
> drivers/spi/ in Mark's next branch [0]. The patch would likely conflict=20
> with that.
>=20
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit?id=3D9c63b846e6df43e5b3d31263f7db545f32deeda3

Right, I believe Uwe is sending per-subsystems series so now that he is
aware we can safely drop patch 2.

Thanks,
Miqu=C3=A8l
