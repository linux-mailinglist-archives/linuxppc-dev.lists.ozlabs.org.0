Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E69776B05A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:06:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=H3+g77sX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFW403gw1z3cN4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:06:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=H3+g77sX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.197; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFW2D1L0rz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:05:21 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DE551C0012;
	Tue,  1 Aug 2023 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690884315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSVB+HORSFsnXDmjVg67aSWP2rANROm59byfAHhHD0Y=;
	b=H3+g77sXqmhMiUD9cLYfYWHOIVyYaAAYK3S6orraq++QkO4KEPeDisG+ZrlTgTA5FpWvKu
	69gaGhOPX+b8Lggqcv5DbCT0WtLbny4lOhHNeGu2Ndjj3nIYbC3SzM5ixLuleezrP3/GYL
	5wvk9vgnF24HM+baeEJ3BmpWjahI4i5fge3JTVMe9EmMLUTtwb/ZAliplzCM5qZU13rsEO
	7vUl/ArcrY7p6p8npXU92BVujGKBPxxWvqIuZHuk99NXtqsfCLiewRCtG+M4ycbXPoFd5/
	22qw57nzEewvcaWgfHT2vgGimy6CmMvgiMnA62C50o4su4myL978d2bjQcLMjQ==
Date: Tue, 1 Aug 2023 12:05:10 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 08/28] soc: fsl: cpm1: qmc: Introduce available
 timeslots masks
Message-ID: <20230801120510.1ac862de@bootlin.com>
In-Reply-To: <dd34fa03-0b34-44a4-9e70-9d9a69f95403@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-9-herve.codina@bootlin.com>
	<dd34fa03-0b34-44a4-9e70-9d9a69f95403@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Aug 2023 11:33:39 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, Jul 26, 2023 at 05:02:04PM +0200, Herve Codina wrote:
> > Available timeslots masks define timeslots available for the related
> > channel. These timeslots are defined by the QMC binding.
> > 
> > Timeslots used are initialized to available timeslots but can be a
> > subset of available timeslots.
> > This prepares the dynamic timeslots management (ie. changing timeslots
> > at runtime).
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  drivers/soc/fsl/qe/qmc.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> > index 2d2a9d88ba6c..21ad7e79e7bd 100644
> > --- a/drivers/soc/fsl/qe/qmc.c
> > +++ b/drivers/soc/fsl/qe/qmc.c
> > @@ -177,7 +177,9 @@ struct qmc_chan {
> >  	struct qmc *qmc;
> >  	void __iomem *s_param;
> >  	enum qmc_mode mode;
> > +	u64	tx_ts_mask_avail;
> >  	u64	tx_ts_mask;
> > +	u64	rx_ts_mask_avail;
> >  	u64	rx_ts_mask;  
> 
> Is this for E1? So there is a maximum of 32 slots? A u32 would be
> sufficient i think?
> 

The QMC can use up to 64 slots. So masks related to the QMC are on 64bits.
These masks are not specific to the E1 framer but really related to the QMC
capabilities.

Regards,
Hervé
