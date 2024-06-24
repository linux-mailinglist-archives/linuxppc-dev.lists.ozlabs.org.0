Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF169142EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 08:40:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Y2dSdUb7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6yxs59spz3cB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:40:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Y2dSdUb7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6yx82GHjz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 16:39:21 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1221C0006;
	Mon, 24 Jun 2024 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719211148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qQNy0cFi+vB5Mfp2npnGPe64P5YepXPolFgKOS6juw=;
	b=Y2dSdUb7L45w0zOH/hMoZ0jqJMRt2RztXSF8cdHFJOQrvsC2d2TrOTWPfcBntkFhwN7H6/
	hRjUcA+3RSAJ94uif8HqhAvbCWQJYiR+SVkX6EFFrYPEr/FW5wId9XKqYNzTH1dx6WDGG0
	EpHqQyHHRgNy3VsxGvF0BTOq9xL4A+TxAGxtKMeEP3applLc9/8N0v4h797ONHvRbmXNoB
	xidj39GDhF0L9I2O/NKLPWLoLxYKqnfunm/ZzhUtmDxgyWbMCW+SkvuckBwxpEg80TiaAu
	EQMC92N1cUsplO1EO00oEc1qOUwmVwAOuZV611xRbhs1I+WiDGN7XvJsNyxmEw==
Date: Mon, 24 Jun 2024 08:39:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Patch v4 08/10] mtd: rawnand: lpx32xx: Request DMA channels
 using DT entries
Message-ID: <20240624083900.14e38d82@xps-13>
In-Reply-To: <CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
	<20240620175657.358273-9-piotr.wojtaszczyk@timesys.com>
	<20240621103019.783271f4@xps-13>
	<CAG+cZ06GSxPsTzRLXSk23qWXMkp-qxYq7Z9av5-2cPHSJmVAHg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>, Michael Turquette <mturquette@baylibre.com>, Li Zetao <lizetao1@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>, Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Piotr,

piotr.wojtaszczyk@timesys.com wrote on Fri, 21 Jun 2024 14:44:21 +0200:

> On Fri, Jun 21, 2024 at 10:30=E2=80=AFAM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> >
> > Hi Piotr,
> >
> > piotr.wojtaszczyk@timesys.com wrote on Thu, 20 Jun 2024 19:56:39 +0200:
> > =20
> > > Move away from pl08x platform data towards device tree.
> > >
> > > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> =20
> >
> > I don't see any change regarding the NAND controller node in the device
> > tree, is there any dependency with other patches from the same patchset
> > or may I apply this directly to nand/next?
> >
> > Thanks,
> > Miqu=C3=A8l =20
>=20
> Yes, this patch depends on "[v4,04/10] ARM: dts: lpc32xx: Add missing
> dma and i2s properties"
> which will be splitted into two or more separate patches per request
> in the comments.
> I'd like to keep driver changes and corresponding changes in DTS in
> the same patch
> but I've made a separate patch for DTS per request from v2 of the patch s=
et.

These changes won't be applied to the same tries so they must be split.

So I will not take this patch for the next merge window and instead
will take it for the one after, if the DT patches have been applied.
Please ping me at -rc1 again if the DT patches have gone through.

Thanks,
Miqu=C3=A8l
