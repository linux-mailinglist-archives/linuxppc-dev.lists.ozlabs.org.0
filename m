Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A2C76B1AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:24:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=f9mqi/1O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFWSf1Xc3z30PW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:24:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=f9mqi/1O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.198; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFWRp1Q1Gz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:24:05 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C9AFC0003;
	Tue,  1 Aug 2023 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690885443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh049SisoIWliG3uyLlXHzxD5wRc/J6bqr8r19ynpGo=;
	b=f9mqi/1Oxj+4XOaIlU22+7chRim64bLbHC89dhnq9NrYZHmPLGlNes8J8KY24lP6ZgYAlD
	eD6x5iT8jEr2zsXSVJJPvtYx5/BCSTIVTF4upPsbtDnfanTrKZzsr/NZcmTGpMMRPsbiwu
	MfI8n7wdawYwlc8X3XOv1bqEp5cuwBk81jBVGgET6qkiT/ubH6LAoCaSPNevEy1yMF9GlQ
	BgQ3xYH3kfMmnr/GZ5pgzGZmS4ZwoDWBx5Za0/Ne59WHOdLeHgCl4tpOQtBywFMYlG7Rki
	nuJbeHCb5FilfHYhV0dpg93ttgFZRXaEugYAZsyN24ghg5tiOBCl9ltTL4+hNA==
Date: Tue, 1 Aug 2023 12:23:59 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 10/28] soc: fsl: cpm1: qmc: Introduce
 qmc_chan_setup_tsa*
Message-ID: <20230801122359.6b22784c@bootlin.com>
In-Reply-To: <252d6a49-4a97-4ecc-844e-f23bda55debf@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
	<20230726150225.483464-11-herve.codina@bootlin.com>
	<252d6a49-4a97-4ecc-844e-f23bda55debf@lunn.ch>
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

On Tue, 1 Aug 2023 11:36:43 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +static inline void qmc_clrsetbits16(void __iomem *addr, u16 clr, u16 set)
> > +{
> > +	qmc_write16(addr, (qmc_read16(addr) & ~clr) | set);
> > +}
> > +  
> 
> Please don't use inline in .c files. Let the compiler decide.
> 
>        Andrew

Ok, I will remove the inline in the next iteration.
I will also remove the inline of all other similar functions (probably a
separate patch in the series).

Regards,
Hervé
